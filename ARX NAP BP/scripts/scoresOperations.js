// Imports - Minecraft
import { world } from "@minecraft/server"

// Функция получения score 
export function getScore(player, scoreId) {
    const scoreboardIdentity = player.scoreboardIdentity
    const objective = world.scoreboard.getObjective(scoreId)
    return objective.getScore(scoreboardIdentity)
}

// Функция выставления score 
export function setScore(player, scoreId, numToSet) {
    const scoreboardIdentity = player.scoreboardIdentity
    const objective = world.scoreboard.getObjective(scoreId)
    return objective.setScore(scoreboardIdentity, numToSet)
}