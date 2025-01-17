tag @p add self

#для переименовки A22 A21 Способность регенерировать ману a_22 a_21

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_a_22=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_a_22=0, sk_a_21=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A21!" } ] } 
execute @p[tag=self, rx=-89, l=29, scores={sk_a_22=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 30 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=30, scores={sk_a_22=0, sk_a_21=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Способность регенерировать ману!" } ] } 
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aИспользуйте предмет <О игроке> для того, чтобы посмотреть данные о скорости регенерации маны." } ] } 
clear @p[tag=self, tag=success] arx:skill_book_a_22 0 1
scoreboard players set @p[tag=self, tag=success] sk_a_22 1
xp -30L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 300

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_22=0, sk_a_21=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=30, scores={sk_a_22=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §aA22 - Способность регенерировать ману." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 30 уровень, навык A21." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aРегенерировать - это хорошо. Регенерировать ману - особенно хорошо. Это открывает широкий геймплей за мага, в том числе многочасовой гринд подбора комбинаций заклинаний. Гордитесь." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_a_22=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык A22." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self