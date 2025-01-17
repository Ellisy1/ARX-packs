tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_16=1}] arx:fang 1
give @p[tag=self, scores={sk_a_17=1}] arx:claws 1
give @p[tag=self, scores={sk_b_9=1}] spider_eye 8

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_a_16=0, sk_a_17=0, sk_b_9=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_a_16=0, sk_a_17=0, sk_b_9=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_cave_spider 0 1

tag @p remove self