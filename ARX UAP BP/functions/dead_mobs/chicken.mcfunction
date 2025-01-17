tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_11=1}] chicken 1
give @p feather 2
give @p[tag=self, scores={sk_a_14=1}] feather 4
give @p[tag=self, scores={sk_a_16=1}] bone 1
give @p[tag=self, scores={sk_b_6=1}] arx:animal_heart 1
give @p[tag=self, scores={sk_b_9=1}] arx:animal_eye 2

tag @p[tag=self, hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @p[tag=self, scores={gender=1, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли кровью, если бы они у меня были." } ] }
    tellraw @p[tag=self, scores={gender=2, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли кровью, если бы они у меня были." } ] }

tag @p[tag=self, scores={sk_c_6=1}, hasitem={item=arx:bottle_for_blood}] add can_collect_blood
    give @p[tag=self, tag=can_collect_blood] arx:bottle_of_blood
    clear @p[tag=self, tag=can_collect_blood] arx:bottle_for_blood 0 1

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_chicken 0 1

tag @p remove has_bottle_for_blood
tag @p remove can_collect_blood
tag @p remove self