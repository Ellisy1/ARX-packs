// Arx core manager

// Импорт - основа
import { system, world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server"

import { getScore, setScore } from '../scoresOperations'
import { increaseSkillLevel, increaseSkillProgress, wipeSkills } from '../skillsOperations'
import { checkForItem } from "../checkForItem"
import { ModalFormData, MessageFormData, MessageFormResponse } from "@minecraft/server-ui"
import { setRandomTastes } from '../food/setRandomTastes'
import { getPlayersInRadius } from '../getPlayersInRadius'
import { getActiveStaffChannel } from '../magic/getActiveStaffChannel'
import { channelRomanNums } from '../magic/channelRomanNums'
import { isEntityInCube } from "./music_core"
import { weighAnalysis } from '../weighAnalysis'
import { checkForTrait } from "../traits/traitsOperations"
import { portals } from '../portals'
import { getPlayersInRadiusFromCoords } from '../portals'
import { killingTimeAnimDelay, animate_killing_time } from './animate_killing_time'

// Импорт - другие области движка
import { getNearestPlayer } from "../getNearestPlayer"
import { queueCommand } from "../commandQueue"


// ARXGate
export let ARXGate = {
    index: "ARXGATE_INDEX",
    out: "ARXGATE_OUTPUT",
    in: `ARXGATE_INPUT000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000`
}

// 1 tick
system.runInterval(() => {
    world.getDimension("minecraft:overworld").runCommand("function core_parts/core")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/core")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/dynamic_light_execution")

    // // Анализируем ARX Gate
    // if (!ARXGate.in.startsWith('ARXGate:рус:awaitingInput')) {
    //     console.warn(ARXGate.in)

    //     ARXGate.in = `ARXGate:рус:awaitingInput_${Math.random()}`
    // }

    for (const player of world.getPlayers()) {

        // Призрак и его механики
        if (player.getProperty("arx:is_ghost") == true) {
            const isSneaking = player.getTags().includes("is_sneaking")

            // Определяем направление взгляда
            let view_down = false
            player.runCommand("tag @s[rxm=30] add ghost_is_looking_down")
            if (player.getTags().includes("ghost_is_looking_down")) { view_down = true }
            player.removeTag("ghost_is_looking_down")

            // Определяем, можно ли нам левитировать из-за блоков
            let allow_levitate = false
            // В i < num, num отвечает за высоту полёта призрака
            for (let i = 0; i < 4; i++) {
                if (getBlockWithOffset(player, 0, -0.5 - i, 0)?.typeId != "minecraft:air") {
                    allow_levitate = true
                }
            }

            // Определяем, вынуждены ли мы летать
            let force_to_levitate = false
            for (let i = 0; i < 2; i++) {
                if ((getBlockWithOffset(player, 0, -0.5 - i, 0).typeId == "minecraft:water") || (getBlockWithOffset(player, 0, -0.5 - i, 0).typeId == "minecraft:lava")) {
                    force_to_levitate = true
                }
            }

            // Левитируем
            if ((isSneaking && view_down && allow_levitate) || force_to_levitate) {

                if (player.getDynamicProperty('ghostBoostByScarletMoon')) {
                    player.addEffect("levitation", 2, { amplifier: 4, showParticles: false })
                } else {
                    player.addEffect("levitation", 2, { amplifier: 0, showParticles: false })
                }

                player.addEffect("slow_falling", 100, { amplifier: 0, showParticles: false })
            }
        }

        // Отображение кд атаки
        if (player.getDynamicProperty("attackCD") > 0 || player.getDynamicProperty("prohibit_damage") > 0) {
            // Уменьшение отката атаки
            if (player.getDynamicProperty("attackCD") > 0) { player.setDynamicProperty("attackCD", player.getDynamicProperty("attackCD") - 1) }
            // Уменьшение отката блока
            if (player.getDynamicProperty("prohibit_damage") > 0) { player.setDynamicProperty("prohibit_damage", player.getDynamicProperty("prohibit_damage") - 1) }

            // Отображаем в тактах
            if (player.getDynamicProperty("myRule:showAttackCDMode") == 'ticks') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) { player.runCommand(`title @s actionbar  §c${player.getDynamicProperty("attackCD")}`) }
                else player.runCommand(`title @s actionbar  ${player.getDynamicProperty("attackCD")}`)
            }
            // Секундах
            else if (player.getDynamicProperty("myRule:showAttackCDMode") == 'seconds') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) { player.runCommand(`title @s actionbar  §c${Math.ceil(player.getDynamicProperty("attackCD") / 20)}`) }
                else { player.runCommand(`title @s actionbar  ${Math.ceil(player.getDynamicProperty("attackCD") / 20)}`) }
            }
            // Строкой
            else if (player.getDynamicProperty("myRule:showAttackCDMode") == 'line') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) {
                    let damageString = '§c'
                    for (let i = 0; i < Math.ceil(player.getDynamicProperty("attackCD") / 20); i++) { damageString += '=' }
                    damageString += "§f"
                    player.runCommand(`title @s actionbar  ${damageString} `)
                }
                else {
                    let damageString = '§f'
                    for (let i = 0; i < Math.ceil(player.getDynamicProperty("attackCD") / 20); i++) { damageString += '-' }
                    damageString += "§f"
                    player.runCommand(`title @s actionbar  ${damageString} `)
                }
            }
        }

        // Система нокаута
        {
            // Если мы притворяемся нокнутыми, но начали двигаться
            if (player.getProperty('arx:is_knocked') === true && player.getDynamicProperty('respawnDelay') === 0 && player.hasTag('is_moving') && !player.hasTag('is_riding')) {
                player.runCommand('event entity @s arx:property_is_knockout_set_0')
            }

            // Если игрока тащат, и скидывают
            if (player.hasTag('has_riders') && player.hasTag('is_sneaking')) {
                const carriedPlayer = getNearestPlayer(player)
                // Если игрок не нокнут, а просто поднят
                if (carriedPlayer.hasTag('is_riding') && carriedPlayer.getProperty('arx:is_knocked') === true && carriedPlayer.getDynamicProperty('respawnDelay') === 0) {
                    carriedPlayer.runCommand('event entity @s arx:property_is_knockout_set_0')
                }
                player.runCommand('execute as @p[tag=is_riding, has_property={arx:is_knocked=false}] run inputpermission set @s movement enabled')
                player.runCommand('ride @s evict_riders')
            }
        }

        // Респавн игроков
        {
            if (player.getDynamicProperty('respawnDelay') > 0 && player.getProperty('arx:is_ghost') === true) {
                player.runCommand('spawnpoint @s -10000 28 -10000')
            }
            else {
                player.runCommand('spawnpoint @s ~ ~ ~')
            }
        }
    }
}, 1);

