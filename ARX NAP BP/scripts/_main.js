// ARX javascript

// Imports - Minecraft
import { system, world, EntityComponentTypes, EquipmentSlot, Player, ItemStack } from "@minecraft/server"

// Imports - Arx functions 
import { getScore, setScore } from './scoresOperations'
import { increaseSkillProgress, wipeSkillsProgress } from './skillsOperations'
import { onFoodConsume } from './food/onConsume'
import { registerCharacter } from "./registerCharacter"
import { executeCommandDelayed } from "./executeCommandDelayed"
import { showDialog } from './dialogues'
import { isEntityInCube } from './core/music_core'
import { interactWithViciousDemonSpawner } from './bosses/vicious_demon'
import { weighAnalysis } from './weighAnalysis'

// Imports - Local scripts
import './chat'
import './core/core'
import './items/on_use_general'
import './magic/on_use_magic_items'
import './stabilityTesting'
import './camera/processCamera'
import './blocksHistory'

import { registerPlayerVars } from "./registerPlayerVars"
import { checkForItem } from "./checkForItem"
import { iDP, ssDP } from "./DPOperations"

// Инвентарь
world.afterEvents.playerInventoryItemChange.subscribe((event) => {
    const player = event.player

    // console.warn('Обнаружено взаимодействие с инвентарём')

    // Анализ поднимаемного игроком веса
    weighAnalysis(player)

    // Подмена яблок
    if (checkForItem(player, 'Inventory', 'minecraft:apple')) {
        player.runCommand('clear @s minecraft:apple 0 1')
        player.runCommand('give @s arx:apple')
    }

    // Проверка на меч модератора
    if (checkForItem(player, 'Inventory', 'arx:mod_sword') && getScore(player, "verify") !== 2) {
        console.warn(`${player.name} §cmod_sword`)
    }
})

// Игрок зашёл в мир
world.afterEvents.playerSpawn.subscribe((event) => {
    const player = event.player; // Получаем объект игрока
    player.nameTag = ""
    player.runCommand("function javascript/on_player_spawn")
    player.runCommand("function javascript/scores_autoreg")
    player.addTag("just_entered_arx")

    ssDP(player, 'camera:activeCamera', false)
    ssDP(player, 'camera:tickCountdownToNextTimecode', 0)
    ssDP(player, 'camera:numOfProcessedTimecodes', 0)

    registerPlayerVars(player)

    if (world.getPlayers().length === 1) { // Если только один игрок в мире, т.е. только хостер
        player.runCommand("function world_reg/_world_reg") // Регистрируем переменные
        player.runCommand('setmaxplayers 40')
    }
});

// Спавн сущностей
world.afterEvents.entitySpawn.subscribe((spawnEvent) => {
    if (spawnEvent.entity.typeId === 'arx:grave') {
        spawnEvent.entity.nameTag = 'Ударьте, чтобы\nполучить все вещи'
    }
    if (spawnEvent.entity.typeId === 'arx:hungry_rat' || spawnEvent.entity.typeId === 'arx:larva') {
        if (isEntityInCube(spawnEvent.entity, [-2274, 13, 1773], [-2205, 45, 1839]) || isEntityInCube(spawnEvent.entity, [-2225, 24, 1839], [-2255, 30, 1868])) {
            spawnEvent.entity.remove()
        }
    }
})

// Удары сущностей
world.afterEvents.entityHitEntity.subscribe((hitEvent) => {
    // Ударил игрок
    if (hitEvent.damagingEntity.typeId == 'minecraft:player') {
        // Мечом модератора
        if (checkForItem(hitEvent.damagingEntity, "Mainhand", "arx:mod_sword")) {
            if (hitEvent.damagingEntity.hasTag('is_sneaking')) {
                hitEvent.hitEntity.remove()
            } else {
                hitEvent.hitEntity.kill()
            }
        }
        // По гробу
        if (hitEvent.hitEntity.typeId === 'arx:grave' && hitEvent.damagingEntity.getProperty('arx:is_knocked') === false) {
            hitEvent.hitEntity.runCommand('kill @s')
        }
    }
})

// Постановка блоков
world.afterEvents.playerPlaceBlock.subscribe((placeEvent) => {
    // Увеличиваем счетчик поставленных блоков
    placeEvent.player.runCommand("scoreboard players add @s count_placed_blocks 1")
})

