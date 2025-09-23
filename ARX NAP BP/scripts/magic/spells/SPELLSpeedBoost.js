import { ssDP } from "../../DPOperations"
import { getPlayersInRadius } from "../../getPlayersInRadius"

const allowedPowers = [0, 1, 2, 3]

// Буст скорости
export function speedBoost(player, targetData, time, power, is_area_spell = false) {
    if (!allowedPowers.includes(power)) { console.warn(`Была использована недопустимая мощность заклинания буста скорости ${power}`) }

    switch (targetData.type) {
        case 'self':
            if (!is_area_spell) {
                player.runCommand('particle arx:sofiso_a ~ ~2 ~')
                ssDP(player, `speedBoost:level${power}`, time)
            } else {
                const players = getPlayersInRadius(player, 10, true)
                for (const singlePlayer of players) {
                    singlePlayer.runCommand('particle arx:sofiso_a ~ ~2 ~')
                    ssDP(singlePlayer, `speedBoost:level${power}`, time)
                }
            }
            break;
        case 'nearest':
            if (!is_area_spell) {
                if (targetData.player) {
                    targetData.player.runCommand('particle arx:sofiso_a ~ ~2 ~')
                    ssDP(targetData.player, `speedBoost:level${power}`, time)
                }
            } else {
                const players = getPlayersInRadius(player, 10)
                for (const singlePlayer of players) {
                    if (singlePlayer != player) {
                        singlePlayer.runCommand('particle arx:sofiso_a ~ ~2 ~')
                        ssDP(singlePlayer, `speedBoost:level${power}`, time)
                    }
                }
            }
            break;
        case 'entities':
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run particle arx:sofiso_a ~ ~2 ~')
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] run effect @s speed 0 ${time}`)
            break;
    }
}