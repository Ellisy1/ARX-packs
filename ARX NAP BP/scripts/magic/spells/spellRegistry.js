// IMPORTS

// Spells
import { dinHijo } from './SPELLDinHijo'
import { magicDash } from './SPELLMagicDash'
import { speedBoost } from './SPELLSpeedBoost'
import { classicHeal } from './SPELLClassicHeal'
import { instantHeal } from './SPELLInstantHeal'
import { classicDefence } from './SPELLСlassicDefence'
import { changeBustSize } from './SPELLChangeBustSize'
import { chain } from './SPELLChain'
import { throwMob } from './SPELLThrowMob'
import { classicTossing } from './SPELLClassicTossing'
import { classicDamage } from './SPELLClassicDamage'
import { waterOps } from './SPELLWaterOps'
import { giveMagilight } from './SPELLGiveMagilight'
import { fireResistance } from './SPELLFireResistance'
import { dispelMagic } from './SPELLDispelMagic'
import { dispelEffects } from './SPELLDispelEffects'

// Other
import { iDP, ssDP } from '../../DPOperations'
import { setScore, getScore } from '../../scoresOperations';
import { TPWithNoxenessionPortal } from '../../portals';
import { getEntityFamilies } from '../../_main';
import { system } from "@minecraft/server"
import { runeCiphers } from '../rune_cipher_list'

/**
 * Реестр заклинаний
 * Каждое заклинание указывает:
 * - mpCost: стоимость маны
 * - description: описание
 * - validTargets: массив поддерживаемых целей (1 - на себя, 2 - на другого). Если не указано, все цели доступны
 * - onlyOnPlayers: заклинане можно использовать только на игроков
 * - handler: функция, принимающая player, spellData (с информацией о заклинании)
 */

