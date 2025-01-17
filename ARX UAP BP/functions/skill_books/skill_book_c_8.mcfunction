tag @p add self

#для переименовки C8 B11 Продвинутая алхимия c_8 b_11

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_c_8=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_8=0, sk_b_11=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык B11!" } ] } 
execute @p[tag=self, rx=-89, l=49, scores={sk_c_8=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 50 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=50, scores={sk_c_8=0, sk_b_11=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Продвинутая алхимия!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_c_8 0 1
scoreboard players set @p[tag=self, tag=success] sk_c_8 1
xp -50L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 5000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_8=0, sk_b_11=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_8=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §cC8 - Продвинутая алхимия." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 50 уровень, навык B11." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aАлхимия - это не только дешёвая наркота, ведь так? Стоило бы научиться варить что-то дейтвительно стоящее." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_c_8=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык C8." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self