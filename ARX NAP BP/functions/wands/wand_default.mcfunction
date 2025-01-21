# Теговый анализ требуется, чтобы не изменять значения score target в процессе его проверки

# target_1 - означает, что надо выставить score target на значение 1

# Какая сейчас была цель?
    tag @s[scores={target=3, sk_a_23=1}] add target_1
    tag @s[scores={target=1, sk_a_23=1}] add target_2
    tag @s[scores={target=2, sk_a_23=1}] add target_3

# Выставляем цель
    scoreboard players set @s[tag=target_1] target 1
    scoreboard players set @s[tag=target_2] target 2
    scoreboard players set @s[tag=target_3] target 3

#Отчёты
    tellraw @s[scores={target=1, sk_a_23=1}] { "rawtext": [{ "text": "Установлена цель: §aна себя" } ] } 
    tellraw @s[scores={target=2, sk_a_23=1}] { "rawtext": [{ "text": "Установлена цель: §cна ближайшего" } ] } 
    tellraw @s[scores={target=3, sk_a_23=1}] { "rawtext": [{ "text": "Установлена цель: §eна животных и монстров" } ] } 

    tellraw @s[scores={sk_a_23=0}] { "rawtext": [{ "text": "Я не умею пользоваться обычными волшебными палочками. Для этого мне надо изучить навык §aA23§f." } ] } 
    playanimation @s[scores={sk_a_23=0}] animation.arx.no

#Анимации
    scoreboard players set @s[scores={sk_a_23=1}] move_delay 400

# Без особой религии
    playanimation @s[scores={religion=!5, religion=!15, religion=!22, sk_a_23=1}] animation.arx.wand_b_a

# С религией - вышкой
    playanimation @s[scores={custom_random=..333, religion=5, sk_a_23=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=5, sk_a_23=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=5, sk_a_23=1}] animation.arx.wand_a_c

    playanimation @s[scores={custom_random=..333, religion=15, sk_a_23=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=15, sk_a_23=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=15, sk_a_23=1}] animation.arx.wand_a_c

    playanimation @s[scores={custom_random=..333, religion=22, sk_a_23=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=22, sk_a_23=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=22, sk_a_23=1}] animation.arx.wand_a_c

# Чистка
    tag @s remove target_1
    tag @s remove target_2
    tag @s remove target_3