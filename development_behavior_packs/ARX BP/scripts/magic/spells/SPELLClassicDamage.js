import { system } from "@minecraft/server"

// Damage spells
export function classicDamage(victim, spellData, amountOfDamage) {
    const caster = spellData.initiator

    // Knockback
    const powerMult = amountOfDamage / 10
    const viewDirection = caster.getViewDirection()
    try {
        victim.applyKnockback({ x: viewDirection.x * 4 * powerMult, z: viewDirection.z * 4 * powerMult }, viewDirection.y * 0.5 * powerMult)
    }
    catch {} // We cannot apply knockback on this entity (e.g. item)

    // Deal damage
    victim.dimension.spawnParticle('arx:spell_classic_damage', victim.getHeadLocation())
    victim.dimension.playSound('spell.classic_damage', victim.getHeadLocation())
    victim.applyDamage(amountOfDamage, { cause: 'entityAttack', damagingEntity: caster })

    // Add temp tag
    caster.addTag('used_magic_damage_just_now')

    // Remove temporary tag through some time
    system.runTimeout(() => {
        caster.removeTag('used_magic_damage_just_now')
    }, 1)
}