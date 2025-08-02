import { setScore, getScore } from '../../scoresOperations';
import { TPWithNoxenessionPortal } from '../../portals';
import { getNearestPlayer } from '../../getNearestPlayer';
import { dinHijo } from './SPELLDinHijo'
import { magicDash } from './SPELLMagicDash'
import { speedBoost } from './SPELLSpeedBoost'

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

    'san yanamo horo': {
        mpCost: 5,
        validTargets: ['self', 'nearest', 'entities'], // Поддерживает все цели
        handler: (player, targetData) => {
            switch (targetData.type) {
                case 'self':
                    player.runCommand('effect @s regeneration 10 0');
                    break;
                case 'nearest':
                    player.runCommand('effect @p[tag=self2] regeneration 10 0');
                    break;
                case 'entities':
                    player.runCommand('effect @e[r=15, type=!player, type=!item] regeneration 10 0');
                    break;
            }
            player.setDynamicProperty('hasEverCastedSanYanamoHoro', true);
        }
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

    "sin yanamo sartagana trafantana": {
        mpCost: 16,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 7, true) }
    },
    "sin yanamo sartagana trafantana mega": {
        mpCost: 30,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 14, true) }
    },
    "sin yanamo sartagana trafantana mega mega mega": {
        mpCost: 70,
        validTargets: ['self'],
        handler: (player) => { magicDash(player, 30, true) }
    },

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