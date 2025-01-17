# Входные данные:
# tag is_solid_food - твёрдая еда, например сыр или мясо
# tag is_liquid_food - жидкость, например сок или чай
# tag is_soup - суп

playanimation @s[tag=is_solid_food] animation.player.eat.solid
playanimation @s[tag=is_liquid_food] animation.player.eat.liquid
playanimation @s[tag=is_soup] animation.player.eat.soup

execute as @s[tag=is_solid_food] at @s run playsound eat.solid @a ~ ~ ~
execute as @s[tag=is_liquid_food] at @s run playsound eat.liquid @a ~ ~ ~
execute as @s[tag=is_soup] at @s run playsound eat.soup @a ~ ~ ~

tag @s remove is_solid_food
tag @s remove is_liquid_food
tag @s remove is_soup