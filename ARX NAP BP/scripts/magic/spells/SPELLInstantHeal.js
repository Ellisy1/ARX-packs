import { getPlayersInRadius } from "../../getPlayersInRadius"

const allowedPowers = [0, 1, 2, 3]

// Реген
export function instantHeal(player, targetData, is_area_spell = false) {

    switch (targetData.type) {
        case 'self':
            if (!is_area_spell) {
                player.runCommand('effect @s instant_health 1 255 true')
                player.runCommand('particle arx:instantHeal ~ ~1 ~')
                player.runCommand('particle arx:instantHeal_additional ~ ~1 ~')
                player.runCommand('playsound spell.healing @a ~ ~1 ~')
                player.runCommand('playsound spell.power_sound @a ~ ~1 ~')
                player.runCommand(`camera @s fade time 0 0.2 0.8 color 140 30 70`)
            } else {
                const players = getPlayersInRadius(player, 10)
                for (const singlePlayer of players) {
                    singlePlayer.runCommand('effect @s instant_health 1 255 true')
                    singlePlayer.runCommand('particle arx:instantHeal ~ ~1 ~')
                    singlePlayer.runCommand('particle arx:instantHeal_additional ~ ~0.1 ~')
                    singlePlayer.runCommand('playsound spell.healing @a ~ ~1 ~')
                    singlePlayer.runCommand('playsound spell.power_sound @a ~ ~1 ~')
                    singlePlayer.runCommand(`camera @s fade time 0 0.2 0.8 color 140 30 70`)
                }
            }
            break;
        case 'nearest':
            if (!is_area_spell) {
                targetData.player.runCommand('effect @s instant_health 1 255 true')
                targetData.player.runCommand('particle arx:instantHeal ~ ~1 ~')
                targetData.player.runCommand('particle arx:instantHeal_additional ~ ~0.1 ~')
                targetData.player.runCommand('playsound spell.healing @a ~ ~1 ~')
                targetData.player.runCommand('playsound spell.power_sound @a ~ ~1 ~')
                targetData.player.runCommand(`camera @s fade time 0 0.2 0.8 color 140 30 70`)
            } else {
                const players = getPlayersInRadius(player, 10)
                for (const singlePlayer of players) {
                    if (singlePlayer != player) {
                        singlePlayer.runCommand('effect @s instant_health 1 255 true')
                        singlePlayer.runCommand('particle arx:instantHeal ~ ~1 ~')
                        singlePlayer.runCommand('particle arx:instantHeal_additional ~ ~0.1 ~')
                        singlePlayer.runCommand('playsound spell.healing @a ~ ~1 ~')
                        singlePlayer.runCommand('playsound spell.power_sound @a ~ ~1 ~')
                        singlePlayer.runCommand(`camera @s fade time 0 0.2 0.8 color 140 30 70`)
                    }
                }
            }
            break;
        case 'entities':
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run particle arx:instantHeal ~ ~1 ~')
            player.runCommand('execute as @e[type=!player, family=!furniture, r=10] at @s run particle arx:instantHeal_additional ~ ~0.1 ~')
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] run effect @s instant_health 1 255 true`)
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] at @s run playsound spell.healing @a ~ ~1 ~`)
            player.runCommand(`execute as @e[type=!player, family=!furniture, r=10] at @s run playsound spell.power_sound @a ~ ~1 ~`)
            break
    }
}