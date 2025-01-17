# Режим пульта на универсальном радиоключе
# Пк у марта
    # Определение переменной
        # arx:screen:
            # 0 - стартовый экран
            # 1 - экран, где игрок пытается выключить систему
            # 2 - про марта
            # 3 - про имя марта
            # 4 - про февраль
            # 5 - про ломание марта
            # 6 - про тупого пользователя

            # 10 - спросить о чем-то
            # 11 - спросить о е19
            # 12 - спросить о оклике 6
            # 13 - спросить о второй луне
            # 14 - спросить о вымирании
            # 15 - спросить о хранителях
            # 16 - спросить о богах
            # 17 - спросить о том почему март напал на игроков
            # 18 - спросить про магию
    # Код
        # Экран 0
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=0, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_1
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=0, arx:aim_direction=8}] run event entity @e[type=arx:marchs_monitor] set_screen_10
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=0, arx:aim_direction=7}] run event entity @e[type=arx:marchs_monitor] set_screen_2

        # Экран 1
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=1, arx:aim_direction=8}] run event entity @e[type=arx:marchs_monitor] set_screen_0

        # Экран 2
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=2, arx:aim_direction=7}] run event entity @e[type=arx:marchs_monitor] set_screen_3
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=2, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_0

        # Экран 3
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=3, arx:aim_direction=7}] run event entity @e[type=arx:marchs_monitor] set_screen_4
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=3, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_2

        # Экран 4
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=4, arx:aim_direction=7}] run event entity @e[type=arx:marchs_monitor] set_screen_6
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=4, arx:aim_direction=8}] run event entity @e[type=arx:marchs_monitor] set_screen_5
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=4, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_0

        # Экран 5
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=5, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_0
        
        # Экран 6
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=6, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_0


        # Экран 10
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=1}] run event entity @e[type=arx:marchs_monitor] set_screen_11
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=2}] run event entity @e[type=arx:marchs_monitor] set_screen_12
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=3}] run event entity @e[type=arx:marchs_monitor] set_screen_13
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=4}] run event entity @e[type=arx:marchs_monitor] set_screen_14
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=5}] run event entity @e[type=arx:marchs_monitor] set_screen_15
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=6}] run event entity @e[type=arx:marchs_monitor] set_screen_16
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=7}] run event entity @e[type=arx:marchs_monitor] set_screen_17
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=8}] run event entity @e[type=arx:marchs_monitor] set_screen_18
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=10, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_0

        # Экран 11
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=11, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 12
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=12, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 13
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=13, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 14
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=14, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 15
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=15, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 16
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=16, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 17
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=17, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

        # Экран 18
            execute if entity @s[tag=!marchs_monitor_screen_control, x=63, y=18, z=-190, dx=4, dy=4, dz=5] if entity @e[type=arx:marchs_monitor, has_property={arx:screen=18, arx:aim_direction=9}] run event entity @e[type=arx:marchs_monitor] set_screen_10

    # Контроль-тег ПК марта
        tag @a remove marchs_monitor_screen_control

# Пк под Окликом-6
    # Код
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=49}] run playsound beacon.activate @a -41 56 29
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=49}] run scoreboard players set @a[scores={verify=2}] hail6_second_moon_power 18207
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=44}] run playsound beacon.activate @a -41 56 29
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=44}] run scoreboard players set @a[scores={verify=2}] hail6_second_moon_power 49
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=43}] run playsound beacon.activate @a -41 56 29
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=43}] run scoreboard players set @a[scores={verify=2}] hail6_second_moon_power 44
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=42}] run playsound beacon.activate @a -41 56 29
        execute if entity @s[x=-37, y=55, z=29, dx=-4, dy=4, dz=5, ry=120, rym=60, rx=0] if entity @a[scores={verify=2, hail6_second_moon_power=42}] run scoreboard players set @a[scores={verify=2}] hail6_second_moon_power 43
