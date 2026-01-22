import { checkForItem } from "../../checkForItem";
import { ssDP } from "../../DPOperations"

// Защита
export function giveMagilight(player, spellData, item, time) {
    // Проверяем, есть ли нужный светильник в инвентаре
    const hasCurrentItem = checkForItem(player, 'any', item)
    // Проверяем, есть ли запущеный кд на этот светильник
    let hasActiveCD = false
    if (item === 'arx:magilight' && player.getDynamicProperty('allowMagilight') > 0) hasActiveCD = true
    else if (item === 'arx:archilight' && player.getDynamicProperty('allowArchilight') > 0) hasActiveCD = true

    // Выдаем айтем, если его не было
    if (!hasCurrentItem) player.runCommand(`give @s ${item}`)


    let message = ''
    if (item === 'arx:magilight') {
        message = hasActiveCD ? '§aДействие магисвета продлено' : '§aВы получаете магисвет!'
        ssDP(player, 'allowMagilight', time)
    }
    else if (item === 'arx:archilight') {
        message = hasActiveCD ? '§aДействие архисвета продлено' : '§aВы получаете архисвет!'
        ssDP(player, 'allowArchilight', time)
    }
    else {
        console.warn('Вызывано заклинание магисвета с недопустимым типом светильника')
    }

    player.sendMessage(message)
}