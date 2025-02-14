# Удаляем предмет
    clear @s arx:dead_goat 0 1

# Дроп
    give @s arx:goat_meat 1
    give @s arx:goat_skin 1
    give @s[scores={custom_random=0..199}] arx:hoof 2
    give @s[scores={custom_random=200..399}] bone 3
    give @s[scores={custom_random=400..599}] arx:animal_heart 1
    give @s[scores={custom_random=600..799}] arx:liver 1
    give @s[scores={custom_random=800..999}] arx:animal_eye 1

    function dead_mobs/operations/get_blood

# Дропаем ОП
    scoreboard players add @s xp_tray 5