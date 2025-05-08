// Arx core manager

// Импорт - основа
import { system, world, EntityComponentTypes, EquipmentSlot } from "@minecraft/server"
import { getScore, setScore } from '../scoresOperations'
import { increaseSkillLevel, increaseSkillProgress, wipeSkills } from '../skillsOperations'
import { checkForItem } from "../checkForItem"
import { ModalFormData, MessageFormData, MessageFormResponse } from "@minecraft/server-ui"
import { setRandomTastes } from '../food/setRandomTastes'

// Импорт - другие области движка
import './music_core'
import './achievements'
import { getNearestPlayer } from "../getNearestPlayer"

// 1 tick
system.runInterval(() => {
    world.getDimension("minecraft:overworld").runCommand("function core_parts/core")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/core")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/dynamic_light_execution")

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
                if (getBlockWithOffset(player, 0, -0.5 - i, 0).typeId != "minecraft:air") {
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
    }
}, 1);

// 2 ticks
system.runInterval(() => {
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/2ticks")
    for (const player of world.getPlayers()) {
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

            // Прокач
            basicStrength += (player.getDynamicProperty('skill:strength_level') / 2)

            // Нокаут
            if (player.getProperty('arx:is_knocked') != 0) { basicStrength -= 999 }

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
            if (getScore(player, "stress_cond") == 4) { basicStrength -= 4 }
            if (getScore(player, "stress_cond") == 3) { basicStrength -= 2 }
            if (getScore(player, "stress_cond") == 2) { basicStrength -= 1 }
            if (getScore(player, "stress_cond") == -2) { basicStrength += 1 }
            if (getScore(player, "stress_cond") == -3) { basicStrength += 2 }
            if (getScore(player, "stress_cond") == -4) { basicStrength += 3 }

            // Штрафовое срезание от отката
            basicStrength -= Math.ceil(player.getDynamicProperty("attackCD") / 20) * 4

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { basicStrength -= player.getDynamicProperty('intoxicationLevel') * 2 }

            // Штрафовое срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 1) { basicStrength -= (player?.getDynamicProperty('overLoading') * 3) }

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

            // Штраф от увядания призрака
            mpRegenPower -= player.getDynamicProperty("ghostWitheringLevel") * 0.2

            // Воздействие стресса
            if (getScore(player, "stress_cond") == 4) { mpRegenPower -= 1 }
            if (getScore(player, "stress_cond") == 3) { mpRegenPower -= 0.5 }
            if (getScore(player, "stress_cond") == 2) { mpRegenPower -= 0.2 }
            if (getScore(player, "stress_cond") == -2) { mpRegenPower += 0.2 }
            if (getScore(player, "stress_cond") == -3) { mpRegenPower += 0.5 }
            if (getScore(player, "stress_cond") == -4) { mpRegenPower += 0.7 }

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

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { maxMp += 10 }

            // Штраф от увядания призрака
            maxMp -= player.getDynamicProperty("ghostWitheringLevel") * 3

            // Воздействие стресса
            if (getScore(player, "stress_cond") == 4) { maxMp -= 20 }
            if (getScore(player, "stress_cond") == 3) { maxMp -= 10 }
            if (getScore(player, "stress_cond") == 2) { maxMp -= 5 }
            if (getScore(player, "stress_cond") == -2) { maxMp += 5 }
            if (getScore(player, "stress_cond") == -3) { maxMp += 10 }
            if (getScore(player, "stress_cond") == -4) { maxMp += 15 }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { maxMp -= player.getDynamicProperty('intoxicationLevel') * 4 }

            // Увеличение от прокачки
            mpRegenPower += player.getDynamicProperty('skill:mana_level') * 3

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
                displayMP(player)
            }
            // Мана больше макс маны
            else if (player.getDynamicProperty("mp") > maxMp) { // Маны больше чем надо
                player.setDynamicProperty("mp", maxMp)
                player.setDynamicProperty('MPSmoothAccrue', 0)
                displayMP(player)
            }
            // Мана равна макс мане
            else {
                player.setDynamicProperty('MPSmoothAccrue', 0)
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
            if (getScore(player, "stress_cond") == 4) { speedPower -= 40 }
            if (getScore(player, "stress_cond") == 3) { speedPower -= 20 }
            if (getScore(player, "stress_cond") == 2) { speedPower -= 10 }
            if (getScore(player, "stress_cond") == -2) { speedPower += 10 }
            if (getScore(player, "stress_cond") == -3) { speedPower += 20 }
            if (getScore(player, "stress_cond") == -4) { speedPower += 30 }

            // Штраф от намокания
            if (getScore(player, "water_delay") > 200) { speedPower -= 10 }
            if (getScore(player, "water_delay") > 400) { speedPower -= 10 }

            // Штраф от увядания призрака
            speedPower -= player.getDynamicProperty("ghostWitheringLevel") * 4

            // Срезние от перегруза
            if (player?.getDynamicProperty('overLoading') > 1) { speedPower -= player.getDynamicProperty("overLoading") * 12 }

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
            if (player.getDynamicProperty("speedPower") != speedPower) {
                const movementComponent = player.getComponent("minecraft:movement")
                movementComponent.setCurrentValue(speedPower / 1000)
            }

            player.setDynamicProperty("speedPower", speedPower)
        }

        // Контроль расстояния от места спавна
        if (player.getDynamicProperty('hasRegisteredCharacter') && player.getGameMode() !== 'creative' && player.getGameMode() !== 'spectator') {
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
    for (const player of world.getPlayers()) {
        // Подмена яблок
        if (checkForItem(player, 'Inventory', 'minecraft:apple')) {
            player.runCommand('clear @s minecraft:apple 0 1')
            player.runCommand('give @s arx:apple')
        }

        // Анализ поднимаемного игроком веса
        // weighLimit - ограничение переносимого веса, при переходе за который накладывается штраф
        let weighLimit = 4
        // Сумки
        if (checkForItem(player, "Legs", "arx:belt_bag")) { weighLimit += 1 }
        if (checkForItem(player, "Legs", "arx:big_bag")) { weighLimit += 8 }
        if (checkForItem(player, "Legs", "arx:default_bag")) { weighLimit += 4 }
        if (checkForItem(player, "Feet", "arx:leg_bag")) { weighLimit += 1 }
        if (checkForItem(player, "Feet", "arx:leg_bag_dual")) { weighLimit += 2 }
        if (checkForItem(player, "Legs", "arx:mini_bag")) { weighLimit += 2 }
        // Кольца
        if (checkForItem(player, "Feet", "arx:ring_aluminum_cornelian")) { weighLimit += 1 }
        if (checkForItem(player, "OffHand", "arx:ring_aluminum_cornelian")) { weighLimit += 1 }
        if (checkForItem(player, "Feet", "arx:ring_gold_cornelian")) { weighLimit += 2 }
        if (checkForItem(player, "OffHand", "arx:ring_gold_cornelian")) { weighLimit += 2 }
        if (checkForItem(player, "Feet", "arx:ring_naginitis_cornelian")) { weighLimit += 3 }
        if (checkForItem(player, "OffHand", "arx:ring_naginitis_cornelian")) { weighLimit += 3 }
        if (checkForItem(player, "Feet", "arx:ring_caryite_cornelian")) { weighLimit += 4 }
        if (checkForItem(player, "OffHand", "arx:ring_caryite_cornelian")) { weighLimit += 4 }
        if (checkForItem(player, "Feet", "arx:ring_toliriite_cornelian")) { weighLimit += 5 }
        if (checkForItem(player, "OffHand", "arx:ring_toliriite_cornelian")) { weighLimit += 5 }
        if (checkForItem(player, "Feet", "arx:ring_lamenite_cornelian")) { weighLimit += 6 }
        if (checkForItem(player, "OffHand", "arx:ring_lamenite_cornelian")) { weighLimit += 6 }

        if (player.getDynamicProperty('weighLimitBonusByPotion') > 0) { weighLimit += 2 }

        // Увеличение от прокачки
        weighLimit += player.getDynamicProperty('skill:endurance_level') / 2

        // Увеличение от бонуса фиоликса
        if (player.getDynamicProperty('statsBonusByFiolix') > 0) { weighLimit += 2 }

        // Срезание от отравления
        if (player.getDynamicProperty('intoxicationLevel') >= 2) { weighLimit -= player.getDynamicProperty('intoxicationLevel') }

        // Воздействие стресса
        if (getScore(player, "stress_cond") == 4) { weighLimit -= 4 }
        if (getScore(player, "stress_cond") == 3) { weighLimit -= 2 }
        if (getScore(player, "stress_cond") == 2) { weighLimit -= 1 }
        if (getScore(player, "stress_cond") == -2) { weighLimit += 1 }
        if (getScore(player, "stress_cond") == -3) { weighLimit += 2 }
        if (getScore(player, "stress_cond") == -4) { weighLimit += 3 }

        // weighLoading - фактическая загруженность игрока
        player.runCommand('function javascript/weigh')

        let weighLoading = getScore(player, 'weighLoading')
        // От переносимого игрока
        if (player.hasTag('has_riders')) {
            weighLoading += 3
            // Передаем вес от носимого игрока
            const carriedPlayer = getNearestPlayer(player)
            if (carriedPlayer?.hasTag('is_riding')) {
                weighLoading += getScore(carriedPlayer, "weighLoading")
            }
        }

        // Отправляем значения в dynamicProperty
        player.setDynamicProperty('weighLimit', weighLimit)
        player.setDynamicProperty('weighLoading', weighLoading)
        player.setDynamicProperty('overLoading', weighLoading - weighLimit)

        // Интерфейс отчета о баге
        if (player.hasTag("bug") && player.hasTag("is_moving")) {
            player.removeTag("bug")

            const form = new ModalFormData()
                .title("Отчет об ошибке")
                .slider("Насколько этот баг серьёзен", 1, 5, {defaultValue: 2})
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

        // Счётчик пройденного расстояния
        {
            if (player.hasTag('is_moving') && player.getGameMode() !== 'creative' && player.getGameMode() !== 'spectator') {
                player.setDynamicProperty("statistics:distance", player.getDynamicProperty('statistics:distance') + 1.04 * (player.getDynamicProperty('speedPower') / 100))
            }
        }

    }

    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/dynamic_light_analysis")
    world.getDimension("minecraft:overworld").runCommand("function core_parts/5ticks")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/5ticks")
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
            if (getScore(player, "stress_cond") == 4) { jumpPower -= 3 }
            if (getScore(player, "stress_cond") == 3) { jumpPower -= 1 }
            if (getScore(player, "stress_cond") == -3) { jumpPower += 1 }
            if (getScore(player, "stress_cond") == -4) { jumpPower += 2 }

            // Штраф от намокания
            if (getScore(player, "water_delay") > 200) { jumpPower -= 1 }
            if (getScore(player, "water_delay") > 400) { jumpPower -= 1 }

            // Срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 1) { jumpPower -= player.getDynamicProperty("overLoading") * 10 }

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
    'heatingBlockByScroll', "scrollOfHealingCD", 'autoHPRegenCD', 'ghostUltimateResistance'
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
    for (const player of world.getPlayers()) {

        // Уменьшение DP из dynamicPropertiesToDecrease
        for (const dp of dynamicPropertiesToDecrease) {
            if (player.getDynamicProperty(dp) > 0) {
                player.setDynamicProperty(dp, player.getDynamicProperty(dp) - 1)
            }
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
                if (getScore(player, `stress`) > -1200) {
                    setScore(player, 'stress', -1200)
                }
            }

            if (player.getDynamicProperty('ghostBoostByScarletMoonLastPass') == true && player.getDynamicProperty('ghostBoostByScarletMoon') == false) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМощь уходит..." } ] }`)
            }

            player.setDynamicProperty('ghostBoostByScarletMoonLastPass', player.getDynamicProperty('ghostBoostByScarletMoon'))
        }

        // Анализ туманов
        {
            // Снятие туманов
            player.runCommand(`fog @s remove "redglasses_fog"`)
            player.runCommand(`fog @s remove "night_vision_device_fog"`)
            player.runCommand(`fog @s remove "stress_fog"`)
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

            // Стресс
            else if (getScore(player, 'stress_cond') === 4) {
                player.runCommand(`fog @s push arx:overworld_night_bright_fog "nightbright"`)
            }
        }

        // AI music
        // player.runCommand(`playsound ai_music.deepDrumBass @s ~ ~ ~`)

        // Насыщаем не призрака, если надо
        if (player.getDynamicProperty('saturation') > 0) {
            player.runCommand('effect @s saturation 5 255 true')
        }

        // Авторегенерация
        if (player.getDynamicProperty("autoHPRegenCD") == 0) {
            player.setDynamicProperty("autoHPRegenCD", 90)
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
            player.setDynamicProperty("music_location_previous", -1)
            player.removeTag("just_entered_arx")
        }

        // Интерфейс вкусов
        if (player.hasTag("showTastesUI")) {
            player.removeTag("showTastesUI")
            showTastesRerollUI(player)
        }

        // Впустую прозваниваем навык. Это делается для перерасчета бонусов увеличения опыта, следственно актуального их отображения
        increaseSkillProgress(player, "strength", 0)

        // ИНТОКСИКАЦИЯ
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
        // НАРКОТИКИ
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
                console.warn(bonusByEatenFiolix)
                player.runCommand(`scoreboard players add @s stress ${bonusByEatenFiolix * happinessMultiplier * -1}`)
            }

            // Мы скушали фиоликс, и мы не зависимы на момент съедания
            if (FiolixNarcoticPowerLastPass == 0 && FiolixNarcoticPower > 0) {
                statsBonusByFiolix = 120
                if (Math.random() > 0.15) {
                    console.warn('Обнуляем зависимость')
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
        // ТОЧНОСТЬ СТРЕЛКОВЫХ
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
            if (getScore(player, "stress_cond") == 4) { rangedAttackAccuracy -= 4 }
            if (getScore(player, "stress_cond") == 3) { rangedAttackAccuracy -= 2 }
            if (getScore(player, "stress_cond") == 2) { rangedAttackAccuracy -= 1 }
            if (getScore(player, "stress_cond") == -2) { rangedAttackAccuracy += 1 }
            if (getScore(player, "stress_cond") == -3) { rangedAttackAccuracy += 2 }
            if (getScore(player, "stress_cond") == -4) { rangedAttackAccuracy += 3 }

            // Нормализуем значение
            if (rangedAttackAccuracy < 0) { rangedAttackAccuracy = 0 }
            if (rangedAttackAccuracy > 20) { rangedAttackAccuracy = 20 }

            player.setProperty("arx:ranged_attack_accuracy", rangedAttackAccuracy)
        }
        // Копание
        {
            let diggingSpeed = 0

            // Определяем значение
            if (player.getProperty('arx:is_knocked') != 0) { diggingSpeed -= 255 }

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
            if (getScore(player, "respawn_delay") > 0) { blockFreezing = true }
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
    }

    // Запуск участков mcfunction движка
    world.getDimension("minecraft:overworld").runCommand("function core_parts/20ticks")
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/20ticks")
}, 20);

// Отображение маны
function displayMP(player) {
    // Если мы отображаем целыми
    if (player.getDynamicProperty("myRule:manaDisplayMode") === 'integers')
        player.runCommand(`title @s actionbar ${Math.floor(player.getDynamicProperty("mp"))} §1MP`)
    // Если мы отображаем дробными
    else if (player.getDynamicProperty("myRule:manaDisplayMode") === 'decimals') {
        player.runCommand(`title @s actionbar ${player.getDynamicProperty("mp").toFixed(1)} §1MP`)
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