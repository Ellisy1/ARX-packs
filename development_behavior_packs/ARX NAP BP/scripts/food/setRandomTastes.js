import { ssDP } from "../DPOperations"

// Устанавливаем случаные вкусы
export function setRandomTastes(player) {
    let tastesArray
    let sum = undefined
    
    while (sum === undefined || sum > 100) {
        tastesArray = []
        for (let i = 0; i < 6; i++) {
            tastesArray.push(getRandomInt(-100, 100))
        }
        sum = tastesArray.reduce((accumulator, currentValue) => accumulator + currentValue, 0)
    }

    ssDP(player, "playerTaste_meat", tastesArray[0])
    ssDP(player, "playerTaste_fish", tastesArray[1])
    ssDP(player, "playerTaste_bread", tastesArray[2])
    ssDP(player, "playerTaste_dairy", tastesArray[3])
    ssDP(player, "playerTaste_herbal", tastesArray[4])
    ssDP(player, "playerTaste_sweet", tastesArray[5])
}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}