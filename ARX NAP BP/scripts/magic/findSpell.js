import { spellsCiphers } from './spells_list';

// Эта функция находит заклинание. На вход получает игрока и канал, и на выходе выдает строку заклинание, если оно там есть, или undefined, если нет.
export function findSpell(player, activeChannel, returnSpellIndex = false) {
    const runeSequence = player.getDynamicProperty(`channel_${activeChannel}_rune_sequence`);
    let spellsCounter = 0

    for (const singleSpellCipher of spellsCiphers) {
        if (runeSequence.startsWith(singleSpellCipher)) { // Обнаружено совпадение набранных рун с каким-то заклом
            if (returnSpellIndex) {return spellsCounter}
            else {return singleSpellCipher}
        }
        spellsCounter += 1
    }

    return undefined; // Если ничего не найдено
}