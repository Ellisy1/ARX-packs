tag @p add self

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_a_1=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, l=29, scores={sk_a_1=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 30 ур.!" } ] } 
execute @p[tag=self, rx=-89, l=29, scores={class=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Невозможно изучить, вы призрак!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=30, scores={sk_a_1=0, class=0}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: A1 - базовые воинские навыки!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_a_1 0 1
scoreboard players set @p[tag=self, tag=success] sk_a_1 1
xp -30L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
effect @p[tag=self, tag=success] clear
scoreboard players add @p[tag=self, tag=success] xp_tray 300

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_1=0, class=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, scores={sk_a_1=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык:§f §aA1 - Базовые воинские навыки." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 30 уровень, не быть призраком." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aГотовка, магия, алхимия - это конечно хорошо, но в такой опасной вселенной, как Аркс, наверняка стоит научиться держать дубину. Покупка навыка повысит переносимый вес на 1." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_a_1=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык A1." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self