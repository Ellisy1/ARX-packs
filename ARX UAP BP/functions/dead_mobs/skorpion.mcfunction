tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_16=1}] arx:skorpion_shell 1

tag @p[tag=self, hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @p[tag=self, scores={gender=1, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли ядом скорпиона, если бы они у меня были." } ] }
    tellraw @p[tag=self, scores={gender=2, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли ядом скорпиона, если бы они у меня были." } ] }

tag @p[tag=self, scores={sk_c_6=1}, hasitem={item=arx:bottle_for_blood}] add can_collect_blood
    give @p[tag=self, tag=can_collect_blood] arx:skorpion_poison
    clear @p[tag=self, tag=can_collect_blood] arx:bottle_for_blood 0 1

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_a_16=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_a_16=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_skorpion 0 1

tag @p remove has_bottle_for_blood
tag @p remove can_collect_blood
tag @p remove self