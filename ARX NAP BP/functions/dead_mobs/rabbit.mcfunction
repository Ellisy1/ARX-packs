# Удаляем предмет
    clear @s arx:dead_rabbit 0 1

# Дроп
    give @s arx:rabbit_meat 1
    give @s arx:rabbit_skin 1
    give @s[scores={custom_random=0..199}] bone 1
    give @s[scores={custom_random=200..399}] arx:fang 1
    give @s[scores={custom_random=400..599}] arx:animal_eye 1
    function dead_mobs/operations/get_blood

# Дропаем ОП
    scoreboard players add @s xp_tray 5