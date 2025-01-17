tag @p add self

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_a_9=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_a_9=0, sk_a_4=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A4!" } ] } 
execute @p[tag=self, rx=-89, l=29, scores={sk_a_9=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 30 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=30, scores={sk_a_9=0, sk_a_4=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Эффективное использование кинжалов!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_a_9 0 1
scoreboard players set @p[tag=self, tag=success] sk_a_9 1
xp -30L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 300

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_9=0, sk_a_4=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_9=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §aA9 - Эффективное использование кинжалов." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 30 уровень, навык A4." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aКинжал - универсальное оружие, когда сил в тебе хватает только на то, чтобы посмотреть на нормальный двуручник, но в ближнем бою драться иногда приходится." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_a_9=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык A9." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self