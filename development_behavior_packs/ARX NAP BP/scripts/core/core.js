// Arx core manager

// Импорт - основа
import { system, world, EntityComponentTypes, EquipmentSlot, MolangVariableMap } from "@minecraft/server"

import { getScore, setScore } from '../scoresOperations'
import { calculateXPMultiplier, increaseSkillLevel, increaseSkillProgress, wipeSkills } from '../skillsOperations'
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
import { ssDP, iDP } from '../DPOperations'
import { acquireTrait } from "../traits/traitsOperations"
import { sendToActionBar } from './actionBarCore'

// Импорт - другие области движка
import { getNearestPlayer } from "../getNearestPlayer"
import { queueCommand } from "../commandQueue"
import { msgFromGuide, parceChatCommand } from "../chat"
import './ambience_core'
import './dynamicLightCore'
import { getEntityFamilies } from "../_main"
import { infoScreen } from "../info/_infoScreen"

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

    const umps = world.getDimension('minecraft:overworld').getEntities({ type: 'arx:ump' })
    for (const ump of umps) {
        ump.dimension.spawnParticle('arx:march_railgun_bullet', ump.location)
    }

    for (const player of world.getPlayers()) {

        // Сколько тактов игрок жмет пробел?
        if (player.getDynamicProperty('pressedJumpButton')) iDP(player, 'pressedJumpButtonTicks')
        else ssDP(player, 'pressedJumpButtonTicks', 0)

        // Откат блокировки
        if (player.getDynamicProperty('blockingResistanceCD') > 0) {
            iDP(player, 'blockingResistanceCD', -1)
            if (player.getDynamicProperty('blockingResistanceCD') === 0) {
                player.runCommand('event entity @s arx:property_is_knockout_set_0')
            }
        }
        if (player.getDynamicProperty('blockingPlayerWasAttacked') > 0) {
            iDP(player, 'blockingPlayerWasAttacked', -1)
        }

        // Призрак и его механики
        if (player.getProperty("arx:is_ghost") == true) {
            const isSneaking = player.getTags().includes("is_sneaking")

            // Определяем, можно ли нам левитировать из-за блоков
            let allow_levitate = false
            // В i < num, num отвечает за высоту полёта призрака
            for (let i = 0; i < 2; i++) {
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
            if (((player.getDynamicProperty('pressedJumpButton') && player.getDynamicProperty('pressedJumpButtonTicks') > 5) && allow_levitate) || force_to_levitate) {

                if (player.getDynamicProperty('ghostBoostByScarletMoon')) {
                    player.addEffect("levitation", 2, { amplifier: 4, showParticles: false })
                } else {
                    player.addEffect("levitation", 2, { amplifier: 0, showParticles: false })
                }

                player.addEffect("slow_falling", 100, { amplifier: 0, showParticles: false })
            }
        }

        // Отображение кд атаки
        let attackCD = player.getDynamicProperty("attackCD")
        if (attackCD > 0 || player.getDynamicProperty("prohibit_damage") > 0) {
            // Уменьшение отката атаки
            if (attackCD > 0) { iDP(player, 'attackCD', -1); attackCD -= 1 }
            // Уменьшение отката блока
            if (player.getDynamicProperty("prohibit_damage") > 0) iDP(player, 'prohibit_damage', -1)

            let stringToDisplay
            // Отображаем в тактах
            if (player.getDynamicProperty("myRule:showAttackCDMode") == 'ticks') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) stringToDisplay = ` §c${attackCD}`
                else stringToDisplay = ` ${attackCD}`
            }
            // Секундах
            else if (player.getDynamicProperty("myRule:showAttackCDMode") == 'seconds') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) stringToDisplay = ` §c${Math.ceil(attackCD / 20)}`
                else stringToDisplay = ` ${Math.ceil(attackCD / 20)}`
            }
            // Дробных долях секунд
            else if (player.getDynamicProperty("myRule:showAttackCDMode") == 'secondsFloat') {
                if (player?.getDynamicProperty("prohibit_damage") > 0) stringToDisplay = ` §c${(attackCD / 20).toFixed(1)}`
                else stringToDisplay = ` ${(attackCD / 20).toFixed(1)}`
            }
            // Строкой
            else if (player.getDynamicProperty("myRule:showAttackCDMode") == 'line') {
                let damageString = ''
                if (player?.getDynamicProperty("prohibit_damage") > 0) {
                    for (let i = 0; i < Math.ceil(attackCD / 10); i++) { damageString += '=' }
                    damageString += "§f"
                    stringToDisplay = ` §c${damageString}§f `
                }
                else {
                    for (let i = 0; i < Math.ceil(attackCD / 10); i++) { damageString += '-' }
                    damageString += "§f"
                    stringToDisplay = ` ${damageString} `
                }

            }
            sendToActionBar(player, 'attackCD', stringToDisplay, 2)
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

        // Намокание
        // Основное намокание задается через DP wetness
        {
            // Определяем состояния игрока
            const inRain = player.hasTag('in_water') && !player.hasTag('in_block_water')
            let isBoatNearby = false
            for (const entity of player.dimension.getEntities({ maxDistance: 1 })) {
                if (getEntityFamilies(entity).includes('boat')) isBoatNearby = true
            }
            const inBoat = player.hasTag('is_riding') && isBoatNearby

            // Зонт или амулет ненамокания 
            const holdingUmbrella = checkForItem(player, 'mainhand', 'arx:umbrella_golden_silk') || checkForItem(player, 'mainhand', 'arx:umbrella_silk') || checkForItem(player, 'mainhand', 'arx:umbrella_skin') || checkForItem(player, 'mainhand', 'arx:umbrella_small_silk')
            for (let playerNearUmbrella of getPlayersInRadius(player, 1.5, false)) {
                ssDP(playerNearUmbrella, 'someoneCoversWithUmbrella', true)
            }
            const antiRainAmul = checkForItem(player, 'Legs', 'arx:amul_sapphire')

            // Намокаем или сохнем, зависимо от ситуации
            let wetness = player.getDynamicProperty('wetness') ?? 0
            // В воде
            if (player.hasTag('in_block_water') && !inBoat) wetness += 10
            // Под дождём
            else if (inRain && !antiRainAmul && !holdingUmbrella && !player.hasTag('underground') && !player.getDynamicProperty('someoneCoversWithUmbrella')) wetness += 1
            // Высыхание в аду
            else if (player.dimension.id === 'minecraft:nether') wetness -= 4
            // Высыхание
            else wetness -= 1

            // Обрабатываем границы намокания
            if (wetness > 600) wetness = 600
            if (wetness < 0) wetness = 0

            // Отбражение
            if (wetness > 0) {
                let waterIcons = wetness < 200 ? "" : wetness < 400 ? "" : ""
                if (wetness === 1) sendToActionBar(player, 'wetness', 'Вы высохли', 20)
                else sendToActionBar(player, 'wetness', `${waterIcons} §bВы промокли §f${waterIcons}`, 2)
            }

            // Партиклы
            if (wetness > 0) {
                for (let i = 0; i < Math.random() * 7; i++) {
                    player.dimension.spawnParticle('arx:arx_water_splash_particle', { x: player.location.x + (Math.random() - 0.5) * 0.4, y: player.location.y + (Math.random() - 0.5) * 0.4, z: player.location.z + (Math.random() - 0.5) * 0.4 })
                }
            }

            // В самом конце
            ssDP(player, 'wetness', wetness)
            ssDP(player, 'someoneCoversWithUmbrella', false)
        }
    }
}, 1);

