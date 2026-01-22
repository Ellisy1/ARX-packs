import { ssDP } from "../../DPOperations"
import { getScore, setScore } from '../../scoresOperations'

// Рассеивание заклинаний
export function dispelEffects(entity, targetData) {

    const dispelledAnything = entity.getEffects().length > 0

    // Партиклы и звуки
    if (dispelledAnything) {
        entity.dimension.playSound('spell.dispell_magic', entity.location)
        entity.dimension.spawnParticle('arx:dispell_effects', entity.getHeadLocation())
        entity.runCommand('effect @s clear')
    } else if (targetData.initiator?.name === entity?.name) {
        targetData.initiator.sendMessage('§6На мне нет эффектов, которые можно рассеять')
    }
}