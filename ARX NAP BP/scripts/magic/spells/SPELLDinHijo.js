import { findSpell } from '../findSpell';
import { spellsList } from '../spells_list';

export function dinHijo(player, channels) {
    for (let i = 1; i <= channels; i++) { // Итерируемся по каналам
        const spellIndex = findSpell(player, i, 'index'); // Работает верно
        const spellName = spellIndex !== undefined ? getValueByIndex(spellsList, spellIndex) : undefined;
        const message = spellName
            ? `У меня в §d${i}§f канале заготовлено §6${spellName}`
            : `У меня в §d${i}§f канале не заготовлено заклинаний`;
        player.runCommand(`tellraw @s { "rawtext": [ { "text": "${message}" } ] }`);
    }
    player.setDynamicProperty('hasEverCastedDinHijo', true);
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