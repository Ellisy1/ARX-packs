tag @p add self
#Логика
execute @p[tag=self, scores={target=3, sk_a_23=1}] ~ ~ ~ tag @p add target_1
execute @p[tag=self, scores={target=1, sk_a_23=1}] ~ ~ ~ tag @p add target_2
execute @p[tag=self, scores={target=2, sk_a_23=1}] ~ ~ ~ tag @p add target_3

scoreboard players set @p[tag=self, tag=target_1] target 1
scoreboard players set @p[tag=self, tag=target_2] target 2
scoreboard players set @p[tag=self, tag=target_3] target 3

#Отчёты
execute @p[tag=self, scores={target=1, sk_a_23=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §aна себя" } ] } 
execute @p[tag=self, scores={target=2, sk_a_23=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §cна ближайшего" } ] } 
execute @p[tag=self, scores={target=3, sk_a_23=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §eна животных и монстров" } ] } 

execute @p[tag=self, scores={sk_a_23=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Я не умею пользоваться обычными волшебными палочками. Для этого мне надо изучить навык §aA23§f." } ] } 
execute @p[tag=self, scores={sk_a_23=0}] ~ ~ ~ playanimation @p animation.arx.no

#Анимации
scoreboard players set @p[tag=self, scores={sk_a_23=1}] move_delay 400
#Без особой религии
playanimation @p[tag=self, scores={custom_random=0..333, religion=!5, religion=!15, religion=!25, sk_a_23=1}] animation.arx.wand_a_a
playanimation @p[tag=self, scores={custom_random=334..666, religion=!5, religion=!15, religion=!25, sk_a_23=1}] animation.arx.wand_a_b
playanimation @p[tag=self, scores={custom_random=667..1000, religion=!5, religion=!15, religion=!25, sk_a_23=1}] animation.arx.wand_a_c

#С религией - вышкой
playanimation @p[tag=self, scores={religion=5, sk_a_23=1}] animation.arx.wand_b_a
playanimation @p[tag=self, scores={religion=15, sk_a_23=1}] animation.arx.wand_b_a
playanimation @p[tag=self, scores={religion=25, sk_a_23=1}] animation.arx.wand_b_a

tag @p remove target_1
tag @p remove target_2
tag @p remove target_3
tag @p remove self