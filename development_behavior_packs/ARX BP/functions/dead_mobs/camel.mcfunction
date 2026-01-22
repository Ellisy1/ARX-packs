# Удаляем предмет
    clear @s arx:dead_camel 0 1

# Дроп
    give @s arx:camel_meat 1
    give @s arx:camel_skin 1
    give @s[scores={custom_random=0..199}] bone 2
    give @s[scores={custom_random=200..399}] arx:grease 2
    give @s[scores={custom_random=400..599}]arx:animal_heart 1
    give @s[scores={custom_random=600..799}] arx:liver 1
    give @s[scores={custom_random=800..999}] arx:animal_eye 2

    function dead_mobs/operations/get_blood