scoreboard players random @s t_spicy -100 100
scoreboard players random @s t_salty -100 100
scoreboard players random @s t_sweet -100 100
scoreboard players random @s t_sour -100 100
scoreboard players random @s t_exotic -100 100
scoreboard players random @s t_herbal -100 100
scoreboard players random @s t_meat -100 100
scoreboard players random @s t_fish -100 100
scoreboard players random @s t_bread -100 100
scoreboard players random @s t_lactic -100 100

scoreboard players set @s taste_summary 0

scoreboard players operation @s taste_summary += @s t_spicy
scoreboard players operation @s taste_summary += @s t_salty
scoreboard players operation @s taste_summary += @s t_sweet
scoreboard players operation @s taste_summary += @s t_sour
scoreboard players operation @s taste_summary += @s t_exotic
scoreboard players operation @s taste_summary += @s t_herbal
scoreboard players operation @s taste_summary += @s t_meat
scoreboard players operation @s taste_summary += @s t_fish
scoreboard players operation @s taste_summary += @s t_bread
scoreboard players operation @s taste_summary += @s t_lactic

execute as @s[scores={taste_summary=!-50..50}] run function food/set_tastes