// 2 ticks
system.runInterval(() => {
    world.getDimension("minecraft:overworld").runCommand("function core_parts_NAP/2ticks")
    for (const player of world.getPlayers()) {

        // Античит - автоклик
        {
            const clicks = player.getDynamicProperty('anticheat:autoclick_tracker')
            if (clicks > 0) {
                if (clicks > 2) {
                    console.warn(`${player.name} имеет подозрителькую скорость клика: ${clicks}/0.1сек`)
                }
                ssDP(player, 'anticheat:autoclick_tracker', 0)
            }
        }

        // Откат амулета гиперсинергии
        if (player.getDynamicProperty('amul_hypersynergyCD') > 0) {
            if (player.getDynamicProperty('amul_hypersynergyCD') === 1) {
                queueCommand(player, 'playsound tick @s ~ ~ ~')
            }
            iDP(player, 'amul_hypersynergyCD', -1)
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
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: basicStrength -= checkForTrait(player, 'conscious') ? 3 : 4; break
                case 3: basicStrength -= 2; break
                case 2: basicStrength -= 1; break
                case -2: basicStrength += 1; break
                case -3: basicStrength += 2; break
                case -4: basicStrength += 3; break
            }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { basicStrength -= player.getDynamicProperty('intoxicationLevel') * 2 }

            // Штрафовое срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 0) { basicStrength -= (player?.getDynamicProperty('overLoading') * 3) }

            // Срезание от кольца гладиатора
            if ((checkForItem(player, 'Feet', 'arx:ring_aluminum_amethyst') || checkForItem(player, 'Offhand', 'arx:ring_aluminum_amethyst')) && basicStrength > 1) basicStrength = 1

            // Штраф от запрета атаки
            if (player?.getDynamicProperty("prohibit_damage") > 0) { basicStrength -= 999 }

            // Штрафовое срезание от отката
            basicStrength -= Math.ceil(player.getDynamicProperty("attackCD") / 20) * 4

            // Выставляем силу
            basicStrength < -30 ? player.runCommand(`event entity @s arx:setBasicStrength_-30`) : player.runCommand(`event entity @s arx:setBasicStrength_${basicStrength}`)

            // Записывание в DP
            ssDP(player, 'basicStrength', basicStrength)
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
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: mpRegenPower -= checkForTrait(player, 'conscious') ? 0.3 : 0.4; break
                case 3: mpRegenPower -= 0.2; break
                case 2: mpRegenPower -= 0.1; break
                case -2: mpRegenPower += 0.1; break
                case -3: mpRegenPower += 0.2; break
                case -4: mpRegenPower += 0.4; break
            }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { mpRegenPower -= player.getDynamicProperty('intoxicationLevel') }

            // Увеличение от прокачки
            mpRegenPower += player.getDynamicProperty('skill:mp_regen_level') / 3

            ssDP(player, "mpRegenPower", mpRegenPower)

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
            if (checkForItem(player, "Head", "arx:royal_sorrel_flower")) { maxMp += 5 }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { maxMp += 10 }

            // От черты
            if (checkForTrait(player, 'enlightened')) { maxMp += 5 }
            if (checkForTrait(player, 'stupid')) { maxMp -= 5 }

            // Штраф от увядания призрака
            maxMp -= player.getDynamicProperty("ghostWitheringLevel") * 3

            // Воздействие стресса
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: maxMp -= checkForTrait(player, 'conscious') ? 15 : 20; break
                case 3: maxMp -= 10; break
                case 2: maxMp -= 5; break
                case -2: maxMp += 5; break
                case -3: maxMp += 10; break
                case -4: maxMp += 15; break
            }

            // Срезание от отравления
            if (player.getDynamicProperty('intoxicationLevel') >= 2) { maxMp -= player.getDynamicProperty('intoxicationLevel') * 4 }

            // Увеличение от прокачки
            maxMp += player.getDynamicProperty('skill:mana_level') * 5

            // От пермабонуса
            maxMp += player.getDynamicProperty('MPPermanentBonus')

            // Записываем максмп в дп
            ssDP(player, "maxMp", maxMp)

            // Макс мана отрицательна
            if (maxMp < 0 || player.getDynamicProperty("mp") < 0) {
                ssDP(player, 'mp', 0)
            }
            // Регенерируем
            else if (player.getDynamicProperty("mp") < maxMp) {
                // Реген маны
                if (mpRegenPower > 0) {
                    iDP(player, "mp", mpRegenPower / 10)
                }
                // Если нам надо плавно накопить ману от зелий
                if (player.getDynamicProperty('MPSmoothAccrue') > 0) {
                    iDP(player, "mp")
                    iDP(player, 'MPSmoothAccrue', -1)
                }
                displayMPAndAdjacent(player)
            }
            // Мана больше макс маны
            else if (player.getDynamicProperty("mp") > maxMp) { // Маны больше чем надо
                ssDP(player, 'mp', maxMp)
                ssDP(player, 'MPSmoothAccrue', 0)
                displayMPAndAdjacent(player)
            }
            // Мана равна макс мане
            else {
                ssDP(player, 'MPSmoothAccrue', 0)

                // Определяем, что у нас за предмет
                const item = player.getComponent(EntityComponentTypes.Equippable).getEquipment(EquipmentSlot.Mainhand)

                // Если мы держим посох
                if (item?.getTags().includes('is_staff')) {
                    displayMPAndAdjacent(player)
                }

                // Если мы держим руну
                else if (item?.getTags().includes('is_wand')) {
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
            if (checkForItem(player, "Feet", "arx:ring_aluminum_chrysolite")) speedPower += 5
            if (checkForItem(player, "Offhand", "arx:ring_aluminum_chrysolite")) speedPower += 5

            if (checkForItem(player, "Feet", "arx:ring_gold_chrysolite")) speedPower += 10
            if (checkForItem(player, "Offhand", "arx:ring_gold_chrysolite")) speedPower += 10

            if (checkForItem(player, "Feet", "arx:ring_naginitis_chrysolite")) speedPower += 20
            if (checkForItem(player, "Offhand", "arx:ring_naginitis_chrysolite")) speedPower += 20

            if (checkForItem(player, "Feet", "arx:ring_caryite_chrysolite")) speedPower += 30
            if (checkForItem(player, "Offhand", "arx:ring_caryite_chrysolite")) speedPower += 30

            if (checkForItem(player, "Feet", "arx:ring_toliriite_chrysolite")) speedPower += 40
            if (checkForItem(player, "Offhand", "arx:ring_toliriite_chrysolite")) speedPower += 40

            if (checkForItem(player, "Feet", "arx:ring_lamenite_chrysolite")) speedPower += 50
            if (checkForItem(player, "Offhand", "arx:ring_lamenite_chrysolite")) speedPower += 50

            if (player.getDynamicProperty('speedBonusByPotion') > 0) speedPower += 20 || 0

            // От экипировки
            if (checkForItem(player, "Feet", "arx:leg_bag_dual")) speedPower -= 8 || 0

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) speedPower += 30 || 0

            // Увеличение от уровня
            speedPower += player.getDynamicProperty("skill:running_level") * 2 || 0

            // Срезание от попадания по блокирующему
            speedPower -= (player.getDynamicProperty("blockingPlayerWasAttacked") * 1.2) || 0

            // Увеличение от роста
            speedPower += Math.round((player.getDynamicProperty("height") - 150) / 9) || 0

            // Увеличение от навыка плавания
            if (player.hasTag('in_block_water')) {
                speedPower += player.getDynamicProperty('skill:swimming_level') * 5 || 0
            }

            // Увеличение от бонуса фиоликса
            if (player.getDynamicProperty('statsBonusByFiolix') > 0) { speedPower += 25 }

            // Воздействие стресса
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: speedPower -= checkForTrait(player, 'conscious') ? 30 : 40; break
                case 3: speedPower -= 20; break
                case 2: speedPower -= 10; break
                case -2: speedPower += 10; break
                case -3: speedPower += 20; break
                case -4: speedPower += 30; break
            }

            // Штраф от намокания
            if (player.getDynamicProperty('wetness') > 200) speedPower -= 10
            if (player.getDynamicProperty('wetness') > 400) speedPower -= 10

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

            if (player.hasTag('is_sprinting')) { speedPower += 25 }

            // Скорость - реализация
            if (speedPower && player.getDynamicProperty("speedPower") != speedPower) {
                const movementComponent = player.getComponent("minecraft:movement")
                movementComponent.setCurrentValue(speedPower / 1000)
                ssDP(player, "speedPower", speedPower)
            }
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
                world.getDimension('minecraft:overworld').runCommand(`playsound portal.passive @a ${portal[0]} ${portal[1]} ${portal[2]} 0.1 1`)
            }
        }
    }

    for (const player of world.getPlayers()) {

        // Открывание книжки
        if (player.getDynamicProperty('ui:readyToOpenInfoBook') && player.hasTag('is_moving')) {
            ssDP(player, 'ui:readyToOpenInfoBook', false)
            infoScreen(player)
        }

        // Счётчик пройденного расстояния
        {
            if (player.hasTag('is_moving') && player.getGameMode() !== 'Creative' && player.getGameMode() !== 'Spectator') {
                iDP(player, "statistics:distance", 1.04 * (player.getDynamicProperty('speedPower') / 100))
            }
        }

        // Анализ мощности освещения (0 - нет, 15 - макс.)


    }

    world.getDimension("minecraft:overworld").runCommand("function core_parts/5ticks")
}, 5);

