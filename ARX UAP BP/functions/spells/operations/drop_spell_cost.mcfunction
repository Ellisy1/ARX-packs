tag @s[tag=drop_cost_with_staff, tag=!drop_cost_with_religion] add drop_25
tag @s[tag=!drop_cost_with_staff, tag=drop_cost_with_religion] add drop_25

tag @s[tag=drop_cost_with_staff, tag=drop_cost_with_religion] add drop_50


execute @s[tag=drop_25] ~ ~ ~ scoreboard players operation @s mp_req *= @p[scores={verify=2}] const_75
execute @s[tag=drop_25] ~ ~ ~ scoreboard players operation @s mp_req /= @p[scores={verify=2}] const_100

execute @s[tag=drop_50] ~ ~ ~ scoreboard players operation @s mp_req *= @p[scores={verify=2}] const_50
execute @s[tag=drop_50] ~ ~ ~ scoreboard players operation @s mp_req /= @p[scores={verify=2}] const_100