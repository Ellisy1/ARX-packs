# Удаляем предмет
    clear @s arx:dead_dolphin 0 1

# Дроп
    give @s arx:dolphin_meat 1
    give @s[scores={custom_random=200..399}] arx:grease 1
    give @s[scores={custom_random=400..599}] arx:brain 1

# Дропаем ОП
    scoreboard players add @s xp_tray 5