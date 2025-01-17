tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_11=1}] arx:wolf_meat 1
give @p[tag=self, scores={sk_a_14=1}] arx:wolf_skin 1
give @p[tag=self, scores={sk_a_16=1}] bone 1
give @p[tag=self, scores={sk_a_17=1}] arx:fang 1
give @p[tag=self, scores={sk_a_18=1}] arx:claws 1
give @p[tag=self, scores={sk_b_6=1}] arx:animal_heart 1
give @p[tag=self, scores={sk_b_9=1}] arx:animal_eye 2

tag @p[tag=self, hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @p[tag=self, scores={gender=1, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли кровью, если бы они у меня были." } ] }
    tellraw @p[tag=self, scores={gender=2, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли кровью, если бы они у меня были." } ] }

tag @p[tag=self, scores={sk_c_6=1}, hasitem={item=arx:bottle_for_blood}] add can_collect_blood
    give @p[tag=self, tag=can_collect_blood] arx:bottle_of_blood
    clear @p[tag=self, tag=can_collect_blood] arx:bottle_for_blood 0 1

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_a_11=0, sk_a_14=0, sk_a_16=0, sk_a_17=0, sk_a_18=0, sk_b_6=0, sk_b_9=0, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_a_11=0, sk_a_14=0, sk_a_16=0, sk_a_17=0, sk_a_18=0, sk_b_6=0, sk_b_9=0, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_wolf 0 1

tag @p remove has_bottle_for_blood
tag @p remove can_collect_blood
tag @p remove self