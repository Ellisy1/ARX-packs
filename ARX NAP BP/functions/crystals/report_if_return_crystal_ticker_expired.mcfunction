tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§6[СИСТЕМА] §cИстек срок действия для тикера кристала возврата с UID " }, { "score": {"name": "@s", "objective": "UID" } } ] }

# tag @s remove logic_controller

execute as @a if score @s UID = @e[type=arx:return_crystal_ticker] UID run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "Игрок: " }, { "selector": "@s" } ] }

# execute as @s if score EllisyDL UID = @s UID run say ----

# tellraw @a { "rawtext": [ { "score": {"name": "@s", "objective": "UID" } } ] }
# tellraw @a { "rawtext": [ { "score": {"name": "EllisyDL", "objective": "UID" } } ] }

# tag @s add logic_controller