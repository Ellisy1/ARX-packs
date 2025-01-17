tag @p add self
#Логика
execute @p[tag=self, rxm=20, scores={sk_b_12=1}] ~ ~ ~ scoreboard players set @p target 1
execute @p[tag=self, rx=20, rxm=-20, scores={sk_b_12=1}] ~ ~ ~ scoreboard players set @p target 2
execute @p[tag=self, rx=-20, scores={sk_b_12=1}] ~ ~ ~ scoreboard players set @p target 3

#Отчёты
execute @p[tag=self, scores={target=0, sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Цель сброшена" } ] } 
execute @p[tag=self, scores={target=1, sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §aна себя" } ] } 
execute @p[tag=self, scores={target=2, sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §cна ближайшего" } ] } 
execute @p[tag=self, scores={target=3, sk_b_12=1}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Установлена цель: §eна животных и монстров" } ] } 

execute @p[tag=self, scores={sk_b_12=0}] ~ ~ ~ tellraw @p { "rawtext": [{ "text": "Я не умею пользоваться радиальными волшебными палочками. Для этого мне надо изучить навык §eB12§f." } ] } 
execute @p[tag=self, scores={sk_b_12=0}] ~ ~ ~ playanimation @p animation.arx.no

#Анимации
scoreboard players set @p[tag=self, scores={sk_b_12=1}] move_delay 400
#Без особой религии
playanimation @p[tag=self, scores={custom_random=0..333, religion=!5, religion=!15, religion=!25, sk_b_12=1}] animation.arx.wand_a_a
playanimation @p[tag=self, scores={custom_random=334..666, religion=!5, religion=!15, religion=!25, sk_b_12=1}] animation.arx.wand_a_b
playanimation @p[tag=self, scores={custom_random=667..1000, religion=!5, religion=!15, religion=!25, sk_b_12=1}] animation.arx.wand_a_c
#С религией - вышкой
playanimation @p[tag=self, scores={religion=5, sk_b_12=1}] animation.arx.wand_b_a
playanimation @p[tag=self, scores={religion=15, sk_b_12=1}] animation.arx.wand_b_a
playanimation @p[tag=self, scores={religion=25, sk_b_12=1}] animation.arx.wand_b_a

tag @p remove self