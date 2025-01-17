tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=70, scores={religion=8, xp_stage=8..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!8}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§cСтрелок Палласа§f -> §dАссасин Палласа" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 70 уровень, 8 уровень АS&S." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=8}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Ассасина Палласа." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!8}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=8}, l=69] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 70 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=8, xp_stage=!8..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 8 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=8, xp_stage=8..}, lm=70] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound pallas_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Паллас наделяет Вас великой силой ассасина!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §dАссасин Палласа!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:pallas_9 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -70L @p
execute @p[tag=self, tag=success] ~ ~ ~ give @p arx:drawing_relig_pa_a
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 9
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 45000

tag @p remove success
tag @p remove self