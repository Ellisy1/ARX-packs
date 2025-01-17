tag @p add self

#Дроп
give @p[tag=self, scores={sk_a_16=1}] bone 16
give @p[tag=self, scores={sk_b_6=1}] arx:swamp_monster_heart 1
give @p arx:straw_hat 1

#Дропаем ОП
scoreboard players add @p xp_tray 20

#Удаляем предмет
clear @p arx:dead_swamp_monster 0 1

tag @p remove self