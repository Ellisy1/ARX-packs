execute if entity @s[scores={crys_sw_respawn=0}] run tag @s add allow

# Если allow
execute if entity @s[tag=allow] run tellraw @s { "rawtext": [ { "text": "§aИспользован кристалл быстрого возрождения!" } ] }
execute if entity @s[tag=allow] run playsound crystal @a ~ ~ ~
execute if entity @s[tag=allow] run scoreboard players set @s crys_sw_respawn 1
execute if entity @s[tag=allow] run clear @s arx:crystal_of_swift_respawn 0 1

# Если нет allow
execute if entity @s[tag=!allow] run tellraw @s { "rawtext": [ { "text": "§cЭффект ранее использованного кристалла быстрого возрождения всё ещё активен" } ] }

tag @s remove allow