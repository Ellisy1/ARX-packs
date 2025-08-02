import { setScore } from '../../scoresOperations'

// Магический рывок
export function magicDash(player, ticks, ghostDash = false) {
    if (player.getDynamicProperty('weighLoading') <= 7) { // Допуск по весу
        player.runCommand('particle arx:magic_dash ~ ~1.3 ~ ')
        setScore(player, 'tp_cd', ticks)
        if (ghostDash) {
            setScore(player, 'tp_cd_ghost', ticks)
        }
    } else { // Недопуск по весу
        player.addTag('block_mp_withdraw')
        player.sendMessage('§cЭто заклинание невозможно использовать, если ваша загруженность превышает 7 единиц.')
    }
}