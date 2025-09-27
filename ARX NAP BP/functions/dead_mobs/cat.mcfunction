# Удаляем предмет
    clear @s arx:dead_cat 0 1

# Дроп
    give @s arx:cat_meat 1
    give @s string 2
    give @s[scores={custom_random=0..199}] bone 1
    give @s[scores={custom_random=200..399}] arx:fang 1
    give @s[scores={custom_random=400..599}] arx:claws 1
    give @s[scores={custom_random=600..799}] arx:animal_heart 1
    give @s[scores={custom_random=800..999}] arx:brain 1
    give @s[scores={custom_random=0..199}] arx:animal_eye 1

    function dead_mobs/operations/get_blood