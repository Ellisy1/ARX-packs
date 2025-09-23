import { ssDP } from '../../DPOperations';
import { findSpell } from '../findSpell';
import { spellsList } from '../spells_list';
import { checkForItem } from '../../checkForItem';

export function dinHijo(player, channels, targetData) {

    let messageStart = targetData.type === 'self' ? 'У меня в' : 'У цели в'
    let playerToCheck = targetData.type === 'self' ? player : targetData.player

    if (!targetData.player && targetData.type === 'nearest') return

    if (targetData.type === 'nearest') {
        if (checkForItem(targetData.player, 'Legs', 'arx:amul_of_concealment')) { // Амулет блокирования Din Hijo
            player.sendMessage(`§e${targetData.player.getDynamicProperty('name')} блокирует моё заклинание запроса!`)
            targetData.player.sendMessage(`§e${player.getDynamicProperty('name')} пытался узнать мои заготовленые заклинания!`)

            targetData.player.runCommand('particle arx:din_hijo_block ~ ~1.5 ~')
            targetData.player.runCommand('playsound din_hijo_block @a ~ ~ ~')

            return undefined
        }
    }

    for (let i = 1; i <= channels; i++) { // Итерируемся по каналам
        const spellIndex = findSpell(playerToCheck, i, 'index');
        const spellName = spellIndex !== undefined ? getValueByIndex(spellsList, spellIndex) : undefined;
        const message = spellName
            ? `${messageStart} §d${i}§f канале заготовлено §6${spellName}`
            : `${messageStart} §d${i}§f канале не заготовлено заклинаний`
        player.sendMessage(message)

    }
    ssDP(player, 'hasEverCastedDinHijo', true)
}

function getValueByIndex(obj, index) {
    const keys = Object.keys(obj); // Получаем массив ключей
    if (index >= 0 && index < keys.length) {
        const key = keys[index];    // Получаем ключ по индексу
        return obj[key];        // Получаем значение по ключу
    } else {
        return undefined; // Или выбросить ошибку, если индекс недопустим
    }
}