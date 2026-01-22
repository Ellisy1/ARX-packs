# Удаляем предмет
    clear @s arx:dead_chicken 0 1

# Дроп
    give @s chicken 1
    give @s feather 2
    give @s[scores={custom_random=0..199}] bone 1

    function dead_mobs/operations/get_blood