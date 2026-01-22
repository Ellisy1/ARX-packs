# Удаляем предмет
    clear @s arx:dead_fiercewolf 0 1

# Дроп
    give @s arx:fiercewolf_meat 1
    give @s arx:fiercewolf_skin 1
    give @s[scores={custom_random=0..199}] bone 2
    give @s[scores={custom_random=200..399}] arx:fang 1
    give @s[scores={custom_random=400..599}] arx:claws 4
    give @s[scores={custom_random=600..799}] arx:beast_heart 1
    give @s[scores={custom_random=800..999}] arx:monster_eye 1

    function dead_mobs/operations/get_blood