// 2 ticks
system.runInterval(() => {
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/2ticks")
    for (const player of world.getPlayers()) {
        // Откат амулета гиперсинергии
        if (player.getDynamicProperty('amul_hypersynergyCD') > 0) {
            if (player.getDynamicProperty('amul_hypersynergyCD') === 1) {
                queueCommand(player, 'playsound tick @s ~ ~ ~')
            }
            player.setDynamicProperty('amul_hypersynergyCD', player.getDynamicProperty('amul_hypersynergyCD') - 1)
        }

        // Базовая сила
        {
            let basicStrength = 0.5

            // Кольца
            if (checkForItem(player, "Feet", "arx:ring_gold_ruby")) { basicStrength += 1 }
            if (checkForItem(player, "Offhand", "arx:ring_gold_ruby")) { basicStrength += 1 }
            if (checkForItem(player, "Feet", "arx:ring_naginitis_ruby")) { basicStrength += 2 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_ruby")) { basicStrength += 2 }
            if (checkForItem(player, "Feet", "arx:ring_caryite_ruby")) { basicStrength += 3 }
            if (checkForItem(player, "Offhand", "arx:ring_caryite_ruby")) { basicStrength += 3 }
            if (checkForItem(player, "Feet", "arx:ring_toliriite_ruby")) { basicStrength += 4 }
            if (checkForItem(player, "Offhand", "arx:ring_toliriite_ruby")) { basicStrength += 4 }
            if (checkForItem(player, "Feet", "arx:ring_lamenite_ruby")) { basicStrength += 5 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_ruby")) { basicStrength += 5 }

            if (checkForItem(player, "Legs", "arx:durasteel_bracers")) { basicStrength += 1 }

            if (checkForItem(player, "Legs", "arx:amul_bloody_circle")) { basicStrength += 0.5 }
            if (checkForItem(player, "Legs", "arx:amul_essence_of_vicious_demon")) { basicStrength += 3 }

            // Прокач
            basicStrength += (player.getDynamicProperty('skill:strength_level') / 2)

            // Черты
            if (checkForTrait(player, 'loner')) {
                const playersNearLoner = getPlayersInRadius(player, 8)
                if (playersNearLoner.length > 0) { basicStrength -= 0.5 }
                else { basicStrength += 0.5 }
            }

            // Нокаут
            if (player.getProperty('arx:is_knocked') == true) { basicStrength -= 999 }

            // Нет перса
            if (player.getDynamicProperty('hasRegisteredCharacter') === false) { basicStrength -= 999 }

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) basicStrength += 3

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { basicStrength += 2 }

            // От рюкзаков
            if (checkForItem(player, "Legs", "arx:big_bag")) { basicStrength -= 8 }
            if (checkForItem(player, "Legs", "arx:default_bag")) { basicStrength -= 4 }
            if (checkForItem(player, "Legs", "arx:mini_bag")) { basicStrength -= 1 }

            // Штраф от увядания призрака
            basicStrength -= player.getDynamicProperty("ghostWitheringLevel")

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { basicStrength -= 4 }
            if (player.getDynamicProperty('stressLevel') == 3) { basicStrength -= 2 }
            if (player.getDynamicProperty('stressLevel') == 2) { basicStrength -= 1 }
            if (player.getDynamicProperty('stressLevel') == -2) { basicStrength += 1 }
            if (player.getDynamicProperty('stressLevel') == -3) { basicStrength += 2 }
            if (player.getDynamicProperty('stressLevel') == -4) { basicStrength += 3 }

            // Штрафовое срезание от отката
            basicStrength -= Math.ceil(player.getDynamicProperty("attackCD") / 20) * 4

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { basicStrength -= player.getDynamicProperty('intoxicationLevel') * 2 }

            // Штрафовое срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 0) { basicStrength -= (player?.getDynamicProperty('overLoading') * 3) }

            // Штраф от запрета атаки
            if (player?.getDynamicProperty("prohibit_damage") > 0) { basicStrength -= 999 }

            // Выставляем силу
            basicStrength < -30 ? player.runCommand(`event entity @s arx:setBasicStrength_-30`) : player.runCommand(`event entity @s arx:setBasicStrength_${basicStrength}`)

            // Записывание в DP
            player.setDynamicProperty("basicStrength", basicStrength)

        }

        // МАНА
        {
            // Регенерация маны - рассчет
            let mpRegenPower = 0.1

            if (checkForItem(player, "Feet", "arx:ring_aluminum_beryl")) { mpRegenPower += 0.3 }
            if (checkForItem(player, "Offhand", "arx:ring_aluminum_beryl")) { mpRegenPower += 0.3 }

            if (checkForItem(player, "Feet", "arx:ring_gold_beryl")) { mpRegenPower += 0.8 }
            if (checkForItem(player, "Offhand", "arx:ring_gold_beryl")) { mpRegenPower += 0.8 }

            if (checkForItem(player, "Feet", "arx:ring_naginitis_beryl")) { mpRegenPower += 1.5 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_beryl")) { mpRegenPower += 1.5 }

            if (checkForItem(player, "Feet", "arx:ring_caryite_beryl")) { mpRegenPower += 2.5 }
            if (checkForItem(player, "Offhand", "arx:ring_caryite_beryl")) { mpRegenPower += 2.5 }

            if (checkForItem(player, "Feet", "arx:ring_malafiotironite_beryl")) { mpRegenPower += 3.8 }
            if (checkForItem(player, "Offhand", "arx:ring_malafiotironite_beryl")) { mpRegenPower += 3.8 }

            if (checkForItem(player, "Feet", "arx:ring_lamenite_beryl")) { mpRegenPower += 5 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_beryl")) { mpRegenPower += 5 }

            if (player.getDynamicProperty('mpRegenBoostByPotion') > 0) { mpRegenPower += 1 }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { mpRegenPower += 1.5 }

            // От черты
            if (checkForTrait(player, 'wise')) { mpRegenPower += 0.2 }
            if (checkForTrait(player, 'paranoid')) { mpRegenPower -= 0.2 }

            // Штраф от увядания призрака
            mpRegenPower -= player.getDynamicProperty("ghostWitheringLevel") * 0.2

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { mpRegenPower -= 0.4 }
            if (player.getDynamicProperty('stressLevel') == 3) { mpRegenPower -= 0.2 }
            if (player.getDynamicProperty('stressLevel') == 2) { mpRegenPower -= 0.1 }
            if (player.getDynamicProperty('stressLevel') == -2) { mpRegenPower += 0.1 }
            if (player.getDynamicProperty('stressLevel') == -3) { mpRegenPower += 0.2 }
            if (player.getDynamicProperty('stressLevel') == -4) { mpRegenPower += 0.4 }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { mpRegenPower -= player.getDynamicProperty('intoxicationLevel') }

            // Увеличение от прокачки
            mpRegenPower += player.getDynamicProperty('skill:mp_regen_level') / 3

            player.setDynamicProperty("mpRegenPower", mpRegenPower)

            // Максимальная мана - рассчет
            let maxMp = 20

            if (checkForItem(player, "Feet", "arx:ring_aluminum_sapphire")) { maxMp += 5 }
            if (checkForItem(player, "Offhand", "arx:ring_aluminum_sapphire")) { maxMp += 5 }

            if (checkForItem(player, "Feet", "arx:ring_gold_sapphire")) { maxMp += 10 }
            if (checkForItem(player, "Offhand", "arx:ring_gold_sapphire")) { maxMp += 10 }

            if (checkForItem(player, "Feet", "arx:ring_naginitis_sapphire")) { maxMp += 20 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_sapphire")) { maxMp += 20 }

            if (checkForItem(player, "Feet", "arx:ring_caryite_sapphire")) { maxMp += 30 }
            if (checkForItem(player, "Offhand", "arx:ring_caryite_sapphire")) { maxMp += 30 }

            if (checkForItem(player, "Feet", "arx:ring_malafiotironite_sapphire")) { maxMp += 40 }
            if (checkForItem(player, "Offhand", "arx:ring_malafiotironite_sapphire")) { maxMp += 40 }

            if (checkForItem(player, "Feet", "arx:ring_lamenite_sapphire")) { maxMp += 50 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_sapphire")) { maxMp += 50 }

            if (checkForItem(player, "Chest", "arx:apprentice_robe")) { maxMp += 3 }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { maxMp += 10 }

            // От черты
            if (checkForTrait(player, 'enlightened')) { maxMp += 5 }
            if (checkForTrait(player, 'stupid')) { maxMp -= 5 }

            // Штраф от увядания призрака
            maxMp -= player.getDynamicProperty("ghostWitheringLevel") * 3

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { maxMp -= 20 }
            if (player.getDynamicProperty('stressLevel') == 3) { maxMp -= 10 }
            if (player.getDynamicProperty('stressLevel') == 2) { maxMp -= 5 }
            if (player.getDynamicProperty('stressLevel') == -2) { maxMp += 5 }
            if (player.getDynamicProperty('stressLevel') == -3) { maxMp += 10 }
            if (player.getDynamicProperty('stressLevel') == -4) { maxMp += 15 }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { maxMp -= player.getDynamicProperty('intoxicationLevel') * 4 }

            // Увеличение от прокачки
            maxMp += player.getDynamicProperty('skill:mana_level') * 4

            // От пермабонуса
            maxMp += player.getDynamicProperty('MPPermanentBonus')

            // Записываем максмп в дп
            player.setDynamicProperty("maxMp", maxMp)

            // Макс мана отрицательна
            if (maxMp < 0 || player.getDynamicProperty("mp") < 0) {
                player.setDynamicProperty("mp", 0)
            }
            // Регенерируем
            else if (player.getDynamicProperty("mp") < maxMp) {
                // Реген маны
                if (mpRegenPower > 0) {
                    player.setDynamicProperty("mp", player.getDynamicProperty("mp") + mpRegenPower / 10)
                }
                // Если нам надо плавно накопить ману от зелий
                if (player.getDynamicProperty('MPSmoothAccrue') > 0) {
                    player.setDynamicProperty("mp", player.getDynamicProperty("mp") + 1)
                    player.setDynamicProperty('MPSmoothAccrue', player.getDynamicProperty('MPSmoothAccrue') - 1)
                }
                displayMPAndAdjacent(player)
            }
            // Мана больше макс маны
            else if (player.getDynamicProperty("mp") > maxMp) { // Маны больше чем надо
                player.setDynamicProperty("mp", maxMp)
                player.setDynamicProperty('MPSmoothAccrue', 0)
                displayMPAndAdjacent(player)
            }
            // Мана равна макс мане
            else {
                player.setDynamicProperty('MPSmoothAccrue', 0)

                // Определяем, что у нас за предмет
                const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)

                // Если мы держим посох
                if (item?.getTags().includes('is_staff')) {
                    displayMPAndAdjacent(player)
                }

                // Если мы держим руну
                else if (item?.getTags().includes('is_rune')) {
                    displayMPAndAdjacent(player)
                }

                // Если у нас гиперсинергия
                else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_improved') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_superior')) {
                    displayMPAndAdjacent(player)
                }
            }
        }

        // Скорость - анализ. Значения указываются в процентах, где 100% - базовая скорость игрока
        {
            let speedPower = 100 // База = 100%

            // Увеличение от колец
            if (checkForItem(player, "Feet", "arx:ring_aluminum_chrysolite")) { speedPower += 5 }
            if (checkForItem(player, "Offhand", "arx:ring_aluminum_chrysolite")) { speedPower += 5 }

            if (checkForItem(player, "Feet", "arx:ring_gold_chrysolite")) { speedPower += 10 }
            if (checkForItem(player, "Offhand", "arx:ring_gold_chrysolite")) { speedPower += 10 }

            if (checkForItem(player, "Feet", "arx:ring_naginitis_chrysolite")) { speedPower += 20 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_chrysolite")) { speedPower += 20 }

            if (checkForItem(player, "Feet", "arx:ring_caryite_chrysolite")) { speedPower += 30 }
            if (checkForItem(player, "Offhand", "arx:ring_caryite_chrysolite")) { speedPower += 30 }

            if (checkForItem(player, "Feet", "arx:ring_toliriite_chrysolite")) { speedPower += 40 }
            if (checkForItem(player, "Offhand", "arx:ring_toliriite_chrysolite")) { speedPower += 40 }

            if (checkForItem(player, "Feet", "arx:ring_lamenite_chrysolite")) { speedPower += 50 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_chrysolite")) { speedPower += 50 }

            if (player.getDynamicProperty('speedBonusByPotion') > 0) { speedPower += 20 }

            // От экипировки
            if (checkForItem(player, "Feet", "arx:leg_bag_dual")) { speedPower -= 8 }

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) speedPower += 30

            // Увеличение от уровня
            speedPower += player.getDynamicProperty("skill:running_level") * 2

            // Увеличение от роста
            speedPower += Math.round((player.getDynamicProperty("height") - 150) / 9)

            // Увеличение от навыка плавания
            if (player.hasTag('in_block_water')) {
                speedPower += player.getDynamicProperty('skill:swimming_level') * 5
            }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { speedPower += 25 }

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { speedPower -= 40 }
            if (player.getDynamicProperty('stressLevel') == 3) { speedPower -= 20 }
            if (player.getDynamicProperty('stressLevel') == 2) { speedPower -= 10 }
            if (player.getDynamicProperty('stressLevel') == -2) { speedPower += 10 }
            if (player.getDynamicProperty('stressLevel') == -3) { speedPower += 20 }
            if (player.getDynamicProperty('stressLevel') == -4) { speedPower += 30 }

            // Штраф от намокания
            if (getScore(player, "water_delay") > 200) { speedPower -= 10 }
            if (getScore(player, "water_delay") > 400) { speedPower -= 10 }

            // Бонус от закла
            if (player.getDynamicProperty('speedBoost:level0') > 0) { speedPower += 10 }
            if (player.getDynamicProperty('speedBoost:level1') > 0) { speedPower += 20 }
            if (player.getDynamicProperty('speedBoost:level2') > 0) { speedPower += 40 }
            if (player.getDynamicProperty('speedBoost:level3') > 0) { speedPower += 80 }

            // Штраф от увядания призрака
            speedPower -= player.getDynamicProperty("ghostWitheringLevel") * 4

            // Бонус после нокаута
            speedPower += player.getDynamicProperty('speedBoostAfterKnockout')

            // Срезние от перегруза
            if (player?.getDynamicProperty('overLoading') > 0) { speedPower -= player.getDynamicProperty("overLoading") * 12 }

            // Безусловное срезание от загруженности
            speedPower -= player.getDynamicProperty('weighLoading') * 2

            // Срезание от охлаждения
            speedPower -= (Math.abs(player.getDynamicProperty('freezing')) / 2)

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { speedPower -= player.getDynamicProperty('intoxicationLevel') * 10 }

            // Срезание от темноты
            if (player.hasTag("low_bright")) { speedPower -= 15 }

            // Если значение отрицательное
            if (speedPower < 0) { speedPower = 0 }

            if (player.getTags().includes('is_sprinting')) { speedPower += 25 }

            // Скорость - реализация
            if (player.getDynamicProperty("speedPower") != speedPower && speedPower != NaN) {
                const movementComponent = player.getComponent("minecraft:movement")
                movementComponent.setCurrentValue(speedPower / 1000)
            }

            player.setDynamicProperty("speedPower", speedPower)
        }

        // Контроль расстояния от места спавна
        if (player.getDynamicProperty('hasRegisteredCharacter') && player.getGameMode() !== 'Creative' && player.getGameMode() !== 'Spectator' && player.dimension.id === 'minecraft:overworld') {
            // Задаем двумерные векторы
            const worldCenter = [-2066, 1733]
            const playerLocation = [player.location.x, player.location.z];

            // Рассчитываем дистанцию
            const distance = Math.sqrt(Math.pow(playerLocation[0] - worldCenter[0], 2) + Math.pow(playerLocation[1] - worldCenter[1], 2));

            // Обрабатываем максимальную дистанцию
            const maxDistance = 2000
            const warnDistance = maxDistance - 6

            if (distance > maxDistance) {
                // Вычисляем вектор от центра к игроку
                const dx = playerLocation[0] - worldCenter[0];
                const dz = playerLocation[1] - worldCenter[1];

                // Нормализуем вектор (приводим к единичной длине)
                const normalizedDx = dx / distance;
                const normalizedDz = dz / distance;

                // Вычисляем координаты на границе цилиндра
                const teleportX = worldCenter[0] + normalizedDx * maxDistance;
                const teleportZ = worldCenter[1] + normalizedDz * maxDistance;

                // Телепортируем игрока на границу цилиндра
                //  Замена знач1 и знач2 переменными телепорта
                player.runCommand(`tp @s ${teleportX} ~ ${teleportZ} facing ${worldCenter[0]} ~ ${worldCenter[1]}`);
                player.runCommand('damage @s 0 magic')
            }
            if (distance > warnDistance) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВы дошли до границы мира. Пожалуйста, продолжайте своё путешествие в другом направлении." } ] }`)
                player.runCommand('effect @s blindness 2 0 true')
            }
        }
    }
}, 2);

// 5 ticks
system.runInterval(() => {

    // Порталы
    {
        // Люменессионные
        for (const portal of Object.values(portals.lumenession)) {
            world.getDimension('minecraft:overworld').runCommand(`particle arx:portal_lumen_fog ${portal.location[0]} ${portal.location[1] + 1} ${portal.location[2]}`)
            const players = getPlayersInRadiusFromCoords(portal.location, 1.9)
            if (players) {
                for (const player of players) {

                    player.runCommand('playsound portal.embark @a ~ ~ ~')
                    player.runCommand('camera @s fade time 0 1 2 color 200 180 0 ')

                    const TPVector = { x: portal.destination[0] + 0.5, y: portal.destination[1], z: portal.destination[2] + 0.5 }
                    player.teleport(TPVector)

                    queueCommand(player, 'playsound portal.arrive @a ~ ~ ~')
                    player.runCommand('effect @s slowness 2 255 true')

                    player.runCommand('tellraw @s { "rawtext": [ { "text": "§eВы проваливаетесь в неосязаемое пространство..." } ] }')

                }
            }
        }
        // Ноксинессионные
        for (const chain of portals.noxenession) {
            for (const portal of chain) {
                world.getDimension('minecraft:overworld').runCommand(`particle arx:portal_fog ${portal[0]} ${portal[1]} ${portal[2]}`)
                world.getDimension('minecraft:overworld').runCommand(`playsound portal.passive @a ${portal[0]} ${portal[1]} ${portal[2]}`)
            }
        }
    }

    for (const player of world.getPlayers()) {

        // Интерфейс отчета о баге
        if (player.hasTag("bug") && player.hasTag("is_moving")) {
            player.removeTag("bug")

            const form = new ModalFormData()
                .title("Отчет об ошибке")
                .slider("Насколько этот баг серьёзен", 1, 5, { defaultValue: 2 })
                .textField("Опишите баг", "Описание")
                .toggle("Приложить к отчёту моё местоположение")
                .toggle("Приложить к отчёту данные о предмете в правой руке")
                .submitButton("Отправить")

                .show(player)
                .then(response => {
                    if (response.formValues) {
                        let report = ''

                        report += `\n§eПользовательский отчёт от ошибке\n`
                        report += `§fСоставитель: §d${player.name}\n`
                        report += `§fСерьёзность бага: §d${response.formValues[0]}\n`
                        report += `§fБаг: ${response.formValues[1]}\n`
                        if (response.formValues[2] === true) {
                            report += (`x: ${Math.round(player.location.x)}, y: ${Math.round(player.location.y)}, z: ${Math.round(player.location.z)}, ${player.dimension.id}\n`)
                        }
                        if (response.formValues[3] === true) {
                            const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)

                            report += (`Предмет в правой руке: ${item?.typeId}\n`)
                        }

                        // Отправляем отчет в консоль
                        console.error(report)

                        player.runCommand(`tellraw @s { "rawtext": [ { "text": "Спасибо за отчёт, §a${player.name}§f! Модератор уже получил его." } ] }`)
                    }
                })

        }

        // Интерфейс преложения
        if (player.hasTag("idea") && player.hasTag("is_moving")) {
            player.removeTag("idea")

            const form = new ModalFormData()
                .title("Преложение по улучшению Аркса")
                .textField("Что вы хотите предложить?", "Ваша потрясающая мысль", { tooltip: 'Пожалуйста, пишите понятно и конкретно' })
                .submitButton("Отправить")

                .show(player)
                .then(response => {
                    if (response.formValues) {
                        let report = ''

                        report += `\n§aПользовательское предложение\n`
                        report += `§fСоставитель: §d${player.name}\n`
                        report += `§fСодержание: ${response.formValues[0]}\n`

                        // Отправляем отчет в консоль
                        console.warn(report)

                        player.runCommand(`tellraw @s { "rawtext": [ { "text": "Спасибо за предложение, §a${player.name}§f! Модератор уже получил его." } ] }`)
                    }
                })

        }

        // Счётчик пройденного расстояния
        {
            if (player.hasTag('is_moving') && player.getGameMode() !== 'Creative' && player.getGameMode() !== 'Spectator') {
                player.setDynamicProperty("statistics:distance", player.getDynamicProperty('statistics:distance') + 1.04 * (player.getDynamicProperty('speedPower') / 100))
            }
        }

    }

    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/dynamic_light_analysis")
    world.getDimension("minecraft:overworld").runCommand("function core_parts/5ticks")
}, 5);

// 10 ticks
system.runInterval(() => {
    for (const player of world.getPlayers()) {

        // # === # Анализ эффектов # === #

        // Механики призрака
        if (player.getProperty("arx:is_ghost") == true && player.getDynamicProperty('ghostUltimateResistance') === 0) {
            if (player.hasTag('in_block_water')) {
                player.runCommand('damage @s 2 fire')
            }
            else if (player.hasTag('in_water') && !player.hasTag('holding_umbrella')) {
                player.runCommand('damage @s 1 fire')
            }
            else if (!player.hasTag('holding_umbrella') && !player.hasTag('underground') && (world.getTimeOfDay() >= 0 && world.getTimeOfDay() < 12000)) {
                player.runCommand('damage @s 1 fire')
            }
        }

        // Прыжок - анализ
        {
            let jumpPower = 0

            // Кольца
            if (checkForItem(player, "Feet", "arx:ring_naginitis_olivine")) { jumpPower += 1 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_olivine")) { jumpPower += 1 }

            if (checkForItem(player, "Feet", "arx:ring_toliriite_olivine")) { jumpPower += 2 }
            if (checkForItem(player, "Offhand", "arx:ring_toliriite_olivine")) { jumpPower += 2 }

            if (checkForItem(player, "Feet", "arx:ring_lamenite_olivine")) { jumpPower += 3 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_olivine")) { jumpPower += 3 }

            if (player.getDynamicProperty('jumpBoostByPotion') > 0) { jumpPower += 1 }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { jumpPower += 1 }

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) jumpPower += 1

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { jumpPower -= 3 }
            if (player.getDynamicProperty('stressLevel') == 3) { jumpPower -= 1 }
            if (player.getDynamicProperty('stressLevel') == -3) { jumpPower += 1 }
            if (player.getDynamicProperty('stressLevel') == -4) { jumpPower += 2 }

            // Штраф от намокания
            if (getScore(player, "water_delay") > 200) { jumpPower -= 1 }
            if (getScore(player, "water_delay") > 400) { jumpPower -= 1 }

            // Срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 0) { jumpPower -= player.getDynamicProperty("overLoading") }

            // Адаптация для выдачи эффектом
            jumpPower = Math.round(jumpPower)

            // Отправка в DP
            player.setDynamicProperty("jumpPower", jumpPower)

            // Прыжок - реализация
            if (jumpPower > 0) { player.runCommand(`effect @s jump_boost 1 ${jumpPower - 1} true`) }
        }


        // Макс хп - анализ
        {
            let maxHP = 16

            // Бонус от уровня
            maxHP += player.getDynamicProperty("skill:hp_level") * 2

            // Штраф от увядания призрака
            maxHP -= player.getDynamicProperty("ghostWitheringLevel") * 2

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) maxHP += 10

            // Макс хп - запись в DP
            player.setDynamicProperty("maxHP", maxHP)

            // Исполнение
            player.runCommand(`event entity @s arx:set_${maxHP}_hp`)

            {
                // Убиваем, если макс хп равно нулю
                if (maxHP <= 0) {
                    player.runCommand('damage @s 50 suicide')
                }
            }
        }
    }

    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/10ticks")
}, 10);

// DP, которые мы уменьшаем вплоть до 0
const dynamicPropertiesToDecrease = [
    'saturation', 'noRainFog', 'noNightFog', 'jumpBoostByPotion', 'mpRegenBoostByPotion', 'weighLimitBonusByPotion', 'speedBonusByPotion',
    'antitoxicationBonusByPotion100', 'antitoxicationBonusByPotion200', 'freezingBlockByPotion', 'heatingBlockByPotion', 'statsBonusByFiolix',
    'heatingBlockByScroll', "scrollOfHealingCD", 'autoHPRegenCD', 'ghostUltimateResistance', 'speedBoostAfterKnockout',

    'speedBoost:level0', 'speedBoost:level1', 'speedBoost:level2', 'speedBoost:level3'
]

function getBlockWithOffset(player, x, y, z) {
    // Получаем позицию игрока
    const playerPos = player.location;

    // Вычисляем позицию блока под игроком (Y - 1)
    const blockPos = {
        x: playerPos.x + x,
        y: playerPos.y + y,
        z: playerPos.z + z
    };

    // Получаем блок под игроком
    const dimension = player.dimension;
    const block = dimension.getBlock(blockPos);

    return block
}

// 20 ticks
system.runInterval(() => {

    // Партиклы в порочных садах
    world.getDimension('minecraft:overworld').runCommand('particle arx:vicious_gardens_ambiance -2238 15 1806')

    for (const player of world.getPlayers()) {

        // Сколько живет персонаж?
        if (player.getDynamicProperty('hasRegisteredCharacter')) {
            player.setDynamicProperty('characterLifeSec', player.getDynamicProperty('characterLifeSec') + 1)
        }

        // Система счастья - стресса
        {
            // Заводим JS переменные
            let stress = player.getDynamicProperty('stress') // Стресс
            let stressLevel = player.getDynamicProperty('stressLevel') // Уровень стресса
            let stressDynamic = player.getDynamicProperty('stressDynamic') // Корректирующая динамика

            // // Случайная динамика
            // if (Math.random() < 0.02) { stress += 200 }
            // if (Math.random() < 0.02) { stress -= 200 }

            // Случайные события
            if (Math.random() < 0.0001) {
                player.sendMessage(' Вы вспомнили хорошие времена. Это подняло ваше настроение.')
                stress -= 1200
            }
            if (Math.random() < 0.0001) {
                player.sendMessage(' Вы вспомнили плохие времена. Это испортило ваше настроение.')
                stress += 1200
            }

            // Чилл в водичке
            if (player.hasTag('in_block_water')) { stress -= 3 }

            // Стресс при низком здоровье
            if (player.hasTag('very_low_hp')) { stress += 25 }
            else if (player.hasTag('low_hp')) { stress += 8 }

            // Падение стресса к нейтральным значениям
            if (stress > 800) { stress -= stress / 1000 } // Если стресс высокий, падение ускорено.
            else if (stress < -800) { stress += 1 }

            // Корректирующая динамика
            {
                // Вычисление переменной от текущего стресса
                stressDynamic += stress / 8000

                // Угасание перменной
                if (stressDynamic > 0) { stressDynamic -= 0.1 }
                else if (stressDynamic < 0) { stressDynamic += 0.1 }

                // Границы
                const stressDynamicLimit = 30
                if (stressDynamic > stressDynamicLimit) { stressDynamic = stressDynamicLimit }
                else if (stressDynamic < -stressDynamicLimit) { stressDynamic = -stressDynamicLimit }

                // Воздействие на стресс
                stress -= stressDynamic
            }

            // Границы стресса
            const stressLimit = 5000
            if (stress > stressLimit) { stress = stressLimit }
            else if (stress < -stressLimit) { stress = -stressLimit }

            // Определяем уровень стресса
            if (stress < -3500) stressLevel = -4;
            else if (stress < -2500) stressLevel = -3;
            else if (stress < -1500) stressLevel = -2;
            else if (stress < -500) stressLevel = -1;
            else if (stress <= 500) stressLevel = 0;
            else if (stress <= 1500) stressLevel = 1;
            else if (stress <= 2500) stressLevel = 2;
            else if (stress <= 3500) stressLevel = 3;
            else stressLevel = 4;

            // Вывод в чат
            let stressLevelOld = player.getDynamicProperty('stressLevel') // Уровень стресса в прошлый проход
            if (stressLevelOld != stressLevel) {

                const stressLevelAbs = Math.abs(stressLevel)

                let word1
                if (stressLevelOld < stressLevel) { word1 = "хуже" }
                else { word1 = "лучше" }

                let icon
                let word2
                if (stressLevel > 0) { icon = ''; word2 = 'стресса' }
                else if (stressLevel === 0) { icon = ''; word2 = 'счастья' }
                else { icon = ''; word2 = 'счастья' }

                let color = ''
                if (stressLevel > 1) { color = '§c' }
                else if (stressLevel < -1) { color = '§a' }

                let stressOutputLevel = stressLevelAbs.toString()
                if (stressOutputLevel === '4') { stressOutputLevel = 'Макс.' }

                player.sendMessage(`[Стало ${word1}] ${icon.repeat(stressLevelAbs != 0 ? stressLevelAbs : 1)} (${color}${stressOutputLevel} §fур. ${word2})`)
            }

            // Записываем полученные переменные в DP
            player.setDynamicProperty('stress', stress) // Стресс
            player.setDynamicProperty('stressLevel', stressLevel) // Уровень стресса
            player.setDynamicProperty('stressDynamic', stressDynamic) // Корректирующая динамика

            // Отладка
            // player.runCommand(`title @s actionbar ${stress.toFixed(1)} ${stressDynamic.toFixed(1)}`)
        }

        // Анимации бездействия
        {
            // Анализируем, когда надо анимировать
            if (player.hasTag('is_moving')) { setScore(player, "move_delay", killingTimeAnimDelay) }
            else { setScore(player, "move_delay", getScore(player, "move_delay") - 1) }

            if (getScore(player, "move_delay") <= 0) {
                animate_killing_time(player)
                setScore(player, 'move_delay', 20)
            }
        }

        // Уменьшение no_fog
        if (getScore(player, "no_fog") > 0) {
            player.runCommand('scoreboard players add @s no_fog -1')
        }

        // Уменьшение DP из dynamicPropertiesToDecrease
        for (const dp of dynamicPropertiesToDecrease) {
            if (player.getDynamicProperty(dp) > 0) {
                player.setDynamicProperty(dp, player.getDynamicProperty(dp) - 1)
            }
        }

        // Регаем на все сущности tick_nosempra_*
        world.getDimension("minecraft:overworld").runCommand("scoreboard players add @e[type=!item] tick_nosempra_a 0")
        world.getDimension("minecraft:overworld").runCommand("scoreboard players add @e[type=!item] tick_nosempra_b 0")
        world.getDimension("minecraft:overworld").runCommand("scoreboard players add @e[type=!item] tick_nosempra_c 0")

        // Прокачиваем силу духа (навык)
        if (player.hasTag('very_low_hp')) {
            increaseSkillProgress(player, 'fortitude', 20)
        } else if (player.hasTag('low_hp')) {
            increaseSkillProgress(player, 'fortitude', 10)
        }

        // Определяем бонус призрака
        {
            if (player.getProperty('arx:is_ghost') && player.hasTag('scarlet_night') && !player.hasTag('underground')) {
                player.setDynamicProperty('ghostBoostByScarletMoon', true)
            } else {
                player.setDynamicProperty('ghostBoostByScarletMoon', false)
            }

            if (player.getDynamicProperty('ghostBoostByScarletMoonLastPass') == false && player.getDynamicProperty('ghostBoostByScarletMoon') == true) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cСвет луны наполняет вас невероятной мощью..." } ] }`)
                if (player.getDynamicProperty('stress') > -1200) {
                    player.setDynamicProperty('stress', -1200)
                }
            }

            if (player.getDynamicProperty('ghostBoostByScarletMoonLastPass') == true && player.getDynamicProperty('ghostBoostByScarletMoon') == false) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМощь уходит..." } ] }`)
            }

            player.setDynamicProperty('ghostBoostByScarletMoonLastPass', player.getDynamicProperty('ghostBoostByScarletMoon'))
        }

        // Анализ туманов
        {
            // Порочные сады
            if (isEntityInCube(player, [-2274, 13, 1773], [-2205, 45, 1839])) {
                player.runCommand('scoreboard players add @s no_fog 1')
            }

            // Снятие туманов
            player.runCommand(`fog @s remove "redglasses_fog"`)
            player.runCommand(`fog @s remove "night_vision_device_fog"`)
            player.runCommand(`fog @s remove "default"`)
            player.runCommand(`fog @s remove "night"`)
            player.runCommand(`fog @s remove "nightbright"`)
            player.runCommand(`fog @s remove "true_demon"`)
            player.runCommand(`fog @s remove "mines"`)
            player.runCommand(`fog @s remove "scarlet_night"`)

            //Установка туманов
            // Если у игрока бан туманов 
            if (getScore(player, 'no_fog') > 0 || player.getDynamicProperty('ghostBoostByScarletMoon')) {
                player.runCommand(`fog @s push minecraft:fog_default "default"`)
            }
            // Шахты
            else if (player.location.y < 55) {
                player.runCommand(`fog @s push arx:mine_fog "mines"`)
            }
            // Алая ночь
            else if (player.hasTag('scarlet_night') && getScore(player, 'is_day') == 0) {
                player.runCommand(`fog @s push arx:scarlet_night_fog "scarlet_night"`)
            }

            // Прибор ночного зрения
            else if (player.hasTag('electrical_engineering_available') && checkForItem(player, 'Head', 'arx:night_vision_device')) {
                player.runCommand(`fog @s push arx:pnv_fog "night_vision_device_fog"`)
            }
            // Очки
            else if (checkForItem(player, 'Head', 'arx:glasses_red')) {
                player.runCommand(`fog @s push arx:redglasses_fog "redglasses_fog"`)
            }
            // Амулет тера крысы
            else if (checkForItem(player, 'Legs', 'arx:amul_demon_essence')) {
                player.runCommand(`fog @s push arx:true_demon_fog "true_demon"`)
            }

            // Поверхность, ночь (рядом с источником света)
            else if (player.hasTag('in_surface') && getScore(player, 'is_day') == 0 && getScore(player, 'no_dark_fog') == 0 && player.hasTag('low_bright') && !player.getProperty('arx:is_ghost')) {
                player.runCommand(`fog @s push arx:overworld_night_fog "night"`)
            }
            // Поверхность, ночь (далеко от источника света)
            else if (player.hasTag('in_surface') && getScore(player, 'is_day') == 0 && getScore(player, 'no_dark_fog') == 0 && !player.hasTag('low_bright') && !player.getProperty('arx:is_ghost')) {
                player.runCommand(`fog @s push arx:overworld_night_bright_fog "nightbright"`)
            }
        }

        // Насыщаем не призрака, если надо
        if (player.getDynamicProperty('saturation') > 0) {
            player.runCommand('effect @s saturation 5 255 true')
        }

        // Авторегенерация
        if (player.getDynamicProperty("autoHPRegenCD") == 0) {
            if (checkForTrait(player, 'tenacious')) { player.setDynamicProperty("autoHPRegenCD", 80) }
            else { player.setDynamicProperty("autoHPRegenCD", 90) }

            player.addEffect("regeneration", 200, { amplifier: 0, showParticles: false })
        }

        // Игроки без персонажа
        if (player.getDynamicProperty('hasRegisteredCharacter') === false) {
            player.runCommand('effect @s regeneration 2 255 true')
            player.setDynamicProperty('saturation', 720)
        }

        // Механики призрака
        if (player.getDynamicProperty('ghostUltimateResistance') == 1) {
            player.runCommand('tellraw @s { "rawtext": [ { "text": "§сНеуязвимость призрака истекла" } ] }')
        }
        if (player.getProperty("arx:is_ghost") == true) {
            // Увядание призрака. Каждые 8 часов (= 28800 сек) призрак безвозвратно теряет характеристики
            player.setDynamicProperty('ghostWithering', player.getDynamicProperty("ghostWithering") + 1)

            const ghostWitheringLevel = Math.floor(player.getDynamicProperty('ghostWithering') / 28800)
            // Отчитываемся, если увядание возросло
            if (ghostWitheringLevel > player.getDynamicProperty('ghostWitheringLevel')) {
                player.runCommand('tellraw @s { "rawtext": [ { "text": "§4Вы всё больше теряете связь с этим миром..." } ] }')
            }
            // Записываем уровень увядания
            player.setDynamicProperty("ghostWitheringLevel", ghostWitheringLevel)

            // Насыщаем
            player.setDynamicProperty('saturation', 2)
        }

        // Прокачка навыков, связанных с движением
        if (player.hasTag("is_moving") && !player.hasTag('is_riding')) {
            if (player.getDynamicProperty('overLoading') > 0) {
                increaseSkillProgress(player, "endurance", 1)
            }
            else if (player.hasTag('in_block_water')) {
                increaseSkillProgress(player, 'swimming', 10)
            }
            else {
                increaseSkillProgress(player, "running", 0.5)
            }
        }
        // Если нужно очистить навыки
        if (player.hasTag("wipeskills")) {
            wipeSkills(player)
            player.removeTag("wipeskills")
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aНавыки сброшены." } ] }`)
        }
        if (player.hasTag("just_entered_arx")) {
            player.setDynamicProperty("music_location_previous", 0)
            player.removeTag("just_entered_arx")
        }

        // Интерфейс вкусов
        if (player.hasTag("showTastesUI")) {
            player.removeTag("showTastesUI")
            showTastesRerollUI(player)
        }

        // Впустую прозваниваем навык. Это делается для перерасчета бонусов увеличения опыта, следственно актуального их отображения
        increaseSkillProgress(player, "strength", 0)

        // Интоксикация
        {
            // Расчёт снятия интоксикации
            let intoxicationDecreasePower = 100 // По умолчанию

            player.setDynamicProperty('intoxicationDecreasePower', intoxicationDecreasePower)

            // Снятие интоксикации
            if (player.getDynamicProperty('intoxication') > 0) player.setDynamicProperty('intoxication', player.getDynamicProperty('intoxication') - intoxicationDecreasePower / 100)

            // Расчитываем степень интоксикации
            const intoxicationLevel = Math.round(player.getDynamicProperty('intoxication') / 1000)

            // Если есть какая-то динамика интоксикации
            if (player.getDynamicProperty("intoxicationLevel") != intoxicationLevel) {
                let intoxicationLevelColor
                if (intoxicationLevel == 0) { intoxicationLevelColor = '§a' }
                if (intoxicationLevel == 1) { intoxicationLevelColor = '§e' }
                if (intoxicationLevel >= 2) { intoxicationLevelColor = '§c' }

                // Если стало лучше
                if (player.getDynamicProperty("intoxicationLevel") > intoxicationLevel) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aВам стало лучше §f(теперь ${intoxicationLevelColor}${intoxicationLevel}§f ур. интоксикации)" } ] }`)
                }
                // Если стало хуже
                if (player.getDynamicProperty("intoxicationLevel") < intoxicationLevel) {
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВам стало хуже §f(теперь ${intoxicationLevelColor}${intoxicationLevel}§f ур. интоксикации)" } ] }`)
                }
            }

            // Вешаем дебаффы
            // 2 ур
            if (intoxicationLevel == 2) {
                if (Math.random() < 0.08) { player.runCommand(`effect @s nausea 12 0 true`) }
            }
            else if (intoxicationLevel == 3) {
                if (Math.random() < 0.2) { player.runCommand(`effect @s nausea 12 0 true`) }
                if (Math.random() < 0.14) { player.runCommand(`effect @s darkness 5 0 true`) }
                if (Math.random() < 0.03) { player.runCommand(`effect @s fatal_poison 5 0 true`) }
            }
            else if (intoxicationLevel >= 4) {
                player.runCommand(`effect @s nausea 10 0 true`)
                player.runCommand(`effect @s blindness 5 0 true`)
                if (Math.random() < 0.2) { player.runCommand(`effect @s fatal_poison 5 1 true`) }
            }

            player.setDynamicProperty("intoxicationLevel", intoxicationLevel)
        }

        // Наркотики
        {
            // СЪЕДАНИЕ
            let FiolixNarcoticPower = player.getDynamicProperty('FiolixNarcoticPower')
            let FiolixNarcoticPowerLastPass = player.getDynamicProperty('FiolixNarcoticPowerLastPass')
            let statsBonusByFiolix = 0

            // Мы скушали фиоликс. Выдаем бонусы
            if (FiolixNarcoticPower > FiolixNarcoticPowerLastPass) {
                // Определяем, насколько наркотическое то что мы съели только что
                const bonusByEatenFiolix = FiolixNarcoticPower - FiolixNarcoticPowerLastPass
                // Рассчитываем силу бонусов
                let happinessMultiplier = 1
                // Если мы не зависимы на момент съедания
                if (FiolixNarcoticPowerLastPass == 0) {
                    happinessMultiplier += 3
                }
                // Мы слишком нажрались наркотой
                if (FiolixNarcoticPower > 2400) {
                    happinessMultiplier = 0.5
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cВы перенасыщены фиоликсом. Чтобы получить прежнее удовольствие, надо немного отдохнуть от него." } ] }`)

                    // Доводим значение до нормы, если мы съели ОЧЕНЬ много
                    if (FiolixNarcoticPower > 3000) { FiolixNarcoticPower = 3000 }
                }
                else {
                    statsBonusByFiolix = 30
                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aОчень приятное послевкусие!" } ] }`)
                }

                // Выдаем бонусы
                player.setDynamicProperty('stress', player.getDynamicProperty('stress') + bonusByEatenFiolix * happinessMultiplier * -1)
            }

            // Мы скушали фиоликс, и мы не зависимы на момент съедания
            if (FiolixNarcoticPowerLastPass == 0 && FiolixNarcoticPower > 0) {
                statsBonusByFiolix = 120
                if (Math.random() > 0.15) {
                    FiolixNarcoticPower = 0
                }
                else {
                    FiolixNarcoticPower = 2350
                }
            }

            if (FiolixNarcoticPower > 0) FiolixNarcoticPower--

            // Переменная для начисления сюда наркотиков
            player.setDynamicProperty('FiolixNarcoticPower', FiolixNarcoticPower)
            // Внутренняя переменная для отслеживания динамики
            player.setDynamicProperty('FiolixNarcoticPowerLastPass', FiolixNarcoticPower)
            // Бонусы от съедания наркотиков
            if (statsBonusByFiolix > 0) player.setDynamicProperty('statsBonusByFiolix', statsBonusByFiolix)

            // ПАССИВНЫЕ БОНУСЫ / ДЕБАФФЫ
            // 0 - 600 неприятная фаза
            if (FiolixNarcoticPower == 600) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§7§oУ вас в подсознании всплывает фиоликс..." } ] }`) }

            if (FiolixNarcoticPower == 400) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§eХотелось бы фиоликса..." } ] }`) }

            if (FiolixNarcoticPower == 250) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cХочу фиоликс!" } ] }`) }

            if (FiolixNarcoticPower == 150) { player.runCommand(`tellraw @s { "rawtext": [ { "text": "§a§lХочу фиоликс!" } ] }`) }
            if (FiolixNarcoticPower > 0 && FiolixNarcoticPower < 150) { player.runCommand(`title @s title §4Достать фиоликс`) }
            if (FiolixNarcoticPower > 0 && FiolixNarcoticPower < 150) { player.runCommand(`damage @s 2 suicide`) }
            if (FiolixNarcoticPower > 0 && FiolixNarcoticPower < 150) { player.runCommand(`effect @s darkness 10 0 true`) }
            if (FiolixNarcoticPower > 0 && FiolixNarcoticPower < 150) { player.runCommand(`effect @s fatal_poison 10 0 true`) }
        }

        // Точность стрелковых
        {
            let rangedAttackAccuracy = 0

            if (checkForItem(player, "Feet", "arx:ring_lamenite_topaz")) { rangedAttackAccuracy += 6 }
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_topaz")) { rangedAttackAccuracy += 6 }

            if (checkForItem(player, "Feet", "arx:ring_toliriite_topaz")) { rangedAttackAccuracy += 5 }
            if (checkForItem(player, "Offhand", "arx:ring_toliriite_topaz")) { rangedAttackAccuracy += 5 }

            if (checkForItem(player, "Feet", "arx:ring_caryite_topaz")) { rangedAttackAccuracy += 4 }
            if (checkForItem(player, "Offhand", "arx:ring_caryite_topaz")) { rangedAttackAccuracy += 4 }

            if (checkForItem(player, "Feet", "arx:ring_naginitis_topaz")) { rangedAttackAccuracy += 3 }
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_topaz")) { rangedAttackAccuracy += 3 }

            if (checkForItem(player, "Feet", "arx:ring_gold_topaz")) { rangedAttackAccuracy += 2 }
            if (checkForItem(player, "Offhand", "arx:ring_gold_topaz")) { rangedAttackAccuracy += 2 }

            if (checkForItem(player, "Feet", "arx:ring_aluminum_topaz")) { rangedAttackAccuracy += 1 }
            if (checkForItem(player, "Offhand", "arx:ring_aluminum_topaz")) { rangedAttackAccuracy += 1 }

            // Прибавка от уровня стрельбы
            rangedAttackAccuracy += player.getDynamicProperty("skill:shooting_level")

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) rangedAttackAccuracy += 3

            // Штраф от темноты
            if (player.hasTag("low_bright")) { rangedAttackAccuracy -= 3 }

            // Штраф от увядания призрака
            rangedAttackAccuracy -= player.getDynamicProperty("ghostWitheringLevel")

            // Воздействие стресса
            if (player.getDynamicProperty('stressLevel') == 4) { rangedAttackAccuracy -= 4 }
            if (player.getDynamicProperty('stressLevel') == 3) { rangedAttackAccuracy -= 2 }
            if (player.getDynamicProperty('stressLevel') == 2) { rangedAttackAccuracy -= 1 }
            if (player.getDynamicProperty('stressLevel') == -2) { rangedAttackAccuracy += 1 }
            if (player.getDynamicProperty('stressLevel') == -3) { rangedAttackAccuracy += 2 }
            if (player.getDynamicProperty('stressLevel') == -4) { rangedAttackAccuracy += 3 }

            // Нормализуем значение
            if (rangedAttackAccuracy < 0) { rangedAttackAccuracy = 0 }
            if (rangedAttackAccuracy > 20) { rangedAttackAccuracy = 20 }

            player.setProperty("arx:ranged_attack_accuracy", rangedAttackAccuracy)
        }

        // Копание
        {
            let diggingSpeed = 0

            // Определяем значение
            if (player.getProperty('arx:is_knocked') == true) { diggingSpeed -= 255 }

            // Штраф от намокания
            if (getScore(player, "water_delay") > 200) { diggingSpeed -= 1 }
            if (getScore(player, "water_delay") > 400) { diggingSpeed -= 1 }

            // Нормализуем
            if (diggingSpeed < -255) { diggingSpeed = -255 }
            if (diggingSpeed > 255) { diggingSpeed = 255 }

            // Исполняем
            if (diggingSpeed < 0) { player.runCommand(`effect @s mining_fatigue 2 ${Math.abs(diggingSpeed)} true`) }
            if (diggingSpeed > 0) { player.runCommand(`effect @s haste 2 ${diggingSpeed} true`) }
        }

        // Холод - жара
        {
            let freezing = player.getDynamicProperty('freezing')

            // Определяем блокировку холода
            let blockFreezing = false
            if (player.getDynamicProperty('freezingBlockByPotion') > 0) (blockFreezing = true)
            if (checkForItem(player, "legs", "arx:snow_bars_scarf") && !checkForItem(player, "chest", undefined)) (blockFreezing = true)
            if (player.getDynamicProperty('respawnDelay') > 0) { blockFreezing = true }
            if (player.getProperty('arx:is_ghost') == true) { blockFreezing = true }
            if (player.hasTag('heating_by_heater_block_activate')) { blockFreezing = true }

            // Увеличение холода
            //if (player.getTags().includes('BIOME_ice') && !blockFreezing) { freezing += 1 }
            if (player.getTags().includes('in_snow_biome') && !blockFreezing) { freezing += 1 }
            // Увеличение жары
            else if (player.getTags().includes('in_nether') && player.getDynamicProperty('heatingBlockByPotion') == 0 && player.getDynamicProperty('heatingBlockByScroll') == 0) { freezing -= 1 }
            // Уменьшение значений
            else if (freezing > 12) { freezing -= 10 }
            else if (freezing > 0) { freezing -= 1 }
            else if (freezing < -12) { freezing += 10 }
            else if (freezing < 0) { freezing += 1 }

            // Отображение
            if (freezing != 0) {
                let numOfSymbols = (Math.ceil(Math.abs(freezing) / 10))
                if (numOfSymbols > 5) { numOfSymbols = 5 }

                let symbolType
                let message
                freezing > 0 ? symbolType = "" : symbolType = ""
                freezing > 0 ? message = " §bВы замерзаете§f " : message = " §cВам жарко§f "

                let symbolLine = ''
                for (let i = 0; i < numOfSymbols; i++) {
                    symbolLine += symbolType
                }

                const resultLine = symbolLine + message + symbolLine

                player.runCommand(`title @s actionbar ${resultLine}`)
            }

            // Урон
            let damageType
            freezing > 0 ? damageType = 'freezing' : damageType = 'fire'

            // Можно ли вообще нанести урон
            if (Math.abs(freezing) > 20) {
                if (Math.random() < (Math.abs(freezing) / 100)) {
                    player.runCommand(`damage @s 1 ${damageType}`)
                }
            }

            player.setDynamicProperty('freezing', freezing)
        }

        // Кровотечение при низком хп
        if (player.getProperty('arx:is_ghost') == false) {
            if (player.getTags().includes('low_hp') && Math.random() > 0.6) {
                player.runCommand('particle arx:blood_drop_bright')
            }
            if (player.getTags().includes('very_low_hp')) {
                player.runCommand('particle arx:blood_drop_bright')
            }
        }

        // Система нокаута игрока
        {
            // respawnDelay - задержка до момента, когда игрок встанет естественным образом
            // reviveDelay - время, пока игрока поднимают. Хранится на нокнутом поднимаемом игроке

            // Обнаржуение входа в нокаут
            if (player.getDynamicProperty('respawnDelay') > player.getDynamicProperty('respawnDelayLastPass')) {
                player.runCommand('inputpermission set @s camera disabled')
                player.runCommand('inputpermission set @s movement disabled')
            }

            // Выход из нокаута (именно не вставание, а выход из нокаута. Игрок может продолжить лежать и притворяться мертвым)
            if (player.getDynamicProperty('respawnDelay') < player.getDynamicProperty('respawnDelayLastPass') && player.getDynamicProperty('respawnDelay') === 0) {
                // Разблокировываем движение
                player.runCommand('inputpermission set @s camera enabled')
                if (!player.hasTag('is_riding')) { player.runCommand('inputpermission set @s movement enabled') }

                // Говорим фразу
                {
                    const rand = Math.floor(Math.random() * 3)
                    let text
                    switch (rand) {
                        case 0:
                            text = 'Где я...?'
                            break
                        case 1:
                            text = 'Сколько прошло времени...?'
                            break
                        case 2:
                            text = 'Как больно...'
                            break
                    }

                    player.runCommand(`tellraw @s { "rawtext": [ { "text": "§o§e${text}\n§7Вы ещё не до конца поняли, что к чему, но уже готовы бежать. (Получен временный бонус скорости)" } ] }`)
                    player.setDynamicProperty("speedBoostAfterKnockout", 40)
                }

                // Если есть кристалл быстрого возрождения
                {
                    if (player.hasTag('crystal_of_shield_activate')) {
                        player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aВас защищает магическая сила (кристалл щита активен)" } ] }`)
                        player.runCommand('effect @s resistance 60 0 true')
                        player.removeTag('crystal_of_shield_activate')
                    }
                }

                // Снимаем кристалл второй жизни
                player.removeTag('crystal_of_second_life_activate')

                // Очищаем блокировщики слота
                player.runCommand('clear @s arx:slot_blocker')

                // Выставляем счетчик ряда смертей
                setScore(player, 'knockout_row_sounter', 0)
            }

            // Обработка ресанья от лица игрока, который сам ресает игрока
            if (player.getProperty('arx:is_knocked') === false, player.hasTag('is_sneaking')) {

                // Определяем скорость ресанья
                let reviveSpeedValue = 1
                if (checkForItem(player, 'Legs', 'arx:amul_revive')) { // Увеличиваем, если есть амуль быстрого воскрешения
                    reviveSpeedValue += 2
                }

                // Получаем всех игроков поблизости
                const nearbyPlayers = getPlayersInRadius(player, 1.5)

                // Ресаем
                for (const nearbyPlayer of nearbyPlayers) {
                    if (nearbyPlayer.getProperty('arx:is_knocked') === true && !nearbyPlayer.hasTag('is_riding')) {
                        nearbyPlayer.setDynamicProperty('reviveDelay', nearbyPlayer.getDynamicProperty('reviveDelay') + reviveSpeedValue)
                        displayRespawnLine(nearbyPlayer, player) // Отображаем линию воскрешения ресающему
                        displayRespawnLine(nearbyPlayer, nearbyPlayer) // Отображаем линию воскрешения тому кого ресают

                        // Мы воскресили до нужного reviveDelay (reviveDelay === 10)
                        if (nearbyPlayer.getDynamicProperty('reviveDelay') >= 10) {
                            // Отправляем сообщение поднимаемому
                            if (nearbyPlayer.getDynamicProperty("respawnDelay") === 0) {
                                nearbyPlayer.runCommand(`tellraw @s { "rawtext": [ { "text": "${player.getDynamicProperty('name')} §aпомогает мне. Притворяться вырубленным сейчас не выйдет" } ] }`)
                            } else {
                                nearbyPlayer.runCommand(`tellraw @s { "rawtext": [ { "text": "${player.getDynamicProperty('name')} §aпомогает мне" } ] }`)
                            }
                            // Отправляем сообщение поднимающему
                            player.runCommand(`tellraw @s { "rawtext": [ { "text": "${nearbyPlayer.getDynamicProperty('name')} §aчувствует себя лучше" } ] }`)

                            // Выставляем данные
                            nearbyPlayer.setDynamicProperty('respawnDelay', 0)
                            nearbyPlayer.setProperty("arx:is_knocked", false)
                            nearbyPlayer.runCommand('event entity @s arx:property_is_knockout_set_0')
                        }
                    }
                }
            }

            // Обработка нокнутого игрока
            if (player.getProperty('arx:is_knocked') === true) {
                // Если нас перестали ресать, то сбрасываем прогресс ресанья
                {
                    // Получаем всех игроков поблизости
                    const nearbyPlayers = getPlayersInRadius(player, 1.5)
                    // Проверяем, есть ли хотя бы один тот, кто ресает
                    let someoneWhoIsHelpingMe = false
                    for (const nearbyPlayer of nearbyPlayers) {
                        if (nearbyPlayer.getProperty('arx:is_knocked') === false, nearbyPlayer.hasTag('is_sneaking')) {
                            someoneWhoIsHelpingMe = true
                        }
                    }
                    if (!someoneWhoIsHelpingMe) {
                        player.setDynamicProperty('reviveDelay', 0)
                    }
                }
                // Темнеем камеру
                if (player.getDynamicProperty('respawnDelay') == 6) {
                    player.runCommand('camera @s fade time 0 0 10 color 20 3 3')
                } else if (player.getDynamicProperty('respawnDelay') > 6) {
                    player.runCommand('camera @s fade time 0 2 0 color 20 3 3')
                }
            }

            // Обработка переменных
            player.setDynamicProperty('respawnDelayLastPass', player.getDynamicProperty('respawnDelay'))
            if (player.getDynamicProperty('respawnDelay') > 0) {
                player.setDynamicProperty('respawnDelay', player.getDynamicProperty('respawnDelay') - 1)
            }

            // Функия рисования линии респавна
            function displayRespawnLine(playerWhoIsKnocked, playerToDisplay) {
                const reviveValue = playerWhoIsKnocked.getDynamicProperty('reviveDelay')
                let resultLine = ''
                for (let i = 0; i < reviveValue; i++) {
                    resultLine += '█ '
                }
                playerToDisplay.runCommand(`title @s actionbar §a${resultLine.slice(0, -1)}`) // Выводим, срезая пробел сзади строки
            }
        }
    }

    // Запуск участков mcfunction движка
    world.getDimension("minecraft:overworld").runCommand("function core_parts/20ticks")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/20ticks")
}, 20);