// Ломание блоков
world.afterEvents.playerBreakBlock.subscribe((breakEvent) => {
    // Увеличиваем счетчик сломаных блоков
    breakEvent.player.runCommand("scoreboard players add @s count_broken_blocks 1")
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

            if (self.getProperty("arx:is_knocked") == false && getDistanceBetweenPlayers(taken, self) < 1.5 && !self.getTags().includes('has_riders') && !self.getTags().includes('is_sneaking')) { // Базовая проверка, можем ли мы вообще кого-то нести

                if ((taken.getProperty("arx:is_knocked") != false) || (taken.getTags().includes('is_sneaking') && allow_carrying_by_cam_angle && !taken.getTags().includes('is_moving'))) { // Если поднимаемый нокнут ИЛИ если поднимаемый НЕ нокнут, НО его можно взять
                    taken.runCommand(`ride @s start_riding "${self?.name}" teleport_rider`)
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
    // Статуя Синриады у Порочных Садов
    else if (interactEvent.target?.typeId == "arx:statue_of_sinriada") {
        interactEvent.player.runCommand('function statues/statue_of_sinriada')
    }
    // Аси
    else if (interactEvent.target?.typeId == "arx:asi") {
        showDialog(interactEvent.player, 'asi', 'start')
    }
    // Газ в баре
    else if (interactEvent.target?.typeId == "arx:gasgolder_in_bar") {
        showDialog(interactEvent.player, 'gasgolder_in_bar_ch1', 'start')
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
                    interactWithViciousDemonSpawner(event.player)
                    break

                case "arx:piece_of_red_cloth":
                    event.player.sendMessage('§c§lКлочок красной ткани\n§r§f§oИнтересно, как он тут оказался?')
                    break

                case "arx:provolocka_diary":
                    event.player.sendMessage('§v§lРаскрытая тетрадь\n§r§fВ прошлый раз я в локациях древних нашла столько всего! Продала Фринцеру с Цугундером на 6 с половиной крайнцев. В этот раз я повышаю ставку - надо пройти через скрытый портал в Порочных Садах, там наверняка куча всего интересного.\nЯ осмотрела это загадочное дрвенее место. Оно очень необычное! Здесь есть стальная машина, я уже встречала такую - ей надо дать слиток железа, и она вернёт какую-то зеленую бумажку. Пустая трата ресурсов, да и к тому же эта машина, видать, сломана. Я нашла кучу всего, что можно вынести. Секунду, кажется я слышу шаги. Допишу позже')
                    break

                case "arx:ancient_iron_processor":
                    // if (checkForItem(event.player, 'Mainhand', 'minecraft:iron_ingot')) {
                    //     event.block.dimension.playSound('random.explode', event.block.location)

                    //     const stack1 = new ItemStack('arx:ancient_banknote', 3)
                    //     event.block.dimension.spawnItem(stack1, event.block.location)

                    //     const stack2 = new ItemStack('coal', 5)
                    //     event.block.dimension.spawnItem(stack2, event.block.location)

                    //     const stack3 = new ItemStack('arx:chrome_nugget', 3)
                    //     event.block.dimension.spawnItem(stack3, event.block.location)

                    //     const stack4 = new ItemStack('iron_ingot', 21)
                    //     event.block.dimension.spawnItem(stack4, event.block.location)

                    //     const stack5 = new ItemStack('arx:steel_protective_plate', 3)
                    //     event.block.dimension.spawnItem(stack5, event.block.location)

                    //     event.block.dimension.runCommand(executeOnBlockPosition + 'damage @a[r=8] 10 block_explosion')
                    //     event.block.dimension.spawnParticle('arx:dirty_fog', event.block.location)
                    //     event.block.dimension.runCommand(executeOnBlockPosition + 'fill ~ ~ ~ ~ ~ ~ air')
                    //     event.block.dimension.runCommand(executeOnBlockPosition + 'camera @a[r=8] fade time 0 0.5 1 color 200 20 10')
                    // }
                    // else {
                    //     event.player.sendMessage('§b§lМеталлическое устройство\n§r§o§fКажется, оно никак не реагирует, что бы вы ни делали')
                    // }


                    event.player.sendMessage('§b§lМеталлическое устройство\n§r§o§fКажется, оно никак не реагирует, что бы вы ни делали')

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
                    event.player.runCommand(`tellraw @s { "rawtext": [ { "text": "§fНанесите удар по непризрачному разумному вырубленному существу на этом алтаре, чтобы уничтожить его и получить перо Бога." } ] }`)
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
    // Если умер игрок
    if (dieEvent.deadEntity.typeId === "minecraft:player") {
        const player = dieEvent.deadEntity

        // Сообщаем о том, что произошло с игроком, если это его первый нокаут
        if (player.getDynamicProperty('hasEverBeenKnocked') !== true) {
            ssDP(player, 'hasEverBeenKnocked', true)
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "[§aГид§f] > §cВы в нокауте§f. Ничего страшного, это не смерть. Вы полежите около минуты и снова очнётесь. §aВаши вещи§f лежат рядом с вами в деревянном ящике (если они у вас вообще были)." } ] }`)
        }

        // Уменьшаем интоксикацию, если надо
        if (player.getDynamicProperty('intoxication') > 1200) {
            ssDP(player, 'intoxication', 1200)
        }

        // Спавним гроб
        player.runCommand("summon arx:grave ^ ^ ^")

        // Выдаем блокировщики слота
        player.runCommand(`give @s arx:slot_blocker 100 0 {"item_lock": { "mode": "lock_in_slot" } }`)
        player.runCommand(`kill @e[type=item, name="§r§cВы в нокауте, ваш инвентарь заблокирован", r=4]`)

        // Чистим данные о маги-фонарях
        player.runCommand('scoreboard players set @s allow_magilight 0')
        player.runCommand('scoreboard players set @s allow_archlight 0')

        // Выставляем данные о ноке
        player.runCommand('event entity @s arx:property_is_knockout_set_true')

        // Очищаем прогресс навыков
        wipeSkillsProgress(player)

        if (player.getProperty('arx:is_ghost') == true) {
            iDP(player, 'ghostWithering', 3000)
        }

        // Выставляем вариант анимации нокаута
        player.setProperty('arx:is_knocked_anim_var', Math.floor(Math.random() * 2))

        // Увеличиваем счетчик ряда беспрерывных нокаутов (2 = смерть по рп, и 3 если есть кристалл второй жизни)
        player.runCommand('scoreboard players add @s knockout_row_sounter 1')

        // Сбрасываем камеру
        player.runCommand('camera @s clear')

        // Плюсуем счётчик нокаутов
        player.runCommand('scoreboard players add @s count_death 1')

        // Стрессуем
        iDP(player, 'stress', 4000)

        // Выставляем откат нокаута
        ssDP(player, 'respawnDelay', 60 - player.getDynamicProperty('skill:fortitude_level') * 2)

        // Если мы должны умереть по рп
        if (getScore(player, 'knockout_row_sounter') >= 2) {

            player.runCommand('effect @s clear')
            player.runCommand('playsound mob.rat_eliminator.spawn @s ~ ~ ~')
            player.runCommand('event entity @s arx:property_is_knockout_set_0')

            player.runCommand('inputpermission set @s movement enabled')
            player.runCommand('inputpermission set @s camera enabled')

            ssDP(player, 'FiolixNarcoticPower', 0)
            ssDP(player, 'freezing', 0)
            ssDP(player, 'respawnDelay', 0)

            setScore(player, "knockout_row_sounter", 0)
            setScore(player, "water_delay", 0)

            if (player.getProperty('arx:is_ghost') === true) { // Если призрак

                console.warn(`Смерть призрака ${player.name}`)

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

                ssDP(player, 'verify', true)

            } else { // Если не призрак

                console.warn(`Смерть непризначного ${player.name}`)

                player.runCommand('title @s title §c= Вы обращены в призрака =')
                executeCommandDelayed(player, 'effect @s invisibility 60 0 true')
                executeCommandDelayed(player, 'spreadplayers ~ ~ 0 20 @s')
                executeCommandDelayed(player, 'clear @s arx:slot_blocker')
                ssDP(player, 'ghostUltimateResistance', 180)

                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§c! §f§сВы убиты и обращены в §cПРИЗРАКА!§f.\n§c! §fВы §cСОВСЕМ НЕДОЛГО§f неуязвимы к солнцу и воде!\n§c! §fВы невидимы на протяжении минуты." } ] }`)
                player.setProperty('arx:is_ghost', true)

            }

        }
    }
})

