// ARX javascript

// Imports
import { system, world, EntityComponentTypes, EquipmentSlot, Player } from "@minecraft/server"
import { getScore, setScore } from './scoresOperations'
import { increaseSkillProgress, wipeSkillsProgress } from './skillsOperations'
import { onFoodConsume } from './food/onConsume'
import { registerCharacter } from "./registerCharacter"
import { executeCommandDelayed } from "./executeCommandDelayed"

// Imports - Local
import './chat'
import './core/core'
import './items/on_use_general'

import './magic/on_use_magic_items'

import { registerPlayerVars } from "./registerPlayerVars"

// Игрок зашёл в мир
world.afterEvents.playerSpawn.subscribe((event) => {
    const player = event.player; // Получаем объект игрока
    player.nameTag = ""
    player.runCommand("function javascript/on_player_spawn")
    player.runCommand("function javascript/scores_autoreg")
    player.addTag("just_entered_arx")

    registerPlayerVars(player)

    if (world.getPlayers().length === 1) { // Если только один игрок в мире, т.е. только хостер
        player.runCommand("function world_reg/_world_reg") // Регистрируем переменные
    }
});

// Ломание блоков
world.afterEvents.playerBreakBlock.subscribe((breakEvent) => {
    breakEvent.player.runCommand("scoreboard players add @s count_broken_blocks 1")
})

// Постановка блоков
world.afterEvents.playerPlaceBlock.subscribe((placeEvent) => {
    placeEvent.player.runCommand("scoreboard players add @s count_placed_blocks 1")
})

// Получаем дистанцию между игроками
function getDistanceBetweenPlayers(player1, player2) {
    if (!(player1 instanceof Player) || !(player2 instanceof Player)) {
        console.warn("getDistanceBetweenPlayers: Оба параметра должны быть объектами Player!");
        return undefined;
    }

    const pos1 = player1.location;
    const pos2 = player2.location;

    const dx = pos2.x - pos1.x;
    const dy = pos2.y - pos1.y;
    const dz = pos2.z - pos1.z;

    return Math.sqrt(dx * dx + dy * dy + dz * dz);
}

// Взаимодействие с сущностями на пкм
world.afterEvents.playerInteractWithEntity.subscribe((interactEvent) => {
    if (interactEvent.target?.typeId == "minecraft:player") {
        // Поднимаем игрока
        {
            const taken = interactEvent.target // Взятый игрок
            const self = interactEvent.player // Поднимающий игрок

            // Определяем поворот камеры поднимаемого
            taken.runCommand('tag @s[rxm=80] add allow_carrying_by_cam_angle')
            const allow_carrying_by_cam_angle = taken.getTags().includes('allow_carrying_by_cam_angle')
            taken.removeTag('allow_carrying_by_cam_angle')

            if (self.getProperty("arx:is_knocked") == 0 && getDistanceBetweenPlayers(taken, self) < 1.5 && !self.getTags().includes('has_riders') && !self.getTags().includes('is_sneaking')) { // Базовая проверка, можем ли мы вообще кого-то нести

                if ((taken.getProperty("arx:is_knocked") != 0) || (taken.getTags().includes('is_sneaking') && allow_carrying_by_cam_angle && !taken.getTags().includes('is_moving'))) { // Если поднимаемый нокнут ИЛИ если поднимаемый НЕ нокнут, НО его можно взять
                    taken.runCommand(`ride @s start_riding ${self?.name} teleport_rider`)
                    taken.runCommand('event entity @s arx:property_is_knockout_set_true')
                    self.runCommand('playanimation @s animation.player.pick_up_knocked_player')
                }
            }
        }
    }
    // Создание персонажа в лобби
    else if (interactEvent.target?.typeId == "arx:lobby_character_creation") {
        registerCharacter(interactEvent.player)
    }
})

