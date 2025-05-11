scoreboard players random @s trait_random 0 10
scoreboard players add @s[scores={trait_random=0}] c_indifference 1
scoreboard players add @s[scores={trait_random=1}] c_angry 1
scoreboard players add @s[scores={trait_random=2}] c_loner 1
scoreboard players add @s[scores={trait_random=3}] c_rude 1
scoreboard players add @s[scores={trait_random=4}] c_warmy 1
scoreboard players add @s[scores={trait_random=5}] c_coldy 1
scoreboard players add @s[scores={trait_random=6}] c_manipulator 1
scoreboard players add @s[scores={trait_random=7}] c_charismatic 1
scoreboard players add @s[scores={trait_random=8}] c_communicative 1
scoreboard players add @s[scores={trait_random=9}] c_unstable 1
scoreboard players add @s[scores={trait_random=10}] c_miner 1
title @s title 
title @s subtitle  Нейтральная черта 
tellraw @s { "rawtext": [ { "text": " Получена нейтральная черта характера" } ] }