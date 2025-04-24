# Универсальный радиоключ - обычный режим работы

# Конструкция переменных универстального ключа:
#   urk_последовательность, то есть переменная для последовательности 0000 будет urk_0000
#   urkm_последовательность, если требудется военный шифровальный чип

tag @s[hasitem={item=arx:military_chip, location=slot.armor.feet}] add has_military_chip

# Достаточно заряда, набор значения
    # 0
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tellraw @s { "rawtext": [ { "text": "Записано §a0" } ] }

    # 1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tellraw @s { "rawtext": [ { "text": "Записано §a1" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s urk_12343 1

    # 2
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tellraw @s { "rawtext": [ { "text": "Записано §a2" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_12343=1}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_12343=1}] urk_12343 2

    # 3
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tellraw @s { "rawtext": [ { "text": "Записано §a3" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_12343=4}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_12343=4}] urk_12343 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_12343=2}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_12343=2}] urk_12343 3

    # 4
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tellraw @s { "rawtext": [ { "text": "Записано §a4" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tag @s[scores={urk_12343=3}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run scoreboard players set @s[scores={urk_12343=3}] urk_12343 4

    # 5
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tellraw @s { "rawtext": [ { "text": "Записано §a5" } ] }

    # 6
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-20, rxm=-30] run tellraw @s { "rawtext": [ { "text": "Записано §a6" } ] }

    # 7
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tellraw @s { "rawtext": [ { "text": "Записано §a7" } ] }

    # 8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tellraw @s { "rawtext": [ { "text": "Записано §a8" } ] }

    # 9
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tellraw @s { "rawtext": [ { "text": "Записано §a9" } ] }

    # A
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tellraw @s { "rawtext": [ { "text": "Записано §aA" } ] }

    # B 
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tellraw @s { "rawtext": [ { "text": "Записано §aB" } ] }

    # C
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tellraw @s { "rawtext": [ { "text": "Записано §aC" } ] }

    # D
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tellraw @s { "rawtext": [ { "text": "Записано §aD" } ] }

    # E
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=60, rxm=50] run tellraw @s { "rawtext": [ { "text": "Записано §aE" } ] }

    # F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tellraw @s { "rawtext": [ { "text": "Записано §aF" } ] }


    # Обработка тегов
        scoreboard players set @s[rx=70, tag=!encoding_urk_12343] urk_12343 0
        tag @s[rx=70] remove encoding_urk_12343

# Недостаточно заряда, набор значения
    execute as @s[scores={battery_avail=1, battery_charge=..9}, rx=70] run tellraw @s { "rawtext": [ { "text": "§cНедостаточно заряда для набора значения! Требуется 10§fŐ" } ] }

# Списание заряда при наборе любого HEX числа
    execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70] run scoreboard players add @s battery_charge -10



# Достаточно заряда, активация

    # Общее сообщение + пик
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70] run playsound urk_activation_beep @a ~ ~ ~
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70, tag=!has_military_chip] run tellraw @s { "rawtext": [ { "text": "§aАктивировано!\n§bИспользуется стандартное URK шифрование" } ] }
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70, tag=has_military_chip] run tellraw @s { "rawtext": [ { "text": "§aАктивировано!\n§dИспользуется военное URK-M шифрование" } ] }

    # АКТИВАЦИИ
        # urk_12343 (тестовый код)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_12343=99}, rxm=70] run tellraw @s { "rawtext": [ { "text": "§a§oУспешно активирован тестовый код 1-2-3-4-3" } ] }

# Недостаточно заряда, активация
    execute as @s[scores={battery_avail=1, battery_charge=..29}, rxm=70] run tellraw @s { "rawtext": [ { "text": "§cНедостаточно заряда для активации! Требуется 30§fŐ" } ] }

# Списание заряда
    execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70] run scoreboard players add @s battery_charge -30

# Чистка
    tag @s remove has_military_chip