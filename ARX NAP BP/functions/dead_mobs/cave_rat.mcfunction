# Удаляем предмет
    clear @s arx:dead_cave_rat 0 1

# Дроп
    give @s arx:cave_rat_meat 1
    give @s arx:cave_rat_skin 1
    give @s[scores={custom_random=0..199}] bone 2
    give @s[scores={custom_random=200..399}] arx:fang 1
    give @s[scores={custom_random=400..599}] arx:claws 1
    give @s[scores={custom_random=600..799}] arx:grease 2
    give @s[scores={custom_random=800..999}] arx:beast_heart 1
    give @s[scores={custom_random=0..199}] arx:brain 1
    give @s[scores={custom_random=200..399}] arx:liver 1
    give @s[scores={custom_random=400..599}] arx:monster_eye 1

    function dead_mobs/operations/get_blood

# Дропаем ОП
    scoreboard players add @s xp_tray 5