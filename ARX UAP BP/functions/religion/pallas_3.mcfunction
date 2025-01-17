tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=50, scores={religion=2, xp_stage=4..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!2}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§bСлужитель Палласа§f -> §6Адепт Палласа" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 50 уровень, 4 уровень АS&S." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=2}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Адепта Палласа." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!2}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=2}, l=49] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 50 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=2, xp_stage=!4..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 4 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=2, xp_stage=4..}, lm=50] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound pallas_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Паллас принимает Вас в адепты!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §6Адепт Палласа!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:pallas_3 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -50L @p
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 3
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 8000

tag @p remove success
tag @p remove self