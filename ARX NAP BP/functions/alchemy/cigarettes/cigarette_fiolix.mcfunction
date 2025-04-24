# Сигарета из фиоликса
execute at @s facing ^ ^ ^0.5 positioned ^ ^ ^0.5 run particle arx:cigarette_smoke ~ ~1.6 ~

function cigarette
playanimation @s animation.player.smoke
scoreboard players add @s xp_tray 20
scoreboard players add @s[scores={drugs_delay=8000..}] stress 1500
w @s[scores={drugs_delay=8000..}] Слишком много наркотиков. Отвратительные ощущения
scoreboard players add @s[scores={drugs_delay=1..}] stress -500
scoreboard players add @s[scores={drugs_delay=1..600}] stress -500
scoreboard players add @s[scores={drugs_delay=0}] stress -3500
scoreboard players add @s[scores={drugs_delay=0}] xp_tray 400
scoreboard players add @s drugs_delay 1100
clear @s arx:cigarette_fiolix 0 1