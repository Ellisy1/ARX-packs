import { setScore, getScore } from '../../scoresOperations';
import { TPWithNoxenessionPortal } from '../../portals';
import { getNearestPlayer } from '../../getNearestPlayer';
import { dinHijo } from './SPELLDinHijo'
import { magicDash } from './SPELLMagicDash'
import { speedBoost } from './SPELLSpeedBoost'
import { classicHeal } from './SPELLClassicHeal'
import { instantHeal } from './SPELLInstantHeal'
import { classicDefence } from './SPELLСlassicDefence'
import { chain } from './SPELLChain'
import { ssDP } from '../../DPOperations';

/**
 * Реестр заклинаний
 * Каждое заклинание указывает:
 * - mpCost: стоимость маны
 * - validTargets: массив поддерживаемых целей ['self', 'nearest', 'entities']
 * - handler: функция, принимающая player, targetData (с информацией о цели)
 */
const spellRegistry = {
    'din hijo': {
        mpCost: 5,
        validTargets: ['self'],
        handler: (player) => { dinHijo(player, 4) }
    },

    'din hijo mega': {
        mpCost: 10,
        validTargets: ['self'],
        handler: (player) => { dinHijo(player, 7) }
    },

    'din hijo mega mega mega': {
        mpCost: 20,
        validTargets: ['self'],
        handler: (player) => { dinHijo(player, 10) }
    },

    'din yanamo trafantana': {
        mpCost: 15,
        validTargets: ['self', 'nearest'], // Только на себя и на ближайшего
        handler: (player, targetData) => {
            if (targetData.type === 'self') {
                TPWithNoxenessionPortal(player, player, 'spell');
            } else if (targetData.type === 'nearest' && targetData.player) {
                TPWithNoxenessionPortal(targetData.player, player, 'spell');
            }
        }
    },

    "sin yanamo trafantana": {
        mpCost: 8,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 7) }
    },
    "sin yanamo trafantana mega": {
        mpCost: 15,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 14) }
    },
    "sin yanamo trafantana mega mega mega": {
        mpCost: 35,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 30) }
    },

    "sin yanamo trafantana sartagana": {
        mpCost: 16,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 7, true) }
    },
    "sin yanamo trafantana sartagana mega": {
        mpCost: 30,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 14, true) }
    },
    "sin yanamo trafantana sartagana mega mega mega": {
        mpCost: 70,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 30, true) }
    },

    // Ускорение
    "sin yanamo sofiso": {
        mpCost: 10,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 0) }
    },
    "sin yanamo sofiso disortari": {
        mpCost: 30,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 0, true) }
    },
    "sin yanamo sofiso sakiifori": {
        mpCost: 60,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 180, 0) }
    },
    "sin yanamo sofiso mega": {
        mpCost: 20,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 1) }
    },
    "sin yanamo sofiso mega disortari": {
        mpCost: 60,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 1), true }
    },
    "sin yanamo sofiso mega sakiifori": {
        mpCost: 120,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 1) }
    },
    "sin yanamo sofiso mega mega": {
        mpCost: 60,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 2) }
    },
    "sin yanamo sofiso mega mega mega": {
        mpCost: 120,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { speedBoost(player, targetData, 30, 3) }
    },

    // Хил
    "san yanamo horo": {
        mpCost: 5,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 0) }
    },
    "san yanamo horo sakiifori": {
        mpCost: 25,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 0) }
    },
    "san yanamo horo disortari": {
        mpCost: 15,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 0, true) }
    },
    "san yanamo horo sakiifori disortari": {
        mpCost: 75,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 0, true) }
    },

    "san yanamo horo mega": {
        mpCost: 15,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 1) }
    },
    "san yanamo horo mega sakiifori": {
        mpCost: 75,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 1) }
    },
    "san yanamo horo mega disortari": {
        mpCost: 45,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 1, true) }
    },
    "san yanamo horo mega sakiifori disortari": {
        mpCost: 225,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 1, true) }
    },

    "san yanamo horo mega mega mega": {
        mpCost: 45,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 2) }
    },
    "san yanamo horo mega mega mega sakiifori": {
        mpCost: 225,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 2) }
    },
    "san yanamo horo mega mega mega disortari": {
        mpCost: 135,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 10, 2, true) }
    },
    "san yanamo horo mega mega mega sakiifori disortari": {
        mpCost: 675,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicHeal(player, targetData, 60, 2, true) }
    },

    // Мгновенный реген
    "san yanamo horo sofiso": {
        mpCost: 60,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { instantHeal(player, targetData) }
    },
    "san yanamo horo sofiso disortari": {
        mpCost: 180,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { instantHeal(player, targetData, true) }
    },

    // Маяк
    "din yanamo trafantana kotoka": {
        mpCost: 40,
        validTargets: ['self'],
        handler: (player) => {
            player.sendMessage('§dМаяк установлен')
            player.runCommand('summon arx:magic_beacon ~ ~ ~')
            ssDP(player, 'magicBeacon', 10)
            player.runCommand(`tag @e[type=arx:magic_beacon, r=0.1] add ${player.name}`)
        }
    },
    "din yanamo trafantana sakiifori kotoka": {
        mpCost: 60,
        validTargets: ['self'],
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
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 0) }
    },
    "san yanamo shumi sakiifori": {
        mpCost: 75,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 0) }
    },
    "san yanamo shumi disortari": {
        mpCost: 45,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 0, true) }
    },
    "san yanamo shumi sakiifori disortari": {
        mpCost: 225,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 0, true) }
    },

    "san yanamo shumi mega": {
        mpCost: 45,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 1) }
    },
    "san yanamo shumi mega sakiifori": {
        mpCost: 225,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 1) }
    },
    "san yanamo shumi mega disortari": {
        mpCost: 135,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 1, true) }
    },
    "san yanamo shumi mega sakiifori disortari": {
        mpCost: 675,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 1, true) }
    },

    "san yanamo shumi mega mega mega": {
        mpCost: 135,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 2) }
    },
    "san yanamo shumi mega mega mega sakiifori": {
        mpCost: 675,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 2) }
    },
    "san yanamo shumi mega mega mega disortari": {
        mpCost: 405,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 10, 2, true) }
    },
    "san yanamo shumi mega mega mega sakiifori disortari": {
        mpCost: 2025,
        validTargets: ['self', 'nearest', 'entities'],
        handler: (player, targetData) => { classicDefence(player, targetData, 60, 2, true) }
    },

    // Цепи
    "sin sukimo": {
        mpCost: 10,
        validTargets: ['self'],
        handler: (player) => { chain(player) }
    },

    // Стрельба с лука
    "sin yanamo arrako": {
        mpCost: 15,
        validTargets: ['self', 'nearest'],
        handler: (player, targetData) => {
            let playerToBoost

            if (targetData.type === 'self') playerToBoost = player
            else if (targetData.type === 'nearest') playerToBoost = targetData.player

            ssDP(playerToBoost, 'shootingBoostBySpell_plus2', 60)
        }
    },
    "sin yanamo arrako mega": {
        mpCost: 45,
        validTargets: ['self', 'nearest'],
        handler: (player, targetData) => {
            let playerToBoost
            
            if (targetData.type === 'self') playerToBoost = player
            else if (targetData.type === 'nearest') playerToBoost = targetData.player

            ssDP(playerToBoost, 'shootingBoostBySpell_plus4', 60)
        }
    },
    "sin inoffo arrako": {
        mpCost: 15,
        validTargets: ['self', 'nearest'],
        handler: (player, targetData) => {
            let playerToBoost

            if (targetData.type === 'self') playerToBoost = player
            else if (targetData.type === 'nearest') playerToBoost = targetData.player

            ssDP(playerToBoost, 'shootingBoostBySpell_minus2', 60)
        }
    },
    "sin inoffo arrako mega": {
        mpCost: 45,
        validTargets: ['self', 'nearest'],
        handler: (player, targetData) => {
            let playerToBoost
            
            if (targetData.type === 'self') playerToBoost = player
            else if (targetData.type === 'nearest') playerToBoost = targetData.player

            ssDP(playerToBoost, 'shootingBoostBySpell_minus4', 60)
        }
    },
};

