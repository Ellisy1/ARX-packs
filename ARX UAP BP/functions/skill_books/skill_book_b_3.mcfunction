tag @p add self

#для переименовки B3 B1, A7 Ковка стальных пластин b_3 b_1

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_b_3=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_b_3=0, sk_b_1=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык B1!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_b_3=0, sk_a_7=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A7!" } ] } 
execute @p[tag=self, rx=-89, l=39, scores={sk_b_3=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 40 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=40, scores={sk_b_3=0, sk_b_1=1, sk_a_7=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Ковка стальных пластин!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_b_3 0 1
scoreboard players set @p[tag=self, tag=success] sk_b_3 1
xp -40L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 1500

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=40, scores={sk_b_3=0, sk_b_1=1, sk_a_7=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=40, scores={sk_b_3=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §eB3 - Ковка стальных пластин." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 40 уровень, навык B1, A7." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aПродвинутые навыки ковки качественных защитных пластин. Вы научитесь делать мощные стальные и дюрасплавные компоненты для брони." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_b_3=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык B3." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self