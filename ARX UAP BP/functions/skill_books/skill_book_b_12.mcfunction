tag @p add self

#для переименовки B12 A23 Применение радиальных волшебных палочек b_12 a_23

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_b_12=0, sk_a_23=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A23!" } ] } 
execute @p[tag=self, rx=-89, l=39, scores={sk_b_12=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 40 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=40, scores={sk_b_12=0, sk_a_23=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Применение радиальных волшебных палочек!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_b_12 0 1
scoreboard players set @p[tag=self, tag=success] sk_b_12 1
xp -40L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 1500

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=40, scores={sk_b_12=0, sk_a_23=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=40, scores={sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §eB12 - Применение радиальных волшебных палочек." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 40 уровень, навык A23." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aОбычная волшебная палочка - это хорошо, но когда дуболом с огромным тесаком несётся на тебя со всех ног, может не хватить времени домотать до нужной цели. Радиальная палочка моментально устанавливает цель зависимо от направления взгляда." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_b_12=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык B12." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self