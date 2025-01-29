# Анализ Оклика
    # Включен
        # Свет
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -38 61 26 -38 61 26 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -39 61 27 -39 61 27 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -39 61 31 -39 61 31 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -38 61 32 -38 61 32 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -34 61 32 -34 61 32 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -33 61 31 -33 61 31 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -33 61 27 -33 61 27 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -34 61 26 -34 61 26 minecraft:redstone_block

        # Контроллер
            execute if entity @a[scores={verify=2, hail6_enabled=1}] run fill -40 57 35 -32 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=2}] run fill -40 57 35 -32 58 35 arx:connection_controller_disabled

            execute if entity @a[scores={verify=2, hail6_enabled=4}] run fill -32 57 35 -32 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=5}] run fill -33 57 35 -33 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=6}] run fill -34 57 35 -34 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=7}] run fill -35 57 35 -35 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=8}] run fill -36 57 35 -36 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=9}] run fill -37 57 35 -37 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=10}] run fill -38 57 35 -38 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=11}] run fill -39 57 35 -39 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=12}] run fill -40 57 35 -40 58 35 arx:connection_controller_red

            execute if entity @a[scores={verify=2, hail6_enabled=15}] run fill -32 57 35 -32 57 35 arx:connection_controller_green_flip_a
            execute if entity @a[scores={verify=2, hail6_enabled=16}] run fill -32 58 35 -32 58 35 arx:connection_controller_green_flip_e
            execute if entity @a[scores={verify=2, hail6_enabled=17}] run fill -33 57 35 -33 57 35 arx:connection_controller_green_flip_b
            execute if entity @a[scores={verify=2, hail6_enabled=18}] run fill -33 58 35 -33 58 35 arx:connection_controller_green_flip_d
            execute if entity @a[scores={verify=2, hail6_enabled=19}] run fill -34 57 35 -34 57 35 arx:connection_controller_green_flip_h
            execute if entity @a[scores={verify=2, hail6_enabled=20}] run fill -34 58 35 -34 58 35 arx:connection_controller_green_flip_b
            execute if entity @a[scores={verify=2, hail6_enabled=21}] run fill -35 57 35 -35 57 35 arx:connection_controller_green_flip_d
            execute if entity @a[scores={verify=2, hail6_enabled=22}] run fill -35 58 35 -35 58 35 arx:connection_controller_green
            execute if entity @a[scores={verify=2, hail6_enabled=23}] run fill -36 57 35 -36 57 35 arx:connection_controller_green_flip_a
            execute if entity @a[scores={verify=2, hail6_enabled=24}] run fill -36 58 35 -36 58 35 arx:connection_controller_green_flip_c
            execute if entity @a[scores={verify=2, hail6_enabled=25}] run fill -37 57 35 -37 57 35 arx:connection_controller_green_flip_g
            execute if entity @a[scores={verify=2, hail6_enabled=26}] run fill -37 58 35 -37 58 35 arx:connection_controller_green_flip_f
            execute if entity @a[scores={verify=2, hail6_enabled=27}] run fill -38 57 35 -38 57 35 arx:connection_controller_green_flip_e
            execute if entity @a[scores={verify=2, hail6_enabled=28}] run fill -38 58 35 -38 58 35 arx:connection_controller_green
            execute if entity @a[scores={verify=2, hail6_enabled=29}] run fill -39 57 35 -39 57 35 arx:connection_controller_green_flip_c
            execute if entity @a[scores={verify=2, hail6_enabled=30}] run fill -39 58 35 -39 58 35 arx:connection_controller_green_flip_g
            execute if entity @a[scores={verify=2, hail6_enabled=31}] run fill -40 57 35 -40 57 35 arx:connection_controller_green_flip_h
            execute if entity @a[scores={verify=2, hail6_enabled=32}] run fill -40 58 35 -40 58 35 arx:connection_controller_green_flip_f

        # Моник
            execute if entity @a[scores={verify=2, hail6_enabled=1}] run event entity @e[type=arx:monitor_in_hail6] set_screen_rgb
            execute if entity @a[scores={verify=2, hail6_enabled=2..3}] run event entity @e[type=arx:monitor_in_hail6] set_screen_black
            execute if entity @a[scores={verify=2, hail6_enabled=4..13}] run event entity @e[type=arx:monitor_in_hail6] set_screen_initialisation
            execute if entity @a[scores={verify=2, hail6_enabled=14..32}] run event entity @e[type=arx:monitor_in_hail6] set_screen_loading
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run event entity @e[type=arx:monitor_in_hail6] set_screen_loading

            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=42}] run event entity @e[type=arx:monitor_in_hail6] set_screen_42
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=43}] run event entity @e[type=arx:monitor_in_hail6] set_screen_43
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=44}] run event entity @e[type=arx:monitor_in_hail6] set_screen_44
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=49}] run event entity @e[type=arx:monitor_in_hail6] set_screen_49
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=18207}] run event entity @e[type=arx:monitor_in_hail6] set_screen_18207

    # Выключен
        # Свет
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -38 61 26 -38 61 26 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -39 61 27 -39 61 27 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -39 61 31 -39 61 31 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -38 61 32 -38 61 32 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -34 61 32 -34 61 32 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -33 61 31 -33 61 31 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -33 61 27 -33 61 27 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -34 61 26 -34 61 26 minecraft:air
        
        # Контроллер
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -40 57 35 -32 58 35 arx:connection_controller_disabled

        # Моник
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run event entity @e[type=arx:monitor_in_hail6] set_screen_black

    # Увеличиваем отсчет с момента включенности
        scoreboard players add @a[scores={verify=2, hail6_enabled=1..50}] hail6_enabled 1

        scoreboard players set @a[scores={verify=2, hail6_enabled=1..50, e19_tracer_condition=!11}] hail6_enabled 0

    # Принудительно выключаем
        execute if entity @a[scores={verify=2, e19_tracer_condition=!11}] run scoreboard players set @a[scores={verify=2}] hail6_enabled 0