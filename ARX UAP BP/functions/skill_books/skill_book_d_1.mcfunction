tag @p add self

#для переименовки D1 C2, C11, C13 Использование аркссако-предметов d_1 c_2

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_d_1=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_d_1=0, sk_c_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C2!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_d_1=0, sk_c_11=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C11!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_d_1=0, sk_c_13=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C13!" } ] } 
execute @p[tag=self, rx=-89, l=59, scores={sk_d_1=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=60, scores={sk_d_1=0, sk_c_2=1, sk_c_11=1, sk_c_13=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Использование аркссако-предметов!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_d_1 0 1
scoreboard players set @p[tag=self, tag=success] sk_d_1 1
xp -60L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 20000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_1=0, sk_c_2=1, sk_c_11=1, sk_c_13=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_1=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §dD1 - Использование аркссако-предметов." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 60 уровень, навык C2, C11, C13." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aНавык использовать аркссако-предметы. Такие предметы уникальны и обладают невероятной силой и способностями." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_d_1=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык D1." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self