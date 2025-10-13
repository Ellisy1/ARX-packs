// Реген
export function instantHeal(entity, targetData) {

    entity.runCommand('effect @s instant_health 1 255 true')
    entity.runCommand('particle arx:instantHeal ~ ~1 ~')
    entity.runCommand('particle arx:instantHeal_additional ~ ~1 ~')
    entity.runCommand('playsound spell.healing @a ~ ~1 ~')
    entity.runCommand('playsound spell.power_sound @a ~ ~1 ~')
    entity.runCommand(`camera @s fade time 0 0.2 0.8 color 140 30 70`)
}