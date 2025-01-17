tag @p add self

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=70, scores={religion=21, xp_stage=8..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, scores={religion=!21}] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§cНекромант§f -> §dАрхинекромант" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 70 уровень, 8 уровень АS&S." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=21}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Архинекроманта." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, scores={religion=!21}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=21}, l=69] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 70 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=21, xp_stage=!8..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 8 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=21, xp_stage=8..}, lm=70] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound necro_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Вы обретаете великую силу архинекроманта!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §dАрхинекромант!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:necro_2 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -70L @p
execute @p[tag=self, tag=success] ~ ~ ~ give @p arx:drawing_relig_ne_m
execute @p[tag=self, tag=success] ~ ~ ~ give @p arx:gold_feather
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 22
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 45000

tag @p remove success
tag @p remove self