// 3s
system.runInterval(() => {
    for (const player of world.getPlayers()) {
        weighAnalysis(player)
    }
}, 60)

// Отображение маны
function displayMPAndAdjacent(player) {

    // Определяем, как нам показать ману
    let manaStr = ''

    if (player.getDynamicProperty("myRule:manaDisplayMode") === 'integers') {
        manaStr = Math.floor(player.getDynamicProperty("mp"))
    }
    else {
        manaStr = player.getDynamicProperty("mp").toFixed(1)
    }

    // Определяем, что у нас за предмет
    const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)

    // Объявляем переменную, где будем хранить число каналов посоха
    let staffChannelNum

    const itemTags = item?.getTags()

    // Мы держим посох
    if (itemTags?.includes('is_staff')) {

        for (const tag of itemTags) {
            if (tag.includes('staff_channels_')) {
                staffChannelNum = parseInt(tag.slice(15))
            }
        }

        const targets = ['§aНа себя', '§cНа ближайшего', '§eНа животных и монстров']

        const activeChannel = getActiveStaffChannel(player, staffChannelNum)
        const activeTarget = player.getDynamicProperty('magicTarget')

        player.runCommand(`title @s actionbar §d${channelRomanNums[activeChannel - 1]} канал §7| §c${targets[activeTarget - 1]} §7| §f${manaStr} §1MP`)
    }
    // Мы держим руну
    else if (itemTags?.includes('is_rune')) {

        // Определяем каналы
        let channels = undefined
        if (itemTags?.includes('plumbum_rune')) { channels = 4 }
        else if (itemTags?.includes('naginitis_rune')) { channels = 6 }
        else if (itemTags?.includes('forfacorite_rune')) { channels = 10 }
        else if (itemTags?.includes('special_rune')) { channels = 10 }
        else if (itemTags?.includes('malafiotironite_rune')) { channels = 8 }

        // Не удалось определить каналы
        if (channels === undefined) {
            console.warn(`Не удалось считать количество каналов на руне. Игрок ${player}, предмет ${item.typeId}`)
            return undefined
        }

        const activeChannel = getActiveStaffChannel(player, channels)

        player.runCommand(`title @s actionbar §b${channelRomanNums[activeChannel - 1]} канал §7| §f${manaStr} §1MP`)
    }
    // У нас амулет гиперсинергии
    else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_improved') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_superior')) {

        let channels = undefined

        if (checkForItem(player, "Legs", 'arx:amul_hypersynergy')) { channels = 4 }
        else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy_improved')) { channels = 6 }
        else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy_superior')) { channels = 8 }

        const activeChannel = getActiveStaffChannel(player, channels)

        player.runCommand(`title @s actionbar §7${channelRomanNums[activeChannel - 1]} канал §7| §f${manaStr} §1MP`)
    }


    // Мы не держим ничего
    else {
        player.runCommand(`title @s actionbar ${manaStr} §1MP`)
    }
}

