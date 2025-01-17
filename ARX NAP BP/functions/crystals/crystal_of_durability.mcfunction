execute if entity @s[scores={crys_dur=0}] run tag @s add allow

# Если allow
execute if entity @s[tag=allow] run tellraw @s { "rawtext": [ { "text": "§aИспользован кристалл стойкости!" } ] }
execute if entity @s[tag=allow] run playsound crystal @a ~ ~ ~
execute if entity @s[tag=allow] run scoreboard players set @s crys_dur 1
execute if entity @s[tag=allow] run clear @s arx:crystal_of_durability 0 1

# Если нет allow
execute if entity @s[tag=!allow] run tellraw @s { "rawtext": [ { "text": "§cЭффект ранее использованного кристалла стойкости всё ещё активен" } ] }

tag @s remove allow