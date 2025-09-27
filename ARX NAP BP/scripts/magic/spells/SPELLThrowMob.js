// Бросам моба
export function throwMob(player, mobId, powerMult = 1, event = undefined) {
    const mob = player.dimension.spawnEntity(mobId, { x: player.location.x, y: player.location.y + 1.12, z: player.location.z })

    mob.setRotation({ x: 0, y: player.getRotation().y })
    
    if (event) mob.triggerEvent(event)

    mob.addEffect('invisibility', 2, { showParticles: false })

    const viewDirection = player.getViewDirection()
    mob.applyKnockback({ x: viewDirection.x * 4 * powerMult, z: viewDirection.z * 4 * powerMult }, viewDirection.y * 0.5 * powerMult)
}