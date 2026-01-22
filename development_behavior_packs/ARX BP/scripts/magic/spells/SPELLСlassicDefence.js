// Защита
export function classicDefence(entity, spellData, time, power) {
    entity.runCommand('particle arx:shumi_a ~ ~1 ~')
    entity.runCommand('playsound spell.resistance @a ~ ~ ~')
    entity.runCommand(`effect @s resistance ${time} ${power}`)
}