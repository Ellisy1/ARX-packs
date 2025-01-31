execute as @s[scores={class=1}] run w @s §aОткат @s в до-смертельное состояние запущен...
execute as @s[scores={class=0}] run w @s §cОткат @s в до-смертельное состояние недоступен!

execute as @s[scores={class=1}] run scoreboard players operation @s xp = @s xp_roll_back
execute as @s[scores={class=1}] run scoreboard players operation @s xp_stage = @s xp_stage_roll_back

execute as @s[scores={class=1}] run w @s §aОткат @s в до-смертельное состояние §lвыполнен

execute as @s[scores={class=1}] run scoreboard players set @s class 0