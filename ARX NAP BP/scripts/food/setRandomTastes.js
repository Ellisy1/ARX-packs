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

    player.setDynamicProperty("playerTaste_meat", tastesArray[0])
    player.setDynamicProperty("playerTaste_fish", tastesArray[1])
    player.setDynamicProperty("playerTaste_bread", tastesArray[2])
    player.setDynamicProperty("playerTaste_dairy", tastesArray[3])
    player.setDynamicProperty("playerTaste_herbal", tastesArray[4])
    player.setDynamicProperty("playerTaste_sweet", tastesArray[5])
}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}