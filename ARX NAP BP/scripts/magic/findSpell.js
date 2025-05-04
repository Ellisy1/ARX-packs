import { spellsCiphers } from './spells_list';
import { spellsList } from './spells_list';

// Эта функция находит заклинание. На вход получает игрока и канал, и на выходе выдает строку заклинание, если оно там есть, или undefined, если нет.
export function findSpell(player, activeChannel, returnType = 'cipher') {

    // Проверка корректности аргумента returnType
    if (!['cipher', 'index', 'sequence'].includes(returnType)) {
        console.warn(`Использован недопустимый аргумент returnType в функции findSpell: ${returnType}`)
        return undefined
    }

    const runeSequence = player.getDynamicProperty(`channel_${activeChannel}_rune_sequence`) // Записаная в переменной канала магии игрока последовательность из шифровки рун

    let spellIndex = 0 // Индекс текущего заклинания

    for (const singleSpellCipher of spellsCiphers) { // Перебираем каждый закл из существующих
        if (runeSequence.startsWith(singleSpellCipher)) { // Обнаружено совпадение набранных рун с каким-то заклом
            if (returnType === 'index') {return spellIndex} // Возвращаем индекс заклинания
            if (returnType === 'sequence') {return Object.keys(spellsList)[spellIndex]} // Возвращаем строку заклинания
            if (returnType === 'cipher') {return singleSpellCipher} // Возвращаем шифр заклинания
        }
        spellIndex += 1
    }

    return undefined; // Если ничего не найдено
}