// При запуске мира
system.beforeEvents.startup.subscribe(initEvent => {
    initEvent.blockComponentRegistry.registerCustomComponent('arx:blockInteration', {
        onPlayerInteract(event) { // Взаимодействие с блоком через ПКМ
            let executeOnBlockPosition = `execute positioned ${event.block.location.x} ${event.block.location.y} ${event.block.location.z} run `
            switch (event.block.type.id) {

                // Таблички
                case "arx:ancient_nameplate_above_military_gate_in_e19": // ЗАМЕНИТЬ НА ТАБЛУ ПОРОЧНОГО ДЕМОНА
                    event.player.runCommand(executeOnBlockPosition + "function high_tec/nameplates/ancient_nameplate_above_military_gate_in_e19")
                    break

                // Капкан
                case "arx:iron_trap":
                    event.player.runCommand(executeOnBlockPosition + "function blocks/iron_trap/iron_trap_collapse_by_interaction")
                    break
                case "arx:iron_trap_collapsed":
                    event.player.runCommand(executeOnBlockPosition + "function blocks/iron_trap/iron_trap_open")
                    break

                // Меч порочного демона
                case "arx:vicious_demon_sword":
                    event.player.runCommand(executeOnBlockPosition + "function scull_temple/start_battle")
                    break

                // Мусорка
                case "arx:trash_can":
                    event.player.runCommand(executeOnBlockPosition + "function high_tec/talk_with_trash_can")
                    break

                // Табличка у порочного демона
                case "arx:ancient_nameplate_in_scull_temple":
                    event.player.runCommand(executeOnBlockPosition + "function high_tec/nameplates/ancient_nameplate_in_scull_temple")
                    break

                // Алтарь
                case "arx:divine_altar":
                    event.player.runCommand(`say 1`)
                    break

                // Растение хлопка
                case "arx:cotton_plant":
                    if (event.block.permutation.getState("arx:growth_stage") == 6) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", 4))
                        event.player.runCommand(executeOnBlockPosition + `loot spawn ~ ~ ~ loot "blocks/nature/cotton_plant_mature"`)
                    }
                    break
            }
        }
    });
    initEvent.blockComponentRegistry.registerCustomComponent('arx:onEntityStepOn', {
        onStepOn(event) { // Наступаение на блок
            let executeOnBlockPosition = `execute positioned ${event.block.location.x} ${event.block.location.y} ${event.block.location.z} run `
            switch (event.block.type.id) {

                // Таблички
                case "arx:mushroom":
                case "arx:mp_mushroom":
                case "arx:fly_agaric":
                    if (event.entity.typeId === "minecraft:player") {
                        event.entity.runCommand(executeOnBlockPosition + "fill ~ ~ ~ ~ ~ ~ air")
                    }
                    break

                // Капкан
                case "arx:iron_trap":
                    event.entity.runCommand(executeOnBlockPosition + "function blocks/iron_trap/iron_trap_collapse_by_step")
                    break
            }
        }
    });
    initEvent.blockComponentRegistry.registerCustomComponent('arx:onTick', {
        onTick(event) { // Тиканье блока
            let executeOnBlockPosition = `execute positioned ${event.block.location.x} ${event.block.location.y} ${event.block.location.z} run `
            let executeOnBlockPositionWithoutRun = `execute positioned ${event.block.location.x} ${event.block.location.y} ${event.block.location.z} `
            switch (event.block.type.id) {

                // Защитные конструкции
                case "arx:wooden_obstruction":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "damage @e[type=!item, r=1] 1 none")
                    break
                case "arx:iron_obstruction":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "damage @e[type=!item, r=1] 4 none")
                    break
                case "arx:chloronite_obstruction":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "damage @e[type=!item, r=1] 8 none")
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "effect @e[type=!item, r=1] fatal_poison 5 2")
                    break

                // Прерыватели магического передвижения
                case "arx:breaker_of_modified_moving_t1":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=8] add disable_magic_of_modified_moving_activate")
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=8] add disable_magic_of_modified_moving")
                    break
                case "arx:breaker_of_modified_moving_t2":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=16] add disable_magic_of_modified_moving_activate")
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=16] add disable_magic_of_modified_moving")
                    break
                case "arx:breaker_of_modified_moving_t3_":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=32] add disable_magic_of_modified_moving_activate")
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=32] add disable_magic_of_modified_moving")
                    break

                // Нагреватор
                case "arx:heater":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=16] add heating_by_heater_block_activate")
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "tag @a[r=16] add heating_by_heater_block_control")
                    break

                // Порочный кирпич
                case "arx:grim_stonebricks":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "particle arx:grim_stonebricks ~ ~ ~")
                    break

                // Горн
                case "arx:bugle_crafting_table":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "particle minecraft:lava_particle ~ ~1 ~")
                    break

                // Мангал
                case "arx:thermal_cooking_crafting_table":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "particle minecraft:campfire_smoke_particle ~ ~0.5 ~")
                    break

                // Стеклоплавильня
                case "arx:glassworks_crafting_table":
                    world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPosition + "particle minecraft:campfire_smoke_particle ~ ~1.5 ~")
                    break

                default:
                    if (event.block.type.id.startsWith("arx:dynamic_light_block")) {
                        world.getDimension(event.block.dimension.id).runCommand(executeOnBlockPositionWithoutRun + `unless entity @e[r=2, scores={dynamic_light_power=${event.block.type.id.slice(24)}}] run fill ~ ~ ~ ~ ~ ~ air`)
                    }
            }
        }
    });
    initEvent.blockComponentRegistry.registerCustomComponent('arx:onRandomTick', {
        onRandomTick(event) { // Рандомное тиканье блока
            let executeOnBlockPosition = `execute positioned ${event.block.location.x} ${event.block.location.y} ${event.block.location.z} run `
            switch (event.block.type.id) {

                // Растение чая
                case "arx:tea_corp":
                    if (event.block.permutation.getState("arx:growth_stage") < 4 && Math.random() < 0.15) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", event.block.permutation.getState("arx:growth_stage") + 1))
                    }
                    break

                // Ванильные растения
                case "arx:beetroots":
                    if (event.block.permutation.getState("arx:growth_stage") < 3 && Math.random() < 0.2) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", event.block.permutation.getState("arx:growth_stage") + 1))
                    }
                    break
                case "arx:carrots":
                    if (event.block.permutation.getState("arx:growth_stage") < 3 && Math.random() < 0.2) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", event.block.permutation.getState("arx:growth_stage") + 1))
                    }
                    break
                case "arx:potatoes":
                    if (event.block.permutation.getState("arx:growth_stage") < 3 && Math.random() < 0.2) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", event.block.permutation.getState("arx:growth_stage") + 1))
                    }
                    break

                // Хлопок
                case "arx:cotton_plant":
                    if (event.block.permutation.getState("arx:growth_stage") < 6 && Math.random() < 0.07) { // Проверям, не вырос ли уже до конца
                        event.block.setPermutation(event.block.permutation.withState("arx:growth_stage", event.block.permutation.getState("arx:growth_stage") + 1))
                    }
                    break
            }
        }
    });

    initEvent.itemComponentRegistry.registerCustomComponent('arx:onConsume', {
        onConsume(event) { // Юзание предмета на ПКМ
            onFoodConsume(event.source, event.itemStack.typeId)
        }
    });
});

