tag @p add self

#для переименовки C10 A23, A24, A25 Концентрация маны c_10 a_23

#Действия при поднятой камере
#Неуспех
execute @p[tag=self, rx=-89, scores={sk_c_10=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Нельзя повторно изучить один и тот же навык!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_10=0, sk_a_23=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A23!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_10=0, sk_a_24=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A24!" } ] } 
execute @p[tag=self, rx=-89, scores={sk_c_10=0, sk_a_25=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Не изучен необходимый навык A25!" } ] } 
execute @p[tag=self, rx=-89, l=49, scores={sk_c_10=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§4Недостаточно опыта, необходим 50 ур.!" } ] } 
#Успех
execute @p[tag=self, rx=-89, lm=50, scores={sk_c_10=0, sk_a_23=1, sk_a_24=1, sk_a_25=1}] ~ ~ ~ tag @p add success
tellraw @p[tag=self, tag=success] { "rawtext": [{ "text": "§aВы успешно изучили: Концентрация маны!" } ] } 
clear @p[tag=self, tag=success] arx:skill_book_c_10 0 1
scoreboard players set @p[tag=self, tag=success] sk_c_10 1
xp -50L @p[tag=self, tag=success]
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_positional @a[tag=!self] ~ ~ ~
execute @p[tag=self, tag=success] ~ ~ ~ playsound skill_upgrade_stream @a[tag=self] ~ ~ ~
scoreboard players add @p[tag=self, tag=success] xp_tray 5000

#Действия в нормальной позиции
#Если доступно
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_10=0, sk_a_23=1, sk_a_24=1, sk_a_25=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§2§lДоступно!" } ] } 
execute @p[tag=self, rxm=-89, lm=50, scores={sk_c_10=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§a§lИзучено!" } ] } 
#Инфа в любом случае
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Навык: §cC10 - Концентрация маны." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§6Требования: 50 уровень, навык A23, A24, A25." } ] } 
execute @p[tag=self, rxm=-89] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§aНавсегда увеличивает лимит маны на 5. Давай, продолжай делать вид что эти 5 маны действительно стоят 50 уровней опыта." } ] } 
execute @p[tag=self, rxm=-89, scores={sk_c_10=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "§8§oПоднимите камеру вертикально вверх и используйте этот предмет ещё раз, чтобы купить навык C10." } ] } 

tellraw @p { "rawtext":[{"text": "" }]}

tag @p remove success
tag @p remove self