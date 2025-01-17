tag @p add self

#для переименовки C2 B2 Эффективное использование сверхтяжёлых мечей c_2 b_2

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_c_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_2=0, sk_b_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык B2!" } ] } 
execute @p[tag=self, rx=-89, l=49, scores={sk_c_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 50 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=50, scores={sk_c_2=0, sk_b_2=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Эффективное использование сверхтяжёлых мечей!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_c_2 0 1
scoreboard players set @p[tag=self, tag=success] sk_c_2 1
xp -50L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 5000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_2=0, sk_b_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_2=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §cC2 - Эффективное использование сверхтяжёлых мечей." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 50 уровень, навык B2." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aСверхтяжёлое оружие - это невероятно большое, тяжёлое, и мощное оружие, наносящее колоссальные повреждения. Если не знать, как его правильно поднимать и держать, то вряд ли у вас получится сломать им что-то кроме своего позвоночника." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_c_2=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык C2." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self