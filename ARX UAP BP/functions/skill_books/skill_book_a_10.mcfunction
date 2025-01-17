tag @p add self

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_a_10=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_a_10=0, sk_a_9=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A9!" } ] } 
execute @p[tag=self, rx=-89, l=29, scores={sk_a_10=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 30 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=30, scores={sk_a_10=0, sk_a_9=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Эффективное использование древковых!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_a_10 0 1
scoreboard players set @p[tag=self, tag=success] sk_a_10 1
xp -30L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 300

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_10=0, sk_a_9=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_10=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §aA10 - Эффективное использование древковых." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 30 уровень, навык A9." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aКопьё - незаменимое оружие, когда опыта на навыки маловато, но больно бить всех вокруг уже хочется." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_a_10=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык A10." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self