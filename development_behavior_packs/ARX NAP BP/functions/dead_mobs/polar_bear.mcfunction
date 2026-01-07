# Удаляем предмет
    clear @s arx:dead_polar_bear 0 1

# Дроп
    give @s arx:polar_bear_meat 1
    give @s arx:polar_bear_skin 1
    give @s arx:grease 3
    give @s[scores={custom_random=0..199}] bone 4
    give @s[scores={custom_random=200..399}] arx:animal_heart 1
    give @s[scores={custom_random=400..599}] arx:brain 1
    give @s[scores={custom_random=600..799}] arx:liver 1
    give @s[scores={custom_random=800..999}] arx:animal_eye 1

    function dead_mobs/operations/get_blood