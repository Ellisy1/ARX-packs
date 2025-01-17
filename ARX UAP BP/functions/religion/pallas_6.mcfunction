tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=60, scores={religion=3, xp_stage=6..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!3}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Адепт Палласа§f -> §cВоин Палласа" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 60 уровень, 6 уровень АS&S." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=3}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Воина Палласа." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!3}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=3}, l=59] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=3, xp_stage=!6..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 6 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=3, xp_stage=6..}, lm=60] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound pallas_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Паллас наделяет Вас силой воина!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §cВоин Палласа!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:pallas_6 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -60L @p
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 6
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 20000

tag @p remove success
tag @p remove self