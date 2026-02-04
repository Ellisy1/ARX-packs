// Damage spells
export function classicDamage(victim, spellData, amountOfDamage) {
    const caster = spellData.initiator

    // Knockback
    const powerMult = amountOfDamage / 10
    const viewDirection = caster.getViewDirection()
    victim.applyKnockback({ x: viewDirection.x * 4 * powerMult, z: viewDirection.z * 4 * powerMult }, viewDirection.y * 0.5 * powerMult)

    // Deal damage
    victim.dimension.spawnParticle('arx:spell_classic_damage', victim.getHeadLocation())
    victim.dimension.playSound('spell.classic_damage', victim.getHeadLocation())
    victim.applyDamage(amountOfDamage, { cause: 'entityAttack', damagingEntity: undefined })
}