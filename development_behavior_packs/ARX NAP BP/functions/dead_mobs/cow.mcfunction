# Удаляем предмет
    clear @s arx:dead_cow 0 1

# Дроп
    give @s beef 1
    give @s arx:cow_skin 1
    give @s[scores={custom_random=0..199}] arx:hoof 2
    give @s[scores={custom_random=200..399}] bone 2
    give @s[scores={custom_random=400..599}] arx:grease 1
    give @s[scores={custom_random=600..799}] arx:animal_heart 1
    give @s[scores={custom_random=800..999}] arx:brain 1
    give @s[scores={custom_random_b=0..199}] arx:liver 1
    give @s[scores={custom_random_b=200..399}] arx:animal_eye 2

    function dead_mobs/operations/get_blood