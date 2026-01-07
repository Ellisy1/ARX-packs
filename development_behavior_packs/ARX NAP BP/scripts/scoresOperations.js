// Imports - Minecraft
import { world } from "@minecraft/server"

// Функция получения score 
export function getScore(player, scoreId) {

    if (!player) {
        console.warn(`Вызвана функция getScore() для score <${scoreId}> без необходимого объекта player`)
        return
    }
    if (!scoreId) {
        console.warn(`Вызвана функция getScore() для игрока <${player.name}> без необходимого объекта scoreId`)
        return
    }

    const scoreboardIdentity = player.scoreboardIdentity
    const objective = world.scoreboard.getObjective(scoreId)
    if (!objective) registerScore(scoreId)
    return objective.getScore(scoreboardIdentity)
}

// Функция выставления score 
export function setScore(player, scoreId, numToSet) {

    if (!player) {
        console.warn(`Вызвана функция setScore() для score <${scoreId}>, numToSet <${numToSet}> без необходимого объекта player`)
        return
    }
    if (!scoreId) {
        console.warn(`Вызвана функция setScore() для игрока <${player.name}>, numToSet <${numToSet}> без необходимого объекта scoreId`)
        return
    }
    if (!scoreId) {
        console.warn(`Вызвана функция setScore() для score <${scoreId}>, игрока <${player.name}> без необходимого объекта numToSet`)
        return
    }
    
    const scoreboardIdentity = player.scoreboardIdentity
    const objective = world.scoreboard.getObjective(scoreId)
    if (!objective) registerScore(scoreId)
    return objective.setScore(scoreboardIdentity, numToSet)
}

// Функция регистрации score
function registerScore(scoreId) {
    console.warn(`Запрос на взаимодействие с незарегистрированной score ${scoreId}. Автоматическая регистрация...`)
    world.scoreboard.addObjective(scoreId, scoreId)
}