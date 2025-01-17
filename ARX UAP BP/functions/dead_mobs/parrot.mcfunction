tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_11=1}] arx:parrot_fowl 2
give @p feather 1
give @p[tag=self, scores={sk_a_14=1}] feather 5

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_parrot 0 1

tag @p remove self