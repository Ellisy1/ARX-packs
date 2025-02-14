# Удаляем предмет
    clear @s arx:dead_deer 0 1

# Дроп
    give @s arx:raw_venison 1
    give @s arx:deer_skin 1
    give @s[scores={custom_random=0..199}] bone 2
    give @s[scores={custom_random=200..399}] arx:grease 1
    give @s[scores={custom_random=400..599}] arx:animal_heart 1
    give @s[scores={custom_random=600..799}] arx:brain 1
    give @s[scores={custom_random=800..999}] arx:liver 1
    give @s[scores={custom_random_b=0..199}] arx:animal_eye 1

    function dead_mobs/operations/get_blood

# Дропаем ОП
    scoreboard players add @s xp_tray 5