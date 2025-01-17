tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=40, scores={religion=11, xp_stage=2..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!11}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§aУченик Пиреса§f -> §bСлужитель Пиреса" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 40 уровень, 2 уровень АS&S." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=11}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Служителя Пиреса." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!11}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=11}, l=39] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 40 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=11, xp_stage=!2..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 2 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=11, xp_stage=2..}, lm=40] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound pires_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Пирес принимает Вас в служители!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §bСлужитель Пиреса!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:pires_2 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -40L @p
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 12
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 3500

tag @p remove success
tag @p remove self