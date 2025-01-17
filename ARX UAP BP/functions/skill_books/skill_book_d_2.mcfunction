tag @p add self

#для переименовки D2 C9 Перманентные зелья d_2 c_9

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_d_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_d_2=0, sk_c_9=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C9!" } ] } 
execute @p[tag=self, rx=-89, l=59, scores={sk_d_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=60, scores={sk_d_2=0, sk_c_9=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Перманентные зелья!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_d_2 0 1
scoreboard players set @p[tag=self, tag=success] sk_d_2 1
xp -60L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 20000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_2=0, sk_c_9=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §dD2 - Перманентные зелья." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 60 уровень, навык C9." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aРазве не мечта любого алхимика - создать такое зелье, которое сделало его бы сильнее в чём-либо навсегда? Этот навык позволит создавать такие зелья. Вот бы ещё выучить рецепт..." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_d_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык D2." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self