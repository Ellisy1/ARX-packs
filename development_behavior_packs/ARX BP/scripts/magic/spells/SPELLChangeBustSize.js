import { ssDP } from "../../DPOperations"
import { getScore } from '../../scoresOperations'

// Изменение размера груди
export function changeBustSize(player, targetData, size) {
    if (getScore(player, 'mark')) {
        executeSpell(player, size)
    } else {
        player.sendMessage('§6Кажется, это заклинание не сработает без метки')
    }
}

function executeSpell(player, size) {
    const currrentBustSize = player.getProperty('arx:bust_size')
    // Нет изменения размера
    if (size === currrentBustSize) return
    // Определяем сообщение
    const message = size > currrentBustSize ? '§vВаша грудь увеличевается!' : '§vВаша грудь уменьшается!'
    player.sendMessage(message)
    player.setProperty('arx:bust_size', size)
}