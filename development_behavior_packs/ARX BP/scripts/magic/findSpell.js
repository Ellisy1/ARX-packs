import { spellRegistry } from './spells/spellRegistry';

// Эта функция находит заклинание. На вход получает игрока и канал, и на выходе выдает заклинание в нужном виде, если оно там есть, или undefined, если нет.
export function findSpell(player, activeChannel, returnType = 'cipher') {

    // Проверка корректности аргумента returnType
    if (!['cipher', 'sequence'].includes(returnType)) {
        console.warn(`Использован недопустимый аргумент returnType в функции findSpell: ${returnType}`)
        return undefined
    }

    // Записаная в переменной канала магии игрока последовательность из шифровки рун, рнапример ADAHBC
    const runeSequence = player.getDynamicProperty(`channel_${activeChannel}_rune_sequence`)

    if (!runeSequence) return

    for (const spell of Object.keys(spellRegistry)) {
        if (runeSequence.startsWith(spellRegistry[spell].cipher)) {
            if (returnType === 'sequence') { return spell } // Возвращаем строку заклинания
            if (returnType === 'cipher') { return spellRegistry[spell].cipher } // Возвращаем шифр заклинания
        }
    }

    return undefined; // Если ничего не найдено
}