tag @p add self

#нормальная камера
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§fЯ могу заставить себя забыть о своей религии, использовав этот предмет. Наверное, это разозлит богов... \n§8§oЧтобы сбросить религию, используйте этот предмет, смотря вертикально вверх." } ] }

#поднятая камера
execute @s[scores={religion=!0}, rx=-89] ~ ~ ~ playsound undemon @a ~ ~ ~ 
title @p[tag=self, scores={religion=!0}, rx=-89] title §gРелигия успешно сброшена
tellraw @p[tag=self, scores={religion=0}, rx=-89] { "rawtext": [ { "text": "§4Чтобы сбросить религию, её сначала надо обрести." } ] }
tellraw @p[tag=self, scores={religion=1..9}, rx=-89] { "rawtext": [ { "text": "§gВера в Палласа покидает меня." } ] }
tellraw @p[tag=self, scores={religion=11..19}, rx=-89] { "rawtext": [ { "text": "§gВера в Пиреса покидает меня." } ] }
tellraw @p[tag=self, scores={religion=21..29}, rx=-89] { "rawtext": [ { "text": "§gМой путь некроманта на этом заканчивается." } ] }
scoreboard players set @p[tag=self, scores={religion=1..9}, rx=-89] karma_pallas 4320
scoreboard players set @p[tag=self, scores={religion=1..9}, rx=-89] karma_pires 1440
scoreboard players set @p[tag=self, scores={religion=11..19}, rx=-89] karma_pallas 1440
scoreboard players set @p[tag=self, scores={religion=11..19}, rx=-89] karma_pires 4320
scoreboard players set @p[tag=self, scores={religion=21..29}, rx=-89] karma_pallas 4320
scoreboard players set @p[tag=self, scores={religion=21..29}, rx=-89] karma_pires 4320
scoreboard players add @p[tag=self, scores={religion=!0}, rx=-89] xp_tray 1000
clear @p[tag=self, scores={religion=!0}, rx=-89] arx:wipe_religion_ingame 0 1
scoreboard players set @p[tag=self, rx=-89] religion 0

tag @p remove self