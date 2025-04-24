tag @s[tag=drop_cost_with_staff, tag=!drop_cost_with_amulet] add drop_25
tag @s[tag=!drop_cost_with_staff, tag=drop_cost_with_amulet] add drop_25

tag @s[tag=drop_cost_with_staff, tag=drop_cost_with_amulet] add drop_50


execute as @s[tag=drop_25] run scoreboard players operation @s mp_req *= @a[scores={verify=2}] const_75
execute as @s[tag=drop_25] run scoreboard players operation @s mp_req /= @a[scores={verify=2}] const_100

execute as @s[tag=drop_50] run scoreboard players operation @s mp_req *= @a[scores={verify=2}] const_50
execute as @s[tag=drop_50] run scoreboard players operation @s mp_req /= @a[scores={verify=2}] const_100