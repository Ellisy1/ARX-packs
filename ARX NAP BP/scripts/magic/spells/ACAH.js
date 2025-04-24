import { spellsCiphers, spellsList } from '../spells_list'
import { findSpell } from '../findSpell'

// Функция реализует заклинание ACAH
export function castACAH(player) {
    console.warn("Закл запроса заклов")
    for (let i = 1; i <= 6; i++) {
        const spellIndex = findSpell(player, i, true)
        if (spellIndex) {
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "У меня в §d${i}§f канале заготовлено §6${getValueByIndex(spellsList, spellIndex)}" } ] }`)
        }
        else {
            player.runCommand(`tellraw @s { "rawtext": [ { "text": "У меня в §d${i}§f канале не заготовлено заклинаний" } ] }`)
        }
    }
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