// Смерти сущностей
world.afterEvents.entityDie.subscribe((dieEvent) => {
    if (dieEvent.deadEntity.typeId === "minecraft:player") {
        const player = dieEvent.deadEntity
        player.runCommand("summon arx:grave ^ ^ ^")
        wipeSkillsProgress(player)

        if (player.getProperty('arx:is_ghost') == true) {
            player.setDynamicProperty('ghostWithering', player.getDynamicProperty('ghostWithering') + 3000)
        }

        player.runCommand("function knockout_system/on_knockout")

        // Проверяем сторонние причины умереть по рп
        if (dieEvent.damageSource.cause === 'lava') {player.addTag('__force_to_rp_death__')}

        // Если мы должны умереть по рп
        if (player.hasTag("__force_to_rp_death__")) {
            player.removeTag('__force_to_rp_death__')

            player.runCommand('effect @s clear')
            player.runCommand('playsound mob.rat_eliminator.spawn @s ~ ~ ~')
            player.runCommand('event entity @s arx:property_is_knockout_set_0')

            player.runCommand('inputpermission set @s movement enabled')
            player.runCommand('inputpermission set @s camera enabled')

            player.setDynamicProperty('FiolixNarcoticPower', 0)
            player.setDynamicProperty('freezing', 0)

            setScore(player, "stress", 0)
            setScore(player, "knockout_row_sounter", 0)
            setScore(player, "respawn_delay", 0)
            setScore(player, "water_delay", 0)

            if (player.getProperty('arx:is_ghost')) { // Если призрак

                player.runCommand('title @s title §c= Вы окончательно погибли =')
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cТак и закончилась эта история. Вы погибли навсегда." } ] }`)
                player.setProperty('arx:is_ghost', false)
                player.setProperty('arx:bust_size', 0)
                executeCommandDelayed(player, 'function knockout_system/data_wipe/_wipe_main')
                executeCommandDelayed(player, 'clear @s')
                executeCommandDelayed(player, 'function tp/1_lobby')

                // Сносим переменные DP
                player.clearDynamicProperties()
                registerPlayerVars(player)

            } else { // Если не призрак

                player.runCommand('title @s title §c= Вы обращены в призрака =')
                executeCommandDelayed(player, 'effect @s invisibility 60 0 true')
                executeCommandDelayed(player, 'spreadplayers ~ ~ 0 300 @s')
                executeCommandDelayed(player, 'clear @s arx:slot_blocker')
                player.setDynamicProperty('ghostUltimateResistance', 180)

                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§c! §f§сВы былы убиты и обращены в §cПРИЗРАКА!§f. \n§c! §fВы §cСОВСЕМ НЕДОЛГО§f неуязвимы к солнцу и воде!\n§c! §fВы невидимы на протяжении минуты." } ] }`)
                player.setProperty('arx:is_ghost', true)

            }

        }
    }
})

