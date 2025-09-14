import { getPlayersInRadius } from "../../getPlayersInRadius"

// Защита
export function classicDefence(player, targetData, time, power, is_area_spell = false) {
    switch (targetData.type) {
        case 'self':
            if (!is_area_spell) {
                executeSpell(player, time, power)
            }
            else {
                const players = getPlayersInRadius(player, 10)
                for (const singlePlayer of players) {
                    executeSpell(singlePlayer, time, power)
                }
            }
            break;
        case 'nearest':
            if (!is_area_spell) {
                executeSpell(targetData.player, time, power)
            }
            else {
                const players = getPlayersInRadius(player, 10)
                for (const singlePlayer of players) {
                    if (singlePlayer != player) {
                        executeSpell(singlePlayer, time, power)
                    }
                }
            }
            break;
        case 'entities':
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run particle arx:shumi_a ~ ~1 ~')
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run playsound spell.resistance @a ~ ~ ~')
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] run effect @s resistance ${time} ${power}`)
            break;
    }
}

function executeSpell(entity, time, power) {
    entity.runCommand('particle arx:shumi_a ~ ~1 ~')
    entity.runCommand('playsound spell.resistance @a ~ ~ ~')
    entity.runCommand(`effect @s resistance ${time} ${power}`)
}