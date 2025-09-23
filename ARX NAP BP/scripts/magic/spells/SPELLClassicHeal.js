import { ssDP } from "../../DPOperations"
import { getPlayersInRadius } from "../../getPlayersInRadius"

const allowedPowers = [0, 1, 2, 3]

// Реген
export function classicHeal(player, targetData, time, power, is_area_spell = false) {
    if (!allowedPowers.includes(power)) { console.warn(`Была использована недопустимая мощность заклинания лечения ${power}`) }

    ssDP(player, 'hasEverCastedSanYanamoHoro', true)

    switch (targetData.type) {
        case 'self':
            if (!is_area_spell) {
                executeSpell(player, time, power)
            }
            else {
                const players = getPlayersInRadius(player, 10, true)
                for (const singlePlayer of players) {
                    executeSpell(singlePlayer, time, power)
                }
            }
            break;
        case 'nearest':
            if (!is_area_spell) {
                if (targetData.player) {
                    executeSpell(targetData.player, time, power)
                }
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
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run particle arx:classicHeal ~ ~1 ~')
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] run effect @s regeneration ${time} ${power}`)
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] at @s run playsound spell.healing @a ~ ~1 ~`)
            break;
    }
}

function executeSpell(entity, time, power) {
    entity.runCommand('particle arx:classicHeal ~ ~1 ~')
    entity.runCommand('playsound spell.healing @a ~ ~1 ~')
    entity.runCommand(`effect @s regeneration ${time} ${power}`)
}