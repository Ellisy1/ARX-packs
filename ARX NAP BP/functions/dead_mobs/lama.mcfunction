# Удаляем предмет
    clear @s arx:dead_lama 0 1

# Дроп
    give @s arx:lama_meat 1
    give @s arx:lama_skin 1
    give @s[scores={custom_random=0..199}] bone 1
    give @s[scores={custom_random=200..399}] arx:fang 1
    give @s[scores={custom_random=400..599}] arx:animal_heart 1
    give @s[scores={custom_random=600..799}] arx:animal_eye 1
    function dead_mobs/operations/get_blood