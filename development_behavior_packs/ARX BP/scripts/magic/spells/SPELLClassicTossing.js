// Подбрасывание
export function classicTossing(player, power) {
    if (player.hasTag('disable_magic_of_modified_moving')) {
        player.sendMessage('§cЧто-то блокирует ваше заклинание')
        return
    } else {
        player.addEffect('levitation', 20, { amplifier: power, showParticles: false })
    }
}