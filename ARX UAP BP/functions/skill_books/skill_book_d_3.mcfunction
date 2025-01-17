tag @p add self

#для переименовки D3 C2 Сверхвыносливость d_3 c_2

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_d_3=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_d_3=0, sk_c_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык C2!" } ] } 
execute @p[tag=self, rx=-89, l=59, scores={sk_d_3=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 60 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=60, scores={sk_d_3=0, sk_c_2=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Сверхвыносливость!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_d_3 0 1
scoreboard players set @p[tag=self, tag=success] sk_d_3 1
xp -60L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 20000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_3=0, sk_c_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=60, scores={sk_d_3=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §dD3 - Сверхвыносливость." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 60 уровень, навык C2." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aВы наверняка не раз сталкивались с тем, что после удара руку тяжелит, да? Этот навык позволяет сократить время вашего отхождения. (стандартное 1 сек на уровень ослабления, новое 0.8 сек на уровень ослабления)" } ] } 
execute @p[tag=self, rxm=-89, scores={sk_d_3=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык D3." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self