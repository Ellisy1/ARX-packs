// Дамаг
export function classicDamage(entity, amountOfDamage) {
    entity.dimension.spawnParticle('arx:spell_classic_damage', entity.getHeadLocation())
    entity.dimension.playSound('spell.classic_damage', entity.getHeadLocation())
    entity.applyDamage(amountOfDamage, { cause: 'entityAttack', damagingEntity: undefined })
}