/**
 * Определяет тип цели по magicTarget
 * @param {number} magicTarget
 * @param {Player|null} nearestPlayer
 * @returns {{ type: 'self'|'nearest'|'entities', player?: Player } | null}
 */
function resolveTargetType(magicTarget, nearestPlayer) {
    if (magicTarget === 1) return { type: 'self' };
    if (magicTarget === 2) return { type: 'nearest', player: nearestPlayer };
    return { type: 'entities' }; // всё остальное — массовое (животные/монстры)
}

/**
 * Основная функция вызова заклинания
 * @param {Player} player
 * @param {string} runeSequence
 */
export function castJSSpell(player, runeSequence) {
    const spell = spellRegistry[runeSequence];
    if (!spell) return;

    const magicTarget = player.getDynamicProperty('magicTarget');
    const nearestPlayer = getNearestPlayer(player, 10);
    const targetData = resolveTargetType(magicTarget, nearestPlayer);

    // Проверка: поддерживает ли заклинание выбранную цель?
    if (!spell.validTargets.includes(targetData.type)) {
        player.addTag('cant_be_casted_cus_of_target');
        return;
    }

    // Проверка маны
    setScore(player, 'mp_req', spell.mpCost);
    if (getScore(player, 'mp_req') > player.getDynamicProperty('mp')) {
        return;
    }

    // Успешное применение
    player.addTag('spell_available');

    // Вызов обработчика с нужными данными
    spell.handler(player, targetData);
}