// Попадание сняряда по сущности
world.afterEvents.projectileHitEntity.subscribe((hitEvent) => {
    const damagedEntity = hitEvent.getEntityHit().entity
    const damager = hitEvent.source

    if (damager?.typeId === "minecraft:player" && hitEvent.projectile?.typeId === "minecraft:arrow") {

        if ((getEntityFamilies(damagedEntity).includes('mob') || getEntityFamilies(damagedEntity).includes('animal') || getEntityFamilies(damagedEntity).includes('monster') || damagedEntity.typeId === 'player') &&
            damager != damagedEntity) {

            increaseSkillProgress(damager, "shooting", 15)
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

const bleedingMobs = [
    'minecraft:cow', 'minecraft:sheep', 'minecraft:chicken', 'minecraft:pig', 'minecraft:bat', 'minecraft:wolf', 'minecraft:polar_bear', 'minecraft:ocelot', 'minecraft:cat',
    'minecraft:parrot', 'minecraft:rabbit', 'minecraft:lama', 'minecraft:horse', 'minecraft:donkey', 'minecraft:mule', 'minecraft:turtle', 'minecraft:panda', 'minecraft:fox', 'minecraft:cave_spider',
    'minecraft:piglin', 'minecraft:hoglin', 'minecraft:goat', 'minecraft:axolotl', 'minecraft:frog', 'minecraft:camel', 'minecraft:sniffer', 'minecraft:armadillo',

    "arx:cave_rat", "arx:fat_larva", "arx:deer", "arx:tsugunder", "arx:snow_lady", "arx:snow_bars", "arx:small_rat_white", "arx:small_rat_black", "arx:rat_monstr_white", "arx:rat_monstr",
    "arx:rat_eliminator", "arx:leech", "arx:larva", "arx:kapibara", "arx:hungry_rat", "arx:goose", "arx:gasgolder_istribitor", "arx:gasgolder", "arx:gabz", "arx:frintser", "arx:fiercewolf", "arx:crocodile",
    "arx:buffalo", "arx:big_leech", "arx:bear", "arx:baguk"
]

// Ранение сущности
world.afterEvents.entityHurt.subscribe((hurtEvent) => {
    const damager = hurtEvent.damageSource.damagingEntity
    const damaged = hurtEvent.hurtEntity
    const damageCause = hurtEvent.damageSource.cause

    // Если нам надо кровоточить за моба
    if (bleedingMobs.includes(damaged.typeId)) {

        let bloodIntencity = hurtEvent.damage - 2

        // Если есть колесо крови
        if (checkForItem(damager, "Legs", "arx:amul_bloody_circle")) {
            bloodIntencity *= 3
        }

        bleed(damaged, bloodIntencity)
    }

    // Если ранили игрока
    if (damaged.typeId === "minecraft:player") {
        const player = damaged

        // Проверяем тип урона
        if (damaged != damager && damageCause != 'campfire' && damageCause != 'contact' && damageCause != 'drowning' && damageCause != 'fall' && damageCause != 'magma' &&
            damageCause != 'soulCampfire' && damageCause != 'starve' && damageCause != 'suffocation' && damageCause != 'fire' && damageCause != 'fireTick' && damageCause != 'freezing') {

            increaseSkillProgress(damaged, "hp", hurtEvent.damage * 10)

            if (checkForItem(player, 'Legs', 'arx:amul_dash')) {
                player.applyKnockback({ x: (Math.random() - 0.5) * 6, z: (Math.random() - 0.5) * 6 }, 0.3)
            }
        }

        // Кровь игрока
        if (damageCause != 'campfire' && damageCause != 'drowning' && damageCause != 'magma' && damageCause != 'soulCampfire' && damageCause != 'starve' && damageCause != 'suffocation' &&
            damageCause != 'fire' && damageCause != 'fireTick' && damageCause != 'freezing' && damageCause != 'lava') {

            let bloodIntencity = hurtEvent.damage - 2 // Определяем интенсивность кровотечения

            // Если есть колесо крови
            if (checkForItem(damager, "Legs", "arx:amul_bloody_circle")) {
                bloodIntencity *= 3
            }

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
            getScore(player, "c_cowardly") > 0 ? stressMultiplier = 2 : stressMultiplier = 1

            const valueToAccure = hurtEvent.damage * 150 * stressMultiplier + 50

            if (valueToAccure > 0) iDP(player, 'stress', valueToAccure)
        }
        // Если мы на алтаре
        {
            // Проверяем допуск по типу урона
            if (damager?.typeId === 'minecraft:player' && damageCause === 'entityAttack') {
                // Проверяем допуск по тому, не призрак ли игрок
                if (damaged.getProperty('arx:is_ghost') === false) {
                    // Проверяем допуск по тому, нокнут ли игрок
                    if (damaged.getDynamicProperty('respawnDelay') > 0) {
                        // Проверям допуск по наличию алтаря
                        if (world.getDimension(damaged.dimension.id).getBlock({ x: damaged.location.x, y: damaged.location.y - 1, z: damaged.location.z }).typeId === 'arx:divine_altar') {
                            setScore(player, 'knockout_row_sounter', 99)
                            player.runCommand('loot spawn ~ ~1 ~ loot "custom/gold_feather"')

                            player.runCommand('kill @s')
                            console.warn('Разрешен дроп пера')
                        }
                    }
                }
            }

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
    }
    else if (damaged.typeId === "arx:gasgolder") {
        damaged.runCommand('summon arx:gasgolder_istribitor ~ ~ ~ facing @p')
        damaged.runCommand('effect @a[r=7] blindness 2 0 true')
        damaged.runCommand('playsound mob.rat_eliminator.spawn @a ~ ~ ~')

        damaged.runCommand('event entity @s arx:on_hurt_event')
    }

    // Если атакует игрок
    if (damager) { // Проверяем, есть ли вообще атакующая сущность
        // Если атакует игрок
        if (damager.typeId === "minecraft:player" && damageCause !== "projectile") {
            const weapon = damager.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)
            if (weapon !== undefined) { // Определяем, есть ли какие-то теги на том, чем наносим удар

                if (weapon.getTags().includes("is_dagger")) {
                    iDP(damager, 'attackCD', 20)
                    damager.addTag("is_dagger")
                }
                else if (weapon.getTags().includes("is_default_sword")) {
                    iDP(damager, 'attackCD', 30)
                    damager.addTag("is_default_sword")
                }
                else if (weapon.getTags().includes("is_heavy_sword")) {
                    iDP(damager, 'attackCD', 60)
                    damager.addTag("is_heavy_sword")
                }
                else if (weapon.getTags().includes("is_lance")) {
                    iDP(damager, 'attackCD', 40)
                    damager.addTag("is_lance")
                }
                else if (weapon.getTags().includes("is_long_sword")) {
                    iDP(damager, 'attackCD', 40)
                    damager.addTag("is_long_sword")
                }
                else if (weapon.getTags().includes("is_scythe")) {
                    iDP(damager, 'attackCD', 40)
                    damager.addTag("is_scythe")
                }
                else if (weapon.getTags().includes("is_staff")) {
                    iDP(damager, 'attackCD', 40)
                    damager.addTag("is_staff")
                }
                else if (weapon.getTags().includes("is_hheavy_sword")) {
                    iDP(damager, 'attackCD', 80)
                    damager.addTag("is_hheavy_sword")
                }
                else if (weapon.getTags().includes("is_wand")) {
                    iDP(damager, 'attackCD', 30)
                    damager.addTag("is_wand")
                }
                else {
                    iDP(damager, 'attackCD', 35)
                    damager.addTag("is_unarmed") // Например, игрок атакует куриным мясом. Оно не регистрируется, как оружие
                }
            }
            else { // Атакующий атакует руками
                iDP(damager, 'attackCD', 35)
                damager.addTag("is_unarmed")
            }

            damager.runCommand("function attack/on_attack") // Запускаем функцию анализа атаки

            // Вкач. Проверяем, не бьем ли мы куклу для битья
            if ((getEntityFamilies(damaged).includes('mob') || getEntityFamilies(damaged).includes('animal') || getEntityFamilies(damaged).includes('monster'))
                && damaged != damager) {

                // Увеличиваем силу
                increaseSkillProgress(damager, "strength", hurtEvent.damage * 2)

                // Увеличиваем выносливость, если мы с перегрузом
                if (damager.getDynamicProperty("overLoading") > 0) {
                    increaseSkillProgress(damager, "endurance", hurtEvent.damage * 4)
                }
            }
        }
    }
})

// Функция для получения family сущности
function getEntityFamilies(entity) {
    const familyComponent = entity.getComponent(EntityComponentTypes.TypeFamily);

    if (familyComponent) {
        // Компонент 'minecraft:family' существует.
        return familyComponent.getTypeFamilies(); // Возвращаем массив строк.
    } else {
        return []; // Возвращаем пустой массив.
    }
}