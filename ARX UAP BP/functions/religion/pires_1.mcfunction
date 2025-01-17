tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=30, scores={religion=0, karma_pires=0}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!0}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§7Отсутствие религии§f -> §aУченик Пиреса" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 30 уровень." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=0}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Ученика Пиреса." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=0}, l=29] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 30 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=0, karma_pires=!0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Пирес зол на меня. Стоит подождать, пока закончится его карма." } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=0, karma_pires=0}, lm=30] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound pires_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Пирес принимает Вас в свои ученики!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §aУченик Пиреса!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:pires_1 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -30L @p
execute @p[tag=self, tag=success] ~ ~ ~ give @p arx:drawing_relig_pi_u
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 11
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 1000

tag @p remove success
tag @p remove self