// Отображение UI еды
function showTastesRerollUI(player) {
    const form = new MessageFormData()
        .title("Выбор вкусов")
        .body(tasteBodyString(player))
        .button1("Перебросить вкусы")
        .button2("Принять")

        .show(player)
        .then((response) => {
            if (response.selection === 0) { // Игрок принял
                setRandomTastes(player)
                showTastesRerollUI(player)
            }
            else if (response.selection === 1) { // Игрок перебросил
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§aВкусы успешно установлены." } ] }`)
            }
            else {
                showTastesRerollUI(player)
            }
        })
}

// Формируем строку для вывода вкусов в кастом окошко
export function tasteBodyString(player) {
    let resultString = '§eВаши вкусы§f:\n'

    const tastes = ['meat', 'fish', 'bread', 'dairy', 'herbal', 'sweet']
    const tastes_ru = ['Мясное', 'Рыбное', 'Хлебное', 'Молочное', 'Травяное', 'Сладкое']

    for (let i = 0; i < 6; i++) {
        const currentTaste = player.getDynamicProperty("playerTaste_" + tastes[i])

        let currentTasteColor

        if (currentTaste > -30) {
            currentTaste < 30 ? currentTasteColor = '§e' : currentTasteColor = '§a'
        }
        else {
            currentTasteColor = '§c'
        }

        resultString += `§f${tastes_ru[i]}: ${currentTasteColor}${currentTaste}\n§f`
    }

    return (resultString)
}