// 10 ticks
system.runInterval(() => {
    for (const player of world.getPlayers()) {

        // Партиклы от деражщих факел
        if (checkForItem(player, 'Mainhand', 'minecraft:torch') || checkForItem(player, 'Mainhand', 'minecraft:soul_torch') || checkForItem(player, 'Mainhand', 'minecraft:copper_torch') || checkForItem(player, 'Mainhand', 'minecraft:redstone_torch')) player.runCommand('execute positioned ~ ~1.9 ~ run particle minecraft:basic_smoke_particle ^-0.3 ^0 ^0.4')

        // Прыжки
        if (player.getDynamicProperty('pressedJumpButton')) {
            if (player.getDynamicProperty('saturation') > 0) iDP(player, 'saturation', -1)
        }

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
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: jumpPower -= checkForTrait(player, 'conscious') ? 2 : 3; break
                case 3: jumpPower -= 1; break
                case -3: jumpPower += 1; break
                case -4: jumpPower += 2; break
            }

            // Штраф от намокания
            if (player.getDynamicProperty('wetness') > 200) { jumpPower -= 1 }
            if (player.getDynamicProperty('wetness') > 400) { jumpPower -= 1 }

            // Срезание от перегруза
            if (player?.getDynamicProperty('overLoading') > 0) { jumpPower -= player.getDynamicProperty("overLoading") }

            // Адаптация для выдачи эффектом
            jumpPower = Math.round(jumpPower)

            // Отправка в DP
            ssDP(player, "jumpPower", jumpPower)

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
            ssDP(player, "maxHP", maxHP)

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
// 'dp': 'Сообщение при снижении до 0'
const dynamicPropertiesToDecrease = {
    'saturation': undefined,
    'noRainFog': undefined,
    'noNightFog': undefined,
    'jumpBoostByPotion': '§6Бонус прыжка от зелья закончился',
    'mpRegenBoostByPotion': '§6Бонус регенерации маны от зелья закончился',
    'weighLimitBonusByPotion': '§6Бонус переносимого веса от зелья закончился',
    'speedBonusByPotion': '§6Бонус скорости от зелья закончился',
    'intitoxicationBonusByPotion100': '§6Бонус снятия интоксикации от зелья закончился',
    'intitoxicationBonusByPotion300': '§6Бонус усиленного снятия интоксикации от зелья закончился',
    'freezingBlockByPotion': '§6Неуязвимость к холоду от зелья закончилась',
    'heatingBlockByPotion': '§6Неуязвимость к жаре от зелья закончилась',
    'statsBonusByFiolix': undefined,
    'heatingBlockByScroll': '§6Неуязвимость к жаре от свитка закончилась',
    'scrollOfHealingCD': '§aСвиток исцеления снова можно использовать',
    'autoHPRegenCD': undefined,
    'ghostUltimateResistance': undefined,
    'speedBoostAfterKnockout': undefined,
    'speedBoost:level0': '§6Бонус скорости от заклинания [ур. 1] закончился',
    'speedBoost:level1': '§6Бонус скорости от заклинания [ур. 2] закончился',
    'speedBoost:level2': '§6Бонус скорости от заклинания [ур. 3] закончился',
    'speedBoost:level3': '§6Бонус скорости от заклинания [ур. 4] закончился',
    'shootingBoostBySpell_plus2': '§6Бонус стрельбы от заклинания (+2) закончился',
    'shootingBoostBySpell_plus4': '§6Бонус стрельбы от заклинания (+4) закончился',
    'shootingBoostBySpell_minus2': '§aШтраф стрельбы от заклинания (-2) закончился',
    'shootingBoostBySpell_minus4': '§aШтраф стрельбы от заклинания (-4) закончился',
    'allowArchilight': '§6Действие архисвета закончилось',
    'allowMagilight': '§6Действие магисвета закончилось'
};

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

// 16 ticks (сердцебиение)
system.runInterval(() => {
    for (const player of world.getPlayers()) {
        if (!player.getProperty('arx:is_ghost')) {
            const currentHP = player.getComponent('health').currentValue
            if (currentHP <= 10 && currentHP > 0) {
                const loudness = 1 / currentHP
                const pitch = 0.9 + (1.1 - 0.9) * Math.random()
                const rotationPower = 0.4 / currentHP

                player.runCommand(`playsound heartbeat.default @s ~ ~ ~ ${loudness} ${pitch}`)
                player.runCommand(`camerashake add @s ${rotationPower} 0.1 positional`)
                system.runTimeout(() => {
                    player.runCommand(`camerashake add @s ${rotationPower} 0.1 positional`)
                }, 5)
            }
        }
    }
}, 16)

// 20 ticks
system.runInterval(() => {

    // Партиклы в порочных садах
    world.getDimension('minecraft:overworld').runCommand('particle arx:vicious_gardens_ambiance -2238 15 1806')

    for (const player of world.getPlayers()) {

        // Удаляем магисветы
        if (!player.getDynamicProperty('allowArchilight')) {
            player.runCommand('clear @s arx:archilight')
        }
        if (!player.getDynamicProperty('allowMagilight')) {
            player.runCommand('clear @s arx:magilight')
        }

        // Снижение сытости от спринта
        if (player.hasTag('is_sprinting')) {
            if (player.getDynamicProperty('saturation') > 0) iDP(player, 'saturation', -1)
        }

        // Шизо
        if (checkForTrait(player, 'schizophrenic') && !player.getProperty('arx:is_knocked')) {
            if (Math.random() < 0.01) {
                let sound
                const rand = Math.floor(Math.random() * 10)
                switch (rand) {
                    case 0: sound = 'mob.chicken.say'; break
                    case 1: sound = 'random.explode'; break
                    case 2: sound = 'random.orb'; break
                    case 3: sound = 'random.eat'; break
                    case 4: sound = 'random.chestopen'; break
                    case 5: sound = 'random.break'; break
                    case 6: sound = 'random.door_close'; break
                    case 7: sound = 'random.click'; break
                    case 8: sound = 'fire.fire'; break
                    case 9: sound = 'ambient.weather.lightning.impact'; break
                }
                player.runCommand(`playsound ${sound} @s ~${Math.floor(Math.random() * 17) - 8} ~${Math.floor(Math.random() * 5) - 2} ~${Math.floor(Math.random() * 17) - 8}`)
            }
        }

        // Импульсивный параноик
        if (checkForTrait(player, 'impulsive_par') && !player.getProperty('arx:is_knocked')) {
            if (Math.random() < 0.015) {
                const playersNearImpulsivePar = getPlayersInRadius(player, 3, false)
                const strength = Math.max(player.getDynamicProperty('basicStrength'), 1)
                if (playersNearImpulsivePar.length > 0) {
                    const playerNearImpulsivePar = playersNearImpulsivePar[Math.floor(Math.random() * playersNearImpulsivePar.length)]
                    playerNearImpulsivePar.applyDamage(strength, { damagingEntity: player, cause: 'entityAttack' })
                    player.sendMessage(`§cВы непроизвольно пытаетесь ударить всех подряд, под ваши взмахи попадает ${playerNearImpulsivePar.getDynamicProperty('name')}`)
                    player.runCommand('playanimation @s animation.player.break_limb')
                    playerNearImpulsivePar.sendMessage(`§c${player.getDynamicProperty('name')} как-то странно пытается меня ударить!`)
                }
            }
        }

        // Параноик-мазохист
        if (checkForTrait(player, 'paranoid_mas')) {
            if (Math.random() < 0.002) {
                player.applyDamage(Math.ceil(Math.random() * 3))
                player.sendMessage('§cВы причиняете себе боль, но вам это нравится')
                iDP(player, "stress", -100)
            }
        }

        // Импульсивный токсик
        if (checkForTrait(player, 'impulsive_toxic')) {
            if (Math.random() < 0.008) {

                const nearbyPlayers = getPlayersInRadius(player, 6, false)

                if (nearbyPlayers.length > 0) {
                    let phrases
                    if (nearbyPlayers.length === 1) phrases = checkForTrait(player, 'rude') ? ['Ёб твою мать', 'Шёл бы ты нахуй', 'Чтоб ты помер, блядина', 'Иди в очко, скотина ебаная', 'Поешь говна, сучка'] :
                        ['Вот дерьмо', 'Иди в жопу', 'Достало', 'Чтоб ты сдох']
                    else phrases = checkForTrait('rude') ? ['Ёб вашу мать', 'Идите нахуй, уёбки', 'Чтоб вы все передохли к хуям', 'Чтоб вас всех крысы нахуй порвали'] :
                        ['Вот дерьмо', 'Идите все в жопу', 'Достало', 'Чтоб вы все сдохли']
                    parceChatCommand(player, phrases[Math.floor(Math.random() * phrases.length)])
                }
            }
        }

        // Перерасчитываем множитель получаемого опыта
        calculateXPMultiplier(player)

        // Уменьшение DP из dynamicPropertiesToDecrease
        for (const dp in dynamicPropertiesToDecrease) {
            const DPValue = player.getDynamicProperty(dp)

            if (DPValue > 0) {
                iDP(player, dp, -1)

                if (DPValue === 1 && dynamicPropertiesToDecrease[dp] !== undefined) {
                    player.sendMessage(dynamicPropertiesToDecrease[dp])
                }
            }
        }

        // Сколько живет персонаж?
        if (player.getDynamicProperty('hasRegisteredCharacter')) {
            iDP(player, 'characterLifeSec')
        }

        // Телепортация на маяк
        if (player.getDynamicProperty('magicBeacon') > 0) {
            iDP(player, 'magicBeacon', -1)
            if (player.getDynamicProperty('magicBeacon') === 0) {
                const entities = player.dimension.getEntities()
                for (const entity of entities) {
                    if (entity.typeId === 'arx:magic_beacon' && entity.hasTag(player.name)) {
                        player.runCommand('particle arx:portal_fog')
                        player.teleport(entity.location)
                        player.runCommand('camera @s fade time 0 0 1 color 200 0 150')
                        player.runCommand('event entity @e[type=arx:magic_beacon, r = 0.1] arx:suicide')
                        queueCommand(player, "playsound pallada_beacon @a ~ ~ ~")
                        player.runCommand('particle arx:portal_fog')
                        queueCommand(player, "camerashake add @a[r=8] 1 0.1")
                        break
                    }
                }
            }
            else if (player.getDynamicProperty('magicBeacon') < 4) {
                player.runCommand('playsound tick @s ~ ~ ~')
                const entities = player.dimension.getEntities()
                for (const entity of entities) {
                    if (entity.typeId === 'arx:magic_beacon' && entity.hasTag(player.name)) {
                        entity.runCommand('particle arx:beacon_fog ~ ~ ~')
                        break
                    }
                }
            }
        }

        // Система счастья - стресса
        if (player.getDynamicProperty('respawnDelay') === 0 && player.getGameMode() == 'Survival') {
            // Заводим JS переменные
            let stress = player.getDynamicProperty('stress') // Стресс
            let stressLevel = player.getDynamicProperty('stressLevel') // Уровень стресса
            let stressDynamic = player.getDynamicProperty('stressDynamic') // Корректирующая динамика

            // Случайные события
            const goodTimesProb = (checkForTrait(player, 'skilled_fisherman') && checkForItem(player, 'mainhand', 'minecraft:fishing_rod')) ? 0.0002 : 0.0001
            const stressBonus = checkForTrait(player, 'indifference') ? 1500 : 750
            if (Math.random() < goodTimesProb) {
                player.sendMessage(' Вы вспомнили хорошие времена. Это подняло ваше настроение.')
                stress -= stressBonus;
            } else if (Math.random() < 0.0001 && !checkForTrait(player, 'inflexible')) {
                player.sendMessage(' Вы вспомнили плохие времена. Это испортило ваше настроение.')
                stress += stressBonus;
            }

            // Чилл в водичке
            if (checkForTrait(player, 'water_lover') && player.hasTag('in_block_water')) { stress -= 3 }
            // Депрессия в водичке
            if (checkForTrait(player, 'aquaphobe') && player.hasTag('in_block_water')) { stress += 3 }

            // Стресс при низком здоровье
            if (player.hasTag('very_low_hp')) { stress += 25 }
            else if (player.hasTag('low_hp')) { stress += 8 }

            // Падение стресса к нейтральным значениям
            const decreaseValue = checkForTrait(player, 'kind') ? stress / 750 : stress / 1000
            if (stress > 800) stress -= decreaseValue // Если стресс высокий, падение ускорено.
            else if (stress < -800) stress += 1

            // Черта манипулятор
            if (checkForTrait(player, 'manipulator')) {
                const playersNearManipulator = getPlayersInRadius(player, 8, false)
                for (let playerNearManipulator of playersNearManipulator) {
                    iDP(playerNearManipulator, 'stress')
                    iDP(player, 'stress', -1)
                }
            }

            // Черта харизматик
            if (checkForTrait(player, 'charismatic')) {
                const playersNearCharismatic = getPlayersInRadius(player, 8, false)
                for (let playerNearCharismatic of playersNearCharismatic) {
                    iDP(playerNearCharismatic, 'stress', -2)
                }
            }

            // Черта общительный
            if (checkForTrait(player, 'communicative')) {
                const increaseValue = getPlayersInRadius(player, 8, false).length === 0 ? 2 : -2
                iDP(player, 'stress', increaseValue)
            }

            // Черта страх темноты
            if (checkForTrait(player, 'nodarkness') && player.hasTag('low_bright')) {
                iDP(player, 'stress', 5)
            }

            // Черта страх глубин
            if (checkForTrait(player, 'nomines') && player.location.y < 0) {
                iDP(player, 'stress', 5)
            }

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
            else {
                stressLevel = 4
                // Выдаем черту, если под стрессом
                const traitRand = Math.random()

                let traitProbability

                if (checkForTrait(player, 'unstable')) traitProbability = 0.005
                else traitProbability = 0.0025

                if (traitRand < traitProbability) {
                    acquireTrait(player, [2, 3, 4])
                }
            }

            // Вывод в чат
            let stressLevelOld = player.getDynamicProperty('stressLevel') // Уровень стресса в прошлый проход
            if (stressLevelOld != stressLevel) {

                const stressLevelAbs = Math.abs(stressLevel)

                const word1 = stressLevelOld < stressLevel ? "хуже" : "лучше"
                const icon = stressLevel > 0 ? '' : stressLevel === 0 ? '' : ''
                const word2 = stressLevel > 0 ? 'стресса' : 'счастья'
                const color = stressLevel > 1 ? '§c' : stressLevel < -1 ? '§a' : ''

                const stressOutputLevel = stressLevelAbs == 4 ? 'Макс.' : stressLevelAbs.toString()

                player.sendMessage(`[Стало ${word1}] ${icon.repeat(stressLevelAbs != 0 ? stressLevelAbs : 1)} (${color}${stressOutputLevel} §fур. ${word2})`)
            }

            // Записываем полученные переменные в DP
            ssDP(player, 'stress', stress) // Стресс
            ssDP(player, 'stressLevel', stressLevel) // Уровень стресса
            ssDP(player, 'stressDynamic', stressDynamic) // Корректирующая динамика
        }

        // Анимации бездействия
        {
            // Анализируем, когда надо анимировать
            if (player.hasTag('is_moving')) { setScore(player, "move_delay", killingTimeAnimDelay) }
            else {
                const currentDelay = getScore(player, "move_delay") ?? 0;
                setScore(player, "move_delay", currentDelay - 1);
            }

            if (getScore(player, "move_delay") <= 0) {
                animate_killing_time(player)
                setScore(player, 'move_delay', 20)
            }
        }

        // Уменьшение no_fog
        if (getScore(player, "no_fog") > 0) {
            player.runCommand('scoreboard players add @s no_fog -1')
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
            ssDP(player, "ghostBoostByScarletMoon", player.getProperty('arx:is_ghost') && player.hasTag('scarlet_night') && !player.hasTag('underground'))

            if (player.getDynamicProperty('ghostBoostByScarletMoonLastPass') == false && player.getDynamicProperty('ghostBoostByScarletMoon') == true) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cСвет луны наполняет вас невероятной мощью..." } ] }`)
                if (player.getDynamicProperty('stress') > -1200) {
                    ssDP(player, 'stress', -1200)
                }
            }

            if (player.getDynamicProperty('ghostBoostByScarletMoonLastPass') == true && player.getDynamicProperty('ghostBoostByScarletMoon') == false) {
                player.runCommand(`tellraw @s { "rawtext": [ { "text": "§cМощь уходит..." } ] }`)
            }

            ssDP(player, 'ghostBoostByScarletMoonLastPass', player.getDynamicProperty('ghostBoostByScarletMoon'))
        }

        // Анализ туманов
        {
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
            // Если у игрока сняты туманы 
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
            if (checkForTrait(player, 'tenacious')) ssDP(player, 'autoHPRegenCD', 80)
            else ssDP(player, 'autoHPRegenCD', 90)

            player.addEffect("regeneration", 200, { amplifier: 0, showParticles: false })
        }

        // Игроки без персонажа
        if (player.getDynamicProperty('hasRegisteredCharacter') === false) {
            player.runCommand('effect @s regeneration 2 255 true')
            ssDP(player, 'saturation', 720)
        }

        // Механики призрака
        if (player.getDynamicProperty('ghostUltimateResistance') == 1) {
            player.runCommand('tellraw @s { "rawtext": [ { "text": "§сНеуязвимость призрака истекла" } ] }')
        }
        if (player.getProperty("arx:is_ghost") == true) {
            // Увядание призрака. Каждые 8 часов (= 28800 сек) призрак безвозвратно теряет характеристики
            iDP(player, 'ghostWithering')

            const ghostWitheringLevel = Math.floor(player.getDynamicProperty('ghostWithering') / 28800)
            // Отчитываемся, если увядание возросло
            if (ghostWitheringLevel > player.getDynamicProperty('ghostWitheringLevel')) {
                player.runCommand('tellraw @s { "rawtext": [ { "text": "§4Вы всё больше теряете связь с этим миром..." } ] }')
            }
            // Записываем уровень увядания
            ssDP(player, 'ghostWitheringLevel', ghostWitheringLevel)

            // Насыщаем
            ssDP(player, 'saturation', 2)
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
            ssDP(player, 'music_location_previous', 0)
            player.removeTag("just_entered_arx")
        }

        // Интерфейс вкусов
        if (player.hasTag("showTastesUI")) {
            player.removeTag("showTastesUI")
            showTastesRerollUI(player)
        }

        // Интоксикация
        {
            // Расчёт снятия интоксикации
            let intoxicationDecreasePower = 100 // По умолчанию

            // Бонус от колец
            if (checkForItem(player, "Feet", "arx:ring_aluminum_aquamarine")) { intoxicationDecreasePower += 50 }
            if (checkForItem(player, "Feet", "arx:ring_gold_aquamarine")) { intoxicationDecreasePower += 100 }
            if (checkForItem(player, "Feet", "arx:ring_naginitis_aquamarine")) { intoxicationDecreasePower += 200 }
            if (checkForItem(player, "Feet", "arx:ring_caryite_aquamarine")) { intoxicationDecreasePower += 300 }
            if (checkForItem(player, "Feet", "arx:ring_malafiotironite_aquamarine")) { intoxicationDecreasePower += 400 }
            if (checkForItem(player, "Feet", "arx:ring_lamenite_aquamarine")) { intoxicationDecreasePower += 500 }

            // Бонус от зелий
            if (player.getDynamicProperty('intitoxicationBonusByPotion100') > 0) { intoxicationDecreasePower += 100 }
            if (player.getDynamicProperty('intitoxicationBonusByPotion300') > 0) { intoxicationDecreasePower += 300 }

            // Записываем получившееся значение
            ssDP(player, 'intoxicationDecreasePower', intoxicationDecreasePower)

            // Снятие интоксикации
            if (player.getDynamicProperty('intoxication') > 0) iDP(player, 'intoxication', -intoxicationDecreasePower / 100)
            else if (player.getDynamicProperty('intoxication') < 0) ssDP(player, 'intoxication', 0)

            // Расчитываем степень интоксикации
            const intoxicationLevel = Math.round(player.getDynamicProperty('intoxication') / 1000)

            // Если есть какая-то динамика интоксикации
            if (player.getDynamicProperty("intoxicationLevel") != intoxicationLevel) {
                const intoxicationLevelColor =
                    intoxicationLevel == 0 ? '§a' :
                        intoxicationLevel == 1 ? '§e' : '§c'

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
                if (!checkForTrait(player, 'persistent')) iDP(player, 'stress', 5)
            }
            // 3 ур
            else if (intoxicationLevel == 3) {
                if (Math.random() < 0.2) { player.runCommand(`effect @s nausea 12 0 true`) }
                if (Math.random() < 0.14) { player.runCommand(`effect @s darkness 5 0 true`) }
                if (Math.random() < 0.03) { player.runCommand(`effect @s fatal_poison 5 0 true`) }
                if (!checkForTrait(player, 'persistent')) iDP(player, 'stress', 12)
            }
            // 4 ур
            else if (intoxicationLevel >= 4) {
                player.runCommand(`effect @s nausea 10 0 true`)
                player.runCommand(`effect @s blindness 5 0 true`)
                if (Math.random() < 0.2) { player.runCommand(`effect @s fatal_poison 5 1 true`) }
                if (!checkForTrait(player, 'persistent')) iDP(player, 'stress', 30)
            }

            ssDP(player, 'intoxicationLevel', intoxicationLevel)
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
                iDP(player, 'stress', bonusByEatenFiolix * happinessMultiplier * -1)
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
            ssDP(player, 'FiolixNarcoticPower', FiolixNarcoticPower)
            // Внутренняя переменная для отслеживания динамики
            ssDP(player, 'FiolixNarcoticPowerLastPass', FiolixNarcoticPower)
            // Бонусы от съедания наркотиков
            if (statsBonusByFiolix > 0) ssDP(player, 'statsBonusByFiolix', statsBonusByFiolix)

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

            // Прибавка от заклинаний
            if (player.getDynamicProperty('shootingBoostBySpell_plus2')) rangedAttackAccuracy += 2
            if (player.getDynamicProperty('shootingBoostBySpell_plus4')) rangedAttackAccuracy += 4
            if (player.getDynamicProperty('shootingBoostBySpell_minus2')) rangedAttackAccuracy -= 2
            if (player.getDynamicProperty('shootingBoostBySpell_minus4')) rangedAttackAccuracy -= 4

            // Бонус для призака алой ночью
            if (player.getDynamicProperty('ghostBoostByScarletMoon')) rangedAttackAccuracy += 3

            // Штраф от темноты
            if (player.hasTag("low_bright")) { rangedAttackAccuracy -= 3 }

            // Штраф от увядания призрака
            rangedAttackAccuracy -= player.getDynamicProperty("ghostWitheringLevel")

            // Воздействие стресса
            switch (player.getDynamicProperty('stressLevel')) {
                case 4: rangedAttackAccuracy -= checkForTrait(player, 'conscious') ? 3 : 4; break
                case 3: rangedAttackAccuracy -= 2; break
                case 2: rangedAttackAccuracy -= 1; break
                case -2: rangedAttackAccuracy += 1; break
                case -3: rangedAttackAccuracy += 2; break
                case -4: rangedAttackAccuracy += 3; break
            }

            // Нормализуем значение
            if (rangedAttackAccuracy < 0) { rangedAttackAccuracy = 0 }
            if (rangedAttackAccuracy > 20) { rangedAttackAccuracy = 20 }

            player.setProperty("arx:ranged_attack_accuracy", rangedAttackAccuracy)
        }

        // Копание
        {
            let diggingSpeed = 0

            // Определяем значение
            if (player.getProperty('arx:is_knocked')) { diggingSpeed -= 255 }

            // Штраф от намокания
            if (player.getDynamicProperty('wetness') > 200) { diggingSpeed -= 1 }
            if (player.getDynamicProperty('wetness') > 400) { diggingSpeed -= 1 }

            // Нормализуем
            if (diggingSpeed < -255) { diggingSpeed = -255 }
            if (diggingSpeed > 255) { diggingSpeed = 255 }

            // Исполняем
            if (diggingSpeed < 0) { player.runCommand(`effect @s mining_fatigue 2 ${Math.abs(diggingSpeed)} true`) }
            if (diggingSpeed > 0) { player.runCommand(`effect @s haste 2 ${diggingSpeed} true`) }
        }

        // Холод - жара
        if (player.getGameMode() === 'Survival') {
            let freezing = player.getDynamicProperty('freezing')

            // Определяем блокировку холода
            let blockFreezing = false
            if (player.getDynamicProperty('freezingBlockByPotion') > 0) (blockFreezing = true)
            if (checkForItem(player, "legs", "arx:snow_bars_scarf") && !checkForItem(player, "chest", undefined)) (blockFreezing = true)
            if (player.getDynamicProperty('respawnDelay') > 0) { blockFreezing = true }
            if (player.getProperty('arx:is_ghost') == true) { blockFreezing = true }
            if (player.hasTag('heating_by_heater_block_activate')) { blockFreezing = true }

            // Увеличение холода
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



                const symbolType = freezing > 0 ? "" : ""
                const message = freezing > 0 ? " §bВы замерзаете§f " : " §cВам жарко§f "

                let symbolLine = ''
                for (let i = 0; i < numOfSymbols; i++) {
                    symbolLine += symbolType
                }

                const resultLine = symbolLine + message + symbolLine

                sendToActionBar(player, 'freezing', resultLine, 20)
            }

            // Урон
            const damageType = freezing > 0 ? 'freezing' : 'fire'

            // Можно ли вообще нанести урон
            if (Math.abs(freezing) > 20) {
                if (Math.random() < (Math.abs(freezing) / 100)) {
                    player.runCommand(`damage @s 1 ${damageType}`)
                }
            }

            ssDP(player, 'freezing', freezing)
        }

        // Кровотечение при низком хп
        if (player.getProperty('arx:is_ghost') == false) {
            const particleLoc = player.getHeadLocation()
            const molang = new MolangVariableMap()
            const hitDirection = { x: 0, y: 0, z: 0 }
            molang.setVector3('variable.direction', hitDirection)

            if (player.getTags().includes('low_hp') && Math.random() > 0.6) {
                player.dimension.spawnParticle('arx:blood_drop_bright', particleLoc, molang)
            }
            if (player.getTags().includes('very_low_hp')) {
                player.dimension.spawnParticle('arx:blood_drop_bright', particleLoc, molang)
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
                    const text =
                        rand === 0 ? 'Где я...?' :
                            rand === 1 ? 'Сколько прошло времени...?' : 'Как больно...'

                    player.sendMessage(`§o§e${text}\n§7Вы ещё не до конца поняли, что к чему, но уже готовы бежать. (Получен временный бонус скорости)`)
                    ssDP(player, 'speedBoostAfterKnockout', 40)
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
                        iDP(nearbyPlayer, 'reviveDelay', reviveSpeedValue)
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
                            ssDP(nearbyPlayer, 'respawnDelay', 0)
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
                        ssDP(player, 'reviveDelay', 0)
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
            ssDP(player, 'respawnDelayLastPass', player.getDynamicProperty('respawnDelay'))
            if (player.getDynamicProperty('respawnDelay') > 0) {
                iDP(player, 'respawnDelay', -1)
            }

            // Функия рисования линии респавна
            function displayRespawnLine(playerWhoIsKnocked, playerToDisplay) {
                const reviveValue = playerWhoIsKnocked.getDynamicProperty('reviveDelay')
                let resultLine = '§a'
                for (let i = 0; i < reviveValue; i++) {
                    resultLine += '█ '
                }
                sendToActionBar(playerToDisplay, 'respawnLine', resultLine.slice(0, -1), 25) // Выводим, срезая пробел сзади строки
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
        // Вес
        weighAnalysis(player)
    }
}, 60)

// 5s
system.runInterval(() => {
    for (const player of world.getPlayers()) {
        // Генератор травы
        player.dimension.spawnEntity('arx:grass_generator_launcher', player.location)
    }
}, 100)

// Отображение маны
export function displayMPAndAdjacent(player) {

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

        if (staffChannelNum > 1 && !player.getDynamicProperty('hasEverHoldedMultiChannelStaff')) {
            ssDP(player, 'hasEverHoldedMultiChannelStaff', true)
            msgFromGuide(player, 'Вы держите §aмногоканальный посох§f! Чтобы выбрать канал магии, присядьте и поворачивайте камерой вверх-вниз. Чтобы зафиксировать выбранный канал, встанье.')
        }

        const targets = ['§aНа себя', '§6На другого']

        const activeChannel = getActiveStaffChannel(player, staffChannelNum)
        const activeTarget = player.getDynamicProperty(`channel_${activeChannel}_target`)

        sendToActionBar(player, 'magicChannel', `§d${channelRomanNums[activeChannel - 1]} канал`, 2)
        sendToActionBar(player, 'magicTarget', `§d${targets[activeTarget - 1]}`, 2)
        sendToActionBar(player, 'MP', `${manaStr} §1MP`, 2)
    }
    // Мы держим руну
    else if (itemTags?.includes('is_rune')) {

        // Определяем каналы
        let channels = undefined
        if (itemTags?.includes('plumbum_rune')) channels = 4
        else if (itemTags?.includes('naginitis_rune')) channels = 6
        else if (itemTags?.includes('forfacorite_rune')) channels = 10
        else if (itemTags?.includes('special_rune')) channels = 10
        else if (itemTags?.includes('malafiotironite_rune')) channels = 8

        // Не удалось определить каналы
        if (channels === undefined) {
            console.warn(`Не удалось считать количество каналов на руне. Игрок ${player}, предмет ${item.typeId}`)
            return undefined
        }

        const activeChannel = getActiveStaffChannel(player, channels, false)

        sendToActionBar(player, 'magicChannel', `§d${channelRomanNums[activeChannel - 1]} канал`, 2)
        sendToActionBar(player, 'MP', `${manaStr} §1MP`, 2)
    }
    // Мы держим волшебную палочку
    else if (itemTags?.includes('is_wand')) {

        // Определяем каналы
        let channels
        for (const tag of itemTags) {
            if (tag.includes('wand_channels_')) {
                channels = parseInt(tag.slice(14))
            }
        }

        // Не удалось определить каналы
        if (channels === undefined) {
            console.warn(`Не удалось считать количество каналов на палочке. Игрок ${player}, предмет ${item.typeId}`)
            return undefined
        }

        const activeChannel = getActiveStaffChannel(player, channels, false)
        const currentChannel = `channel_${activeChannel}_target`
        const targetRuCurrent = player.getDynamicProperty(currentChannel) === 1 ? '§aна себя' : '§6на другого'
        const targetRuOpposite = player.getDynamicProperty(currentChannel) === 1 ? '§6на другого' : '§aна себя'

        sendToActionBar(player, 'magicChannel', `§d${channelRomanNums[activeChannel - 1]}§f канал ${targetRuCurrent}§f -> §o${targetRuOpposite}`, 2)
        sendToActionBar(player, 'MP', `${manaStr} §1MP`, 2)
    }
    // У нас амулет гиперсинергии
    else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_improved') || checkForItem(player, "Legs", 'arx:amul_hypersynergy_superior')) {

        let channels = undefined

        if (checkForItem(player, "Legs", 'arx:amul_hypersynergy')) channels = 4
        else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy_improved')) channels = 6
        else if (checkForItem(player, "Legs", 'arx:amul_hypersynergy_superior')) channels = 8

        const activeChannel = getActiveStaffChannel(player, channels, false)

        sendToActionBar(player, 'magicChannel', `§7${channelRomanNums[activeChannel - 1]} канал`, 2)
        sendToActionBar(player, 'MP', `${manaStr} §1MP`, 2)
    }

    // Выводим ману в любом случае
    sendToActionBar(player, 'MP', `${manaStr} §1MP`, 2)
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