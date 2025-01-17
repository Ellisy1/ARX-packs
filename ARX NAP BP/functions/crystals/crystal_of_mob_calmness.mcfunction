execute if entity @s[scores={crys_mob_calm=0}] run tag @s add allow

# Если allow
execute if entity @s[tag=allow] run tellraw @s { "rawtext": [ { "text": "§aИспользован кристалл умиротворения!" } ] }
execute if entity @s[tag=allow] run playsound crystal @a ~ ~ ~
execute if entity @s[tag=allow] run scoreboard players set @s crys_mob_calm 1
execute if entity @s[tag=allow] run clear @s arx:crystal_of_mob_calmness 0 1

# Если нет allow
execute if entity @s[tag=!allow] run tellraw @s { "rawtext": [ { "text": "§cЭффект ранее использованного кристалла умиротворения всё ещё активен" } ] }

tag @s remove allow