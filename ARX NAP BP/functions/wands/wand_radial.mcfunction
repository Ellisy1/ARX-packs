# Устанавливаем цель напрямую, зависимо от поворота камеры
    scoreboard players set @s[rxm=20, scores={sk_b_12=1}] target 1
    scoreboard players set @s[rx=20, rxm=-20, scores={sk_b_12=1}] target 2
    scoreboard players set @s[rx=-20, scores={sk_b_12=1}] target 3

# Отчёты
    tellraw @s[scores={target=0, sk_b_12=1}] { "rawtext": [{ "text": "Цель сброшена" } ] } 
    tellraw @s[scores={target=1, sk_b_12=1}] { "rawtext": [{ "text": "Установлена цель: §aна себя" } ] } 
    tellraw @s[scores={target=2, sk_b_12=1}] { "rawtext": [{ "text": "Установлена цель: §cна ближайшего" } ] } 
    tellraw @s[scores={target=3, sk_b_12=1}] { "rawtext": [{ "text": "Установлена цель: §eна животных и монстров" } ] } 

    tellraw @s[scores={sk_b_12=0}] { "rawtext": [{ "text": "Я не умею пользоваться радиальными волшебными палочками. Для этого мне надо изучить навык §eB12§f." } ] } 
    playanimation @s[scores={sk_b_12=0}] animation.arx.no

# Анимации
    scoreboard players set @s[scores={sk_b_12=1}] move_delay 400

# Без особой религии
    playanimation @s[scores={religion=!5, religion=!15, religion=!22, sk_b_12=1}] animation.arx.wand_b_a

# С религией - вышкой
    playanimation @s[scores={custom_random=..333, religion=5, sk_b_12=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=5, sk_b_12=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=5, sk_b_12=1}] animation.arx.wand_a_c

    playanimation @s[scores={custom_random=..333, religion=15, sk_b_12=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=15, sk_b_12=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=15, sk_b_12=1}] animation.arx.wand_a_c

    playanimation @s[scores={custom_random=..333, religion=22, sk_b_12=1}] animation.arx.wand_a_a
    playanimation @s[scores={custom_random=334..666, religion=22, sk_b_12=1}] animation.arx.wand_a_b
    playanimation @s[scores={custom_random=667.., religion=22, sk_b_12=1}] animation.arx.wand_a_c