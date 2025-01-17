tag @p add self

#Дроп
give @p[tag=self, scores={sk_c_6=1}] glow_ink_sac 1

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_glow_squid 0 1

tag @p remove self