# Сигарета из фиоликса
execute at @s facing ^ ^ ^0.5 positioned ^ ^ ^0.5 run particle arx:cigarette_smoke ~ ~1.6 ~

playanimation @s animation.player.smoke
effect @s regeneration 8 0 true
clear @s arx:cigarette_fiolix 0 1