// Попадание сняряда по сущности
world.afterEvents.projectileHitEntity.subscribe((hitEvent) => {
    if (hitEvent.source.typeId === "minecraft:player") {
        if (hitEvent.getEntityHit().entity.typeId != "arx:whipping_dummy" && hitEvent.getEntityHit().entity.typeId != "arx:grave" && hitEvent.source != hitEvent.getEntityHit().entity) {
            increaseSkillProgress(hitEvent.source, "shooting", 15)
        }
    }
})

function bleed(entity, intencity) {
    if (intencity > 0) {
        for (let i = 0; i < intencity * 5; i++) {
            entity.runCommand('particle arx:blood_drop_bright ~ ~0.2 ~')
        }
        for (let i = 0; i < intencity; i++) {
            entity.runCommand('particle arx:blood_drop_brightest ~ ~0.2 ~')
        }
        for (let i = 0; i < intencity * 2; i++) {
            entity.runCommand('particle arx:blood_drop_dark ~ ~0.2 ~')
        }
        if (intencity > 5) {
            entity.runCommand('particle arx:blood_drop_darkest ~ ~0.2 ~')
        }
    }
}

const bleedingMobs = ['minecraft:cow', 'minecraft:sheep', "arx:cave_rat"]

// Ранение сущности
world.afterEvents.entityHurt.subscribe((hurtEvent) => {
    const damager = hurtEvent.damageSource.damagingEntity
    const damaged = hurtEvent.hurtEntity
    const damageCause = hurtEvent.damageSource.cause

    // Если ранили игрока
    if (damaged.typeId === "minecraft:player") {
        const player = damaged
        if (damaged != damager && damageCause != 'campfire' && damageCause != 'contact' && damageCause != 'drowning' && damageCause != 'fall' && damageCause != 'magma' &&
            damageCause != 'soulCampfire' && damageCause != 'starve' && damageCause != 'suffocation' && damageCause != 'fire' && damageCause != 'fireTick' && damageCause != 'freezing') {

            increaseSkillProgress(damaged, "hp", hurtEvent.damage * 2)
        }

        // Кровь игрока
        if (damageCause != 'campfire' && damageCause != 'drowning' && damageCause != 'magma' && damageCause != 'soulCampfire' && damageCause != 'starve' && damageCause != 'suffocation' &&
            damageCause != 'fire' && damageCause != 'fireTick' && damageCause != 'freezing' && damageCause != 'lava') {

            let bloodIntencity = hurtEvent.damage - 2 // Определяем интенсивность кровотечения
            if (bloodIntencity > 100) { bloodIntencity = 100 }

            if (player.getProperty('arx:is_ghost') === false) {
                bleed(damaged, bloodIntencity)
            }
            else {
                player.runCommand("particle arx:ghost_blood ~ ~1.8 ~")
            }
        }
        // Стресс
        {
            let stressMultiplier
            getScore(player, "c_cowardly") == 1 ? stressMultiplier = 2 : stressMultiplier = 1

            setScore(player, "stress", getScore(player, 'stress') + hurtEvent.damage * 150 * stressMultiplier)
        }

        player.runCommand('function javascript/on_get_damage')
    }
    else if (damaged.typeId === "arx:whipping_dummy") { // Если ранили куклу для битья
        damaged?.runCommand(`tellraw @a[r=8] { "rawtext": [ { "text": "§cDMG >>> §l§f${hurtEvent.damage.toFixed(1)}" } ] }`)
        const randomIndex = Math.floor(Math.random() * 4 + 1)
        damaged?.runCommand(`effect @s instant_health 1 255 true`)

        if (damageCause != "fire" && damageCause != "fireTick" && damageCause != "lava") {
            damaged?.runCommand(`playanimation @s animation.whipping_dummy.on_hit${randomIndex}`)
            damaged?.runCommand(`playsound whipping_dummy.take_hit @a ~ ~ ~`)
            for (let i = 0; i < hurtEvent.damage; i++) {
                damaged?.runCommand('particle arx:whipping_dummy_filing ~ ~ ~')
            }
        }
    } else if (bleedingMobs.includes(damaged.typeId)) {
        bleed(damaged, hurtEvent.damage - 2)
    }

    // Если атакует игрок
    if (damager) { // Проверяем, есть ли вообще атакующая сущность
        // Если атакует игрок
        if (damager.typeId === "minecraft:player" && damageCause !== "projectile") {
            const weapon = damager.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)
            if (weapon !== undefined) { // Определяем, есть ли какие-то теги на том, чем наносим удар

                if (weapon.getTags().includes("is_dagger")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 20)
                    damager.addTag("is_dagger")
                }
                else if (weapon.getTags().includes("is_default_sword")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 30)
                    damager.addTag("is_default_sword")
                }
                else if (weapon.getTags().includes("is_heavy_sword")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 60)
                    damager.addTag("is_heavy_sword")
                }
                else if (weapon.getTags().includes("is_lance")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 40)
                    damager.addTag("is_lance")
                }
                else if (weapon.getTags().includes("is_long_sword")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 40)
                    damager.addTag("is_long_sword")
                }
                else if (weapon.getTags().includes("is_scythe")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 40)
                    damager.addTag("is_scythe")
                }
                else if (weapon.getTags().includes("is_staff")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 40)
                    damager.addTag("is_staff")
                }
                else if (weapon.getTags().includes("is_hheavy_sword")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 80)
                    damager.addTag("is_hheavy_sword")
                }
                else if (weapon.getTags().includes("is_wand")) {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 30)
                    damager.addTag("is_wand")
                }
                else {
                    damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 30)
                    damager.addTag("is_unarmed") // Например, игрок атакует куриным мясом. Оно не регистрируется, как оружие
                }
            }
            else { // Атакующий атакует руками
                damager.setDynamicProperty('attackCD', damager.getDynamicProperty('attackCD') + 30)
                damager.addTag("is_unarmed")
            }

            damager.runCommand("function attack/on_attack") // Запускаем функцию анализа атаки

            // Вкач. Проверяем, не бьем ли мы куклу для битья
            if (damaged.typeId !== "arx:whipping_dummy" && damaged.typeId !== "arx:grave" && damaged != damager) {
                // Увеличиваем силу
                increaseSkillProgress(damager, "strength", hurtEvent.damage * 2)

                // Увеличиваем выносливость, если мы с перегрузом
                if (getScore(damager, "heavy_result") > 0) {
                    increaseSkillProgress(damager, "endurance", hurtEvent.damage * 5)
                }
            }
        }
    }
})

// // Игрок использует предмет на блок
// world.afterEvents.entityHitBlock.subscribe((hitEvent) => {
//     console.warn(hitEvent.hitBlock.typeId)
// })