export let spellRegistry = {
    'din hijo': {
        mpCost: 5,
        description: 'заклинание запроса заклинания (4 канала)',
        onlyOnPlayers: true,
        handler: (player, spellData) => { dinHijo(player, 4, spellData) }
    },

    'din hijo mega': {
        mpCost: 10,
        description: 'заклинание запроса заклинания (7 каналов)',
        onlyOnPlayers: true,
        handler: (player, spellData) => { dinHijo(player, 7, spellData) }
    },

    'din hijo mega mega mega': {
        mpCost: 20,
        description: 'заклинание запроса заклинания (10 каналов)',
        onlyOnPlayers: true,
        handler: (player, spellData) => { dinHijo(player, 10, spellData) }
    },

    // Телепортации
    'din yanamo trafantana': {
        mpCost: 15,
        description: 'заклинание активации портала',
        onlyOnPlayers: true,
        handler: (player, spellData) => {
            TPWithNoxenessionPortal(player, spellData.initiator, 'spell');
        }
    },
    'din yanamo trafantana transkursio': {
        mpCost: 80,
        description: 'заклятие телепортации вперёд',
        validTargets: [1],
        handler: (player) => {
            player.dimension.spawnParticle('arx:portal_fog', player.location)
            player.runCommand('tp @s ^ ^ ^3')
            player.dimension.spawnParticle('arx:portal_fog', player.location)
        }
    },

    "sin yanamo trafantana": {
        mpCost: 8,
        description: 'заклинание рывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 7) }
    },
    "sin yanamo trafantana mega": {
        mpCost: 15,
        description: 'заклинание усиленного рывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 14) }
    },
    "sin yanamo trafantana mega mega mega": {
        mpCost: 35,
        description: 'заклинание сверхрывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 30) }
    },

    "sin yanamo trafantana sartagana": {
        mpCost: 16,
        description: 'заклинание призрачного рывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 7, true) }
    },
    "sin yanamo trafantana sartagana mega": {
        mpCost: 30,
        description: 'заклинание призрачного усиленного рывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 14, true) }
    },
    "sin yanamo trafantana sartagana mega mega mega": {
        mpCost: 70,
        description: 'заклинание призрачного сверхрывка',
        validTargets: [1],
        handler: (player) => { magicDash(player, 30, true) }
    },

    // Ускорение
    "sin yanamo sofiso": {
        mpCost: 10,
        description: 'слабое заклинание ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 0) }
    },
    "sin yanamo sofiso disortari": {
        mpCost: 30,
        description: 'слабое заклинание ускорения по площади',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 0) }
    },
    "sin yanamo sofiso sakiifori": {
        mpCost: 60,
        description: 'сверхдлительное заклинание слабого ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 180, 0) }
    },
    "sin yanamo sofiso mega": {
        mpCost: 20,
        description: 'хорошее заклинание ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 1) }
    },
    "sin yanamo sofiso mega disortari": {
        mpCost: 60,
        description: 'хорошее заклинание ускорения по площади',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 1) }
    },
    "sin yanamo sofiso mega sakiifori": {
        mpCost: 120,
        description: 'заклинание сверхдлительного мощного ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 1) }
    },
    "sin yanamo sofiso mega mega": {
        mpCost: 60,
        description: 'мощное заклинание ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 2) }
    },
    "sin yanamo sofiso mega mega mega": {
        mpCost: 120,
        description: 'наимощнейшее заклинание ускорения',
        handler: (entity, spellData) => { speedBoost(entity, spellData, 30, 3) }
    },

    // Хил
    "san yanamo horo": {
        mpCost: 5,
        description: 'слабое заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 0) }
    },
    "san yanamo horo sakiifori": {
        mpCost: 25,
        description: 'слабое заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 0) }
    },
    "san yanamo horo disortari": {
        mpCost: 15,
        description: 'слабое сверхдлительное заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 0) }
    },
    "san yanamo horo sakiifori disortari": {
        mpCost: 75,
        description: 'слабое сверхдлительное заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 0) }
    },

    "san yanamo horo mega": {
        mpCost: 15,
        description: 'хорошее заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 1) }
    },
    "san yanamo horo mega sakiifori": {
        mpCost: 75,
        description: 'хорошее заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 1) }
    },
    "san yanamo horo mega disortari": {
        mpCost: 45,
        description: 'хорошее сверхдлительное заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 1) }
    },
    "san yanamo horo mega sakiifori disortari": {
        mpCost: 225,
        description: 'хорошее сверхдлительное заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 1) }
    },

    "san yanamo horo mega mega mega": {
        mpCost: 45,
        description: 'мощное заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 2) }
    },
    "san yanamo horo mega mega mega sakiifori": {
        mpCost: 225,
        description: 'мощное заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 2) }
    },
    "san yanamo horo mega mega mega disortari": {
        mpCost: 135,
        description: 'мощное сверхдлительное заклинание регенерации',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 10, 2) }
    },
    "san yanamo horo mega mega mega sakiifori disortari": {
        mpCost: 675,
        description: 'мощное сверхдлительное заклинание регенерации по площади',
        handler: (entity, spellData) => { classicHeal(entity, spellData, 60, 2) }
    },

    // Мгновенный реген
    "san yanamo horo sofiso": {
        mpCost: 60,
        description: 'заклинание моментального восстановления',
        handler: (player, spellData) => { instantHeal(player, spellData) }
    },
    "san yanamo horo sofiso disortari": {
        mpCost: 180,
        description: 'заклинание моментального восстановления по площади',
        handler: (player, spellData) => { instantHeal(player, spellData) }
    },

    // Маяк
    "din yanamo trafantana kotoka": {
        mpCost: 40,
        description: 'заклинание маяка с задержкой 10 секунд',
        validTargets: [1],
        handler: (player) => {
            player.sendMessage('§dМаяк установлен')
            player.runCommand('summon arx:magic_beacon ~ ~ ~')
            ssDP(player, 'magicBeacon', 10)
            player.runCommand(`tag @e[type=arx:magic_beacon, r=0.1] add ${player.name}`)
        }
    },
    "din yanamo trafantana sakiifori kotoka": {
        mpCost: 60,
        description: 'заклинание маяка с задержкой 30 секунд',
        validTargets: [1],
        handler: (player) => {
            player.sendMessage('§dМаяк установлен')
            player.runCommand('summon arx:magic_beacon ~ ~ ~')
            ssDP(player, 'magicBeacon', 30)
            player.runCommand(`tag @e[type=arx:magic_beacon, r=0.1] add ${player.name}`)
        }
    },

    // Защита
    "san yanamo shumi": {
        mpCost: 15,
        description: 'слабое заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 0) }
    },
    "san yanamo shumi sakiifori": {
        mpCost: 75,
        description: 'слабое длительное заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 0) }
    },
    "san yanamo shumi disortari": {
        mpCost: 45,
        description: 'слабое заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 0) }
    },
    "san yanamo shumi sakiifori disortari": {
        mpCost: 225,
        description: 'слабое длительное заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 0) }
    },

    "san yanamo shumi mega": {
        mpCost: 45,
        description: 'хорошее заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 1) }
    },
    "san yanamo shumi mega sakiifori": {
        mpCost: 225,
        description: 'хорошее длительное заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 1) }
    },
    "san yanamo shumi mega disortari": {
        mpCost: 135,
        description: 'хорошее заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 1) }
    },
    "san yanamo shumi mega sakiifori disortari": {
        mpCost: 675,
        description: 'хорошее длительное заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 1) }
    },

    "san yanamo shumi mega mega mega": {
        mpCost: 135,
        description: 'мощное заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 2) }
    },
    "san yanamo shumi mega mega mega sakiifori": {
        mpCost: 675,
        description: 'мощное длительное заклинание защиты',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 2) }
    },
    "san yanamo shumi mega mega mega disortari": {
        mpCost: 405,
        description: 'мощное заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 10, 2) }
    },
    "san yanamo shumi mega mega mega sakiifori disortari": {
        mpCost: 2025,
        description: 'мощное длительное заклинание защиты по площади',
        handler: (player, spellData) => { classicDefence(player, spellData, 60, 2) }
    },

    // Цепи
    "sin sukimo": {
        mpCost: 10,
        description: 'заклинание цепи заклинаний',
        validTargets: [1],
        handler: (player) => { chain(player) }
    },

    // Стрельба с лука
    "sin yanamo arrako": {
        mpCost: 15,
        description: 'заклинание слабого улучшения навыка стрельбы из лука',
        onlyOnPlayers: true,
        handler: (player) => {
            ssDP(player, 'shootingBoostBySpell_plus2', 60)
        }
    },
    "sin yanamo arrako mega": {
        mpCost: 45,
        description: 'заклинание мощного улучшения навыка стрельбы из лука',
        onlyOnPlayers: true,
        handler: (player) => {
            ssDP(player, 'shootingBoostBySpell_plus4', 60)
        }
    },
    "sin inoffo arrako": {
        mpCost: 15,
        description: 'заклинание слабого ухудшения навыка стрельбы из лука',
        onlyOnPlayers: true,
        handler: (player) => {
            ssDP(player, 'shootingBoostBySpell_minus2', 60)
        }
    },
    "sin inoffo arrako mega": {
        mpCost: 45,
        description: 'заклинание мощного ухудшения навыка стрельбы из лука',
        onlyOnPlayers: true,
        handler: (player) => {
            ssDP(player, 'shootingBoostBySpell_minus4', 60)
        }
    },

    // Крысы
    "din sukimo ratatao": {
        mpCost: 20,
        description: 'заклинание броска маленькой мышью',
        validTargets: [1],
        handler: (player) => { throwMob(player, 'arx:small_rat_black', 1.5, 'become_agressive') }
    },
    "din sukimo ratatao kotoka": {
        mpCost: 25,
        description: 'заклинание броска маленькой белой мышью',
        validTargets: [1],
        handler: (player) => { throwMob(player, 'arx:small_rat_white', 1.5, 'become_agressive') }
    },
    "din sukimo ratatao mega": {
        mpCost: 60,
        description: 'заклинание броска пещерной крысой',
        validTargets: [1],
        handler: (player) => { throwMob(player, 'arx:cave_rat') }
    },
    "din sukimo ratatao mega mega mega": {
        mpCost: 120,
        description: 'заклинание броска крысиным монстром',
        validTargets: [1],
        handler: (player) => { throwMob(player, 'arx:rat_monstr', 1, 'become_agressive') }
    },
    "din sukimo ratatao mega mega mega kotoka": {
        mpCost: 150,
        description: 'заклинание броска белым крысиным монстром',
        validTargets: [1],
        handler: (player) => { throwMob(player, 'arx:rat_monstr_white', 1, 'become_agressive') }
    },

    "sin yanamo laffaeti": {
        mpCost: 5,
        description: 'слабое заклинание подбрасывания',
        validTargets: [1],
        handler: (player) => { classicTossing(player, 2) }
    },
    "sin yanamo laffaeti mega": {
        mpCost: 15,
        description: 'хорошее заклинание подбрасывания',
        validTargets: [1],
        handler: (player) => { classicTossing(player, 6) }
    },
    "sin yanamo laffaeti mega mega mega": {
        mpCost: 45,
        description: 'мощное заклинание подбрасывания',
        validTargets: [1],
        handler: (player) => { classicTossing(player, 10) }
    },

    "san yanamo marra": {
        mpCost: 10,
        description: 'заклинание метки',
        validTargets: [1],
        handler: (player) => { setScore(player, 'mark', 60) }
    },

    "san yanamo ratatao elletera": {
        mpCost: 30,
        description: 'заклинание успокоения всех крыс, у которых есть спокойная фаза',
        validTargets: [2],
        handler: (entity) => {
            if (getEntityFamilies(entity).includes('rat')) {
                entity.runCommand('event entity @s become_calm')
                entity.runCommand('playsound spell.calming_rats @a ~ ~ ~')
                entity.runCommand('particle arx:spell_calming_rats ~ ~0.4 ~')
            }
        }
    },
    "kon inoffo ratatao elletera": {
        mpCost: 30,
        description: 'заклинание провокации всех спокойных крыс',
        validTargets: [2],
        handler: (entity) => {
            if (getEntityFamilies(entity).includes('rat')) {
                entity.runCommand('event entity @s become_agressive')
                entity.runCommand('playsound spell.calming_rats @a ~ ~ ~')
                entity.runCommand('particle arx:spell_calming_rats ~ ~0.4 ~')
            }
        }
    },
    "din inoffo ratatao transkursio elletera": {
        mpCost: 60,
        description: 'заклинание уничтожения небольших крыс',
        validTargets: [2],
        handler: (entity) => {
            if (getEntityFamilies(entity).includes('can_be_despawned_by_ratatao_spell')) {
                entity.dimension.spawnParticle('arx:spell_despawn_rats', { x: entity.location.x, y: entity.location.y + 0.3, z: entity.location.z })
                entity.dimension.spawnParticle('arx:beacon_fog', entity.location)
                entity.dimension.playSound('spell.despawn_rats', entity.location)
                entity.dimension.playSound('spell.power_sound', entity.location)
                entity.clearVelocity()
                entity.addEffect('levitation', 10, { amplifier: 1, showParticles: false })
                system.runTimeout(() => {
                    entity.remove()
                }, 10)
            }
        }
    },

    // Исцеление отавления
    'san yanamo floruum': {
        mpCost: 20,
        description: 'заклинание слабого излечения отравления',
        onlyOnPlayers: true,
        handler: (player) => {
            iDP(player, 'intoxication', -100)
        }
    },

    'san yanamo floruum mega': {
        mpCost: 60,
        description: 'заклинание хорошего излечения отравления',
        onlyOnPlayers: true,
        handler: (player) => {
            iDP(player, 'intoxication', -300)
        }
    },

    // Огнестойкость
    'san yanamo shumi flurri': {
        mpCost: 20,
        description: 'заклинание огнестойкости на 10 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 10) }
    },
    'san yanamo shumi flurri disortari': {
        mpCost: 60,
        description: 'заклинание огнестойкости по площади на 10 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 10) }
    },
    'san yanamo shumi flurri mega': {
        mpCost: 60,
        description: 'заклинание огнестойкости на 30 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 30) }
    },
    'san yanamo shumi flurri disortari mega': {
        mpCost: 180,
        description: 'заклинание огнестойкости по площади на 30 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 30) }
    },
    'san yanamo shumi flurri mega mega mega': {
        mpCost: 180,
        description: 'заклинание огнестойкости на 90 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 90) }
    },
    'san yanamo shumi flurri disortari mega mega mega': {
        mpCost: 540,
        description: 'заклинание огнестойкости по площади на 90 сек.',
        handler: (player, spellData) => { fireResistance(player, spellData, 90) }
    },


    'din affuono sartagana low': {
        mpCost: 60,
        description: 'заклинание невидимой головы на 60 секунд',
        onlyOnPlayers: true,
        handler: (player) => {
            setScore(player, 'spell_of_small_head', 60)
        }
    },

    'din sukimo sartagana': {
        mpCost: 10,
        description: 'заклинание магисвета на 5 минут',
        onlyOnPlayers: true,
        handler: (player, spellData) => { giveMagilight(player, spellData, 'arx:magilight', 300) }
    },
    'din sukimo sartagana sakiifori': {
        mpCost: 30,
        description: 'заклинание магисвета на 15 минут',
        onlyOnPlayers: true,
        handler: (player, spellData) => { giveMagilight(player, spellData, 'arx:magilight', 900) }
    },
    'din sukimo sartagana mega': {
        mpCost: 30,
        description: 'заклинание архисвета на 5 минут',
        onlyOnPlayers: true,
        handler: (player, spellData) => { giveMagilight(player, spellData, 'arx:archilight', 300) }
    },
    'din sukimo sartagana mega sakiifori': {
        mpCost: 90,
        description: 'заклинание архисвета на 15 минут',
        onlyOnPlayers: true,
        handler: (player, spellData) => { giveMagilight(player, spellData, 'arx:archilight', 900) }
    },

    // Изменение размера груди
    'din yanamo transkursio kotoka low': {
        mpCost: 150,
        description: 'заклинание исчезновения груди',
        onlyOnPlayers: true,
        handler: (player, spellData) => { changeBustSize(player, spellData, 0) }
    },
    'din yanamo transkursio kotoka mega': {
        mpCost: 150,
        description: 'заклинание сотворения небольшой груди',
        onlyOnPlayers: true,
        handler: (player, spellData) => { changeBustSize(player, spellData, 1) }
    },
    'din yanamo transkursio kotoka mega mega': {
        mpCost: 150,
        description: 'заклинание сотворения хорошей груди',
        onlyOnPlayers: true,
        handler: (player, spellData) => { changeBustSize(player, spellData, 2) }
    },
    'din yanamo transkursio kotoka mega mega mega': {
        mpCost: 150,
        description: 'заклинание сотворения огромной груди',
        onlyOnPlayers: true,
        handler: (player, spellData) => { changeBustSize(player, spellData, 3) }
    },

    // Рассеивания
    'din orduino': {
        mpCost: 20,
        description: 'заклинание рассеивания магии',
        onlyOnPlayers: true,
        handler: (player, spellData) => { dispelMagic(player, spellData) }
    },
    'din orduino disortari': {
        mpCost: 60,
        description: 'заклинание рассеивания магии по площади',
        onlyOnPlayers: true,
        handler: (player, spellData) => { dispelMagic(player, spellData) }
    },
    'din orduino kotoka': {
        mpCost: 20,
        description: 'заклинание рассеивания эффектов',
        handler: (entity, spellData) => { dispelEffects(entity, spellData) }
    },
    'din orduino disortari': {
        mpCost: 60,
        description: 'заклинание рассеивания эффектов по площади',
        handler: (entity, spellData) => { dispelEffects(entity, spellData) }
    },

    // Живые манекены
    'din affuono transkursio sartagana watashi flurri mega sakiifori disortari': {
        mpCost: 120,
        description: 'заклинание оживления манекенов',
        validTargets: [2],
        handler: (entity) => {
            if (entity.typeId === 'minecraft:armor_stand') {
                entity.runCommand('summon arx:resurrected_armor_stand ~ ~ ~ ~ ~')
                entity.remove()
            }
        }
    },

    // Заклы зрения
    'din inoffo sartagana': {
        mpCost: 20,
        description: 'заклинание ослепления',
        handler: (entity) => { entity.addEffect('blindness', 100, { showParticles: false }) }
    },
    'din inoffo sartagana sakiifori': {
        mpCost: 120,
        description: 'длительное заклинание ослепления',
        handler: (entity) => { entity.addEffect('blindness', 600, { showParticles: false }) }
    },
    'din inoffo sartagana disortari': {
        mpCost: 60,
        description: 'заклинание ослепления по площади',
        handler: (entity) => { entity.addEffect('blindness', 100, { showParticles: false }) }
    },
    'din inoffo sartagana sakiifori disortari': {
        mpCost: 360,
        description: 'длительное заклинание ослепления по площади',
        handler: (entity) => { entity.addEffect('blindness', 600, { showParticles: false }) }
    },
    // Тьмы
    'din inoffo sartagana kotoka': {
        mpCost: 10,
        description: 'заклинание тьмы',
        handler: (entity) => { entity.addEffect('darkness', 100, { showParticles: false }) }
    },
    'din inoffo sartagana sakiifori kotoka': {
        mpCost: 60,
        description: 'длительное заклинание тьмы',
        handler: (entity) => { entity.addEffect('darkness', 600, { showParticles: false }) }
    },
    'din inoffo sartagana disortari kotoka': {
        mpCost: 30,
        description: 'заклинание тьмы по площади',
        handler: (entity) => { entity.addEffect('darkness', 100, { showParticles: false }) }
    },
    'din inoffo sartagana sakiifori disortari kotoka': {
        mpCost: 180,
        description: 'длительное заклинание тьмы по площади',
        handler: (entity) => { entity.addEffect('darkness', 600, { showParticles: false }) }
    },

    // Заклинания намокания
    'din inoffo watashi': {
        mpCost: 10,
        description: 'заклинание брызг',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, 200) }
    },
    'din inoffo watashi mega': {
        mpCost: 30,
        description: 'заклинание мощных брызг',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, 600) }
    },
    'din inoffo watashi disortari': {
        mpCost: 30,
        description: 'заклинание брызг по площади',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, 200) }
    },
    'din inoffo watashi mega disortari': {
        mpCost: 90,
        description: 'заклинание мощных брызг по площади',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, 600) }
    },
    // Высыхания
    'din yanamo watashi': {
        mpCost: 15,
        description: 'заклинание моментального высыхания',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, -600) }
    },
    'din yanamo watashi disortari': {
        mpCost: 45,
        description: 'заклинание моментального высыхания по площади',
        onlyOnPlayers: true,
        handler: (player) => { waterOps(player, -600) }
    },

    // Молния
    'din sukimo subversa': {
        mpCost: 20,
        description: 'заклинание молнии',
        handler: (entity) => { entity.runCommand('summon lightning_bolt') }
    },

    // Водяная ткань
    'din sukimo watashi transkursio': {
        mpCost: 80,
        description: 'заклинание создания водяной ткани',
        validTargets: [1],
        handler: (entity) => { entity.runCommand('give @s arx:water_textile') }
    },

    // Ночное зрение
    'din yanamo sartagana': {
        mpCost: 20,
        description: 'заклинание ночного зрения на 30 сек',
        onlyOnPlayers: true,
        handler: (entity) => { entity.addEffect('night_vision', 600, { showParticles: false }) }
    },
    'din yanamo sartagana sakiifori': {
        mpCost: 120,
        description: 'заклинание ночного зрения на 3 минуты',
        onlyOnPlayers: true,
        handler: (entity) => { entity.addEffect('night_vision', 3600, { showParticles: false }) }
    },
    'din yanamo sartagana kotoka': {
        mpCost: 45,
        description: 'заклинание снятия туманов на 1 мин',
        onlyOnPlayers: true,
        handler: (entity) => { setScore(entity, 'no_fog', 60) }
    },

    // Невидимость
    'din yanamo shumi sartagana': {
        mpCost: 30,
        description: 'заклинание невидимости на 10 сек',
        onlyOnPlayers: true,
        handler: (entity) => { entity.addEffect('night_vision', 200, { showParticles: false }) }
    },
    'din yanamo shumi sartagana sakiifori': {
        mpCost: 30,
        description: 'заклинание невидимости на 60 сек',
        onlyOnPlayers: true,
        handler: (entity) => { entity.addEffect('night_vision', 1200, { showParticles: false }) }
    },

    "kon inoffo sempra": {
        mpCost: 5,
        description: 'заклинание небольшого урона',
        handler: (player) => { classicDamage(player, 2.5) }
    },
    "kon inoffo sempra mega": {
        mpCost: 15,
        description: 'заклинание хорошего урона',
        handler: (player) => { classicDamage(player, 7.5) }
    },
    "kon inoffo sempra mega mega mega": {
        mpCost: 45,
        description: 'заклинание мощного урона',
        handler: (player) => { classicDamage(player, 22.5) }
    },
};


// Проверка каждого заклинания
Object.keys(spellRegistry).forEach(spell => {
    // Проверяем корректность реестра заклинаний
    if (!spellRegistry[spell].mpCost) console.warn(`Некорректно указана требуемая мана для заклинания ${spell}`)
    if (!spellRegistry[spell].mpCost) console.warn(`Отсутствует описание для заклинания ${spell}`)
    const runeArray = spell.split(' ')
    const firstRune = runeArray[0]
    if (firstRune != 'kon' && firstRune != 'sin' && firstRune != 'san' && firstRune != 'din') console.warn(`Некорректная первая руна для заклинания ${key}`)
    runeArray.forEach((rune, index) => {
        if (!Object.keys(runeCiphers).includes(rune)) console.warn(`Неверная руна ${element} в заклинании ${spell}`)
    })
    // Добавляем шифровку рун каждому заклинанию в реестр заклинаний
    let cipher = ''
    runeArray.forEach((rune, index) => {
        const runeSipher = runeCiphers[rune]
        cipher = runeSipher + cipher
    })
    spellRegistry[spell]['cipher'] = cipher
})