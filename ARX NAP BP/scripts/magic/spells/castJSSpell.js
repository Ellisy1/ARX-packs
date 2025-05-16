import { spellsCiphers, spellsList } from '../spells_list'
import { findSpell } from '../findSpell'
import { setScore, getScore } from '../../scoresOperations'

export function castJSSpell(player, runeSequence) {

    const magicTarget = player.getDynamicProperty('magicTarget')

    switch (runeSequence) {
        case 'din hijo':

            setScore(player, "mp_req", 5)

            if (magicTarget == 1) {
                if (getScore(player, "mp_req") <= player.getDynamicProperty('mp')) {
                    player.addTag("spell_available")

                    for (let i = 1; i <= 6; i++) {
                        const spellIndex = findSpell(player, i, 'index')
                        if (spellIndex) {
                            player.runCommand(`tellraw @s { "rawtext": [ { "text": "У меня в §d${i}§f канале заготовлено §6${getValueByIndex(spellsList, spellIndex)}" } ] }`)
                        }
                        else {
                            player.runCommand(`tellraw @s { "rawtext": [ { "text": "У меня в §d${i}§f канале не заготовлено заклинаний" } ] }`)
                        }
                    }

                    // Переменная для гида
                    player.setDynamicProperty('hasEverCastedDinHijo', true)
                }
            } else {
                player.addTag('cant_be_casted_cus_of_target')
            }

            break

        case 'san yanamo horo':

            setScore(player, "mp_req", 5)

            if (getScore(player, "mp_req") <= player.getDynamicProperty('mp')) {
                player.addTag("spell_available")
                if (magicTarget === 1) {
                    player.runCommand('effect @s regeneration 10 0')
                } else if (magicTarget === 2) {
                    player.runCommand('effect @p[tag=self2] regeneration 10 0')
                } else {
                    player.runCommand('effect @e[r=15, type=!player, type=!item] regeneration 10 0')
                }
                // Переменная для гида
                player.setDynamicProperty('hasEverCastedSanYanamoHoro', true)
            }

            break
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