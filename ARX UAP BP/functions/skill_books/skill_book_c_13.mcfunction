tag @p add self

#для переименовки C13 C12 Сверхконцентрация души c_13 c_12

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_c_13=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_13=0, sk_c_12=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C12!" } ] } 
execute @p[tag=self, rx=-89, l=49, scores={sk_c_13=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 50 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=50, scores={sk_c_13=0, sk_c_12=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Сверхконцентрация души!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_c_13 0 1
scoreboard players set @p[tag=self, tag=success] sk_c_13 1
xp -50L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 5000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_13=0, sk_c_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_13=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §cC13 - Сверхконцентрация души." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 50 уровень, навык C12." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aНавсегда уменьшает скорость регенерации очка маны на 2 сек. Как говорил мой дед, количество убитых крыс прямопропорционально скорости генерации маны." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_c_13=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык C13." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self