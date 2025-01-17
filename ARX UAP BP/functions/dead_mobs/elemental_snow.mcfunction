tag @p add self

#Дроп
give @p snow 1

tag @p[tag=self, hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @p[tag=self, scores={gender=1, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли снежной эссенцией, если бы они у меня были." } ] }
    tellraw @p[tag=self, scores={gender=2, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли снежной эссенцией, если бы они у меня были." } ] }

tag @p[tag=self, scores={sk_c_6=1}, hasitem={item=arx:bottle_for_blood}] add can_collect_blood
    give @p[tag=self, tag=can_collect_blood] arx:snow_essence
    clear @p[tag=self, tag=can_collect_blood] arx:bottle_for_blood 0 1


#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_elemental_snow 0 1

tag @p remove has_bottle_for_blood
tag @p remove can_collect_blood
tag @p remove self