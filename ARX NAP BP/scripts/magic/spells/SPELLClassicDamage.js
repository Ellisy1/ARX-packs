import { getPlayersInRadius } from "../../getPlayersInRadius"

// Защита
export function classicDamage(player, amountOfDamage, isAreaEffect = false, isLongEffect = false, ignoreArmor = false) {
    const ump = player.dimension.spawnEntity('arx:ump', { x: player.location.x, y: player.location.y + 1.12, z: player.location.z })
    const viewDirection = player.getViewDirection()
    ump.applyImpulse({ x: viewDirection.x * 1, y:viewDirection.y * 1, z: viewDirection.z * 1 })
}

function executeSpell(entity, time, power) {
    entity.runCommand('particle arx:shumi_a ~ ~1 ~')
    entity.runCommand('playsound spell.resistance @a ~ ~ ~')
    entity.runCommand(`effect @s resistance ${time} ${power}`)
}