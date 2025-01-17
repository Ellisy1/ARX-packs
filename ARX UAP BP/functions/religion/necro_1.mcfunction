tag @p add self

tag @p[tag=self, scores={religion=!13}] add is_not_pires_adept
tag @p[tag=self, scores={religion=!3}] add is_not_pallas_adept

#Действия в нормальной позиции
tellraw @p[tag=self, rxm=-89, lm=60, scores={religion=13, xp_stage=6..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
tellraw @p[tag=self, rxm=-89, lm=60, scores={religion=3, xp_stage=6..}] { "rawtext": [{ "text": "§2§lДоступно!" } ] } 

tellraw @p[tag=self, rxm=-89, tag=is_not_pires_adept, tag=is_not_pallas_adept] { "rawtext": [{ "text": "§4Не требуется на текущем этапе." } ] } 

tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Адепт Пиреса§f или §6Адепт Палласа§f -> §cНекромант" } ] }
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§6Требования: 60 уровень, 6 уровень АS&S." } ] }

tellraw @p[tag=self, rxm=-89, scores={religion=13}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Некроманта." } ] }
tellraw @p[tag=self, rxm=-89, scores={religion=3}] { "rawtext": [ { "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы повысить уровень религии до Некроманта." } ] }


#Действия при поднятой камере
execute @p[tag=self, rx=-89, tag=self, tag=is_not_pires_adept, tag=is_not_pallas_adept] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не требуется на текущем этапе!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=13}, l=59] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=3}, l=59] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=13, xp_stage=!6..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 6 ур.!" } ] } 
execute @p[tag=self, rx=-89, scores={religion=3, xp_stage=!6..}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта по АS&S, необходим 6 ур.!" } ] } 
#успех
execute @p[tag=self, rx=-89, scores={religion=13, xp_stage=6..}, lm=60] ~ ~ ~ tag @p add success
execute @p[tag=self, rx=-89, scores={religion=3, xp_stage=6..}, lm=60] ~ ~ ~ tag @p add success
execute @p[tag=self, tag=success] ~ ~ ~ playsound necro_win_choice @a ~ ~ ~ 20
execute @p[tag=self, tag=success] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2Вы отвергаете богов, обретая силу некроманта!" } ] }
execute @p[tag=self, tag=success] ~ ~ ~ title @p subtitle §cНекромант!
execute @p[tag=self, tag=success] ~ ~ ~ title @p title §eНовый уровень:
execute @p[tag=self, tag=success] ~ ~ ~ clear @p arx:necro_1 0 1
execute @p[tag=self, tag=success] ~ ~ ~ xp -60L @p
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players set @p religion 21
execute @p[tag=self, tag=success] ~ ~ ~ scoreboard players add @p xp_tray 20000

tag @p remove is_not_pires_adept
tag @p remove is_not_pallas_adept
tag @p remove success
tag @p remove self