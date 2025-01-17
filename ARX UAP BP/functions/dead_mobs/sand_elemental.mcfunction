tag @p add self

#Дроп
give @p[tag=self, scores={sk_b_6=1}] arx:sand_elemental_heart 1

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_b_6=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_b_6=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Удаляем предмет
clear @p arx:dead_sand_elemental 0 1

tag @p remove self