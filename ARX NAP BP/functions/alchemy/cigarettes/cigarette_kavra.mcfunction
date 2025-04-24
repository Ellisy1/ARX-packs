# Сигарета из кавры
execute at @s facing ^ ^ ^0.5 positioned ^ ^ ^0.5 run particle arx:cigarette_smoke ~ ~1.6 ~

playanimation @s animation.player.smoke
scoreboard players add @s xp_tray 10
effect @s regeneration 8 0 true
clear @s arx:cigarette_kavra 0 1
scoreboard players add @s poisoning 100