// Защита
export function fireResistance(entity, targetData, timeSec) {

    entity.addEffect('fire_resistance', timeSec * 20)
    entity.dimension.spawnParticle('arx:spell_fire_resistance', entity.location)
    entity.dimension.playSound('spell.fire_resistance', entity.location)
}