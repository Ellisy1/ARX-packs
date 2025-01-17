# >>>Скрипт запускается раз в 1 сек. функцией 20ticks в UAP
# Этот скрипт анализирует окружение каждого игрока и выставляет нужную музыку

# Дебаг незаведённой переменной
    scoreboard players add @a music_delay 0
    scoreboard players add @a music_volume 0
    scoreboard players set @a[scores={music_volume=0}] music_volume 30

# Снимаем 1 с переменной длительности музыки (music_delay) каждую сек
    scoreboard players add @a[scores={music_delay=1..}] music_delay -1

# Анализируем, находится ли игрок в шахтах
    tag @a remove bottom_mines_music
    execute as @a at @s run tag @s[y=-60, dy=59] add bottom_mines_music

    tag @a remove upper_mines_music
    execute as @a at @s run tag @s[y=0, dy=59] add upper_mines_music

# Анализируем, находимся ли мы в особой локации
    # Чистим теги
        # ↓ Тег сообщает что мы находимся в особой локации
            tag @a remove in_current_location
        # ↓ Тег сообщает что мы находимся в особой локации, которая вложена в ещё одну особую локацию
            tag @a remove in_inserted_current_location
        # ↓ Тег сообщает о том, что музыку надо сменить при смене дня и ночи в особой локации
            tag @a remove in_day_night_current_location
        # ↓ Тег сообщает, что на локации вообще не должно быть музыки
            tag @a remove in_current_location_without_music

    # Определяем особые локации [array]

        tag @a remove near_scull_temple
        tag @a[x=-215, y=30, z=285, dx=97, dy=200, dz=104] add near_scull_temple

        tag @a remove near_hail_6
        tag @a[x=-61, y=50, z=4, dx=50, dy=100, dz=50] add near_hail_6

        tag @a remove in_hail_6_basement
        tag @a[x=-43, y=54, z=22, dx=22, dy=6, dz=14] add in_hail_6_basement

        tag @a remove in_rat_bar
        tag @a[x=114, y=63, z=-50, dx=18, dy=5, dz=18] add in_rat_bar

        tag @a remove in_bunker
        # МЭ
            tag @a[x=-169, y=55, z=127, dx=14, dy=9, dz=16] add in_bunker
        # ВД
            tag @a[x=-446, y=62, z=-300, dx=-14, dy=9, dz=-43] add in_bunker

        tag @a remove blue_lake
        tag @a[x=75, y=-6, z=-124, dx=-108, dy=29, dz=82] add blue_lake

        tag @a remove in_pass_to_blue_lake
        tag @a[x=20, y=-3, z=-143, dx=-12, dy=11, dz=17] add in_pass_to_blue_lake

        tag @a remove in_e19
        tag @a[x=-1, y=-27, z=-226, dx=76, dy=83, dz=81] add in_e19
        tag @a[x=26, y=-38, z=-131, dx=60, dy=22, dz=-44] add in_e19

        tag @a remove in_green_place_in_e19_sewer
        tag @a[x=73, y=-30, z=-134, dx=12, dy=13, dz=-26] add in_green_place_in_e19_sewer

    # Даем теги зависимо от локаций [array]

        tag @a[tag=at_respawn_room] add in_current_location

        tag @a[tag=near_scull_temple] add in_current_location

        tag @a[tag=near_hail_6] add in_current_location

        tag @a[tag=in_hail_6_basement] add in_current_location
        tag @a[tag=in_hail_6_basement] add in_inserted_current_location

        tag @a[tag=in_rat_bar] add in_current_location

        tag @a[tag=in_bunker] add in_current_location

        tag @a[tag=blue_lake] add in_current_location
        tag @a[tag=blue_lake] add in_inserted_current_location

        tag @a[tag=in_pass_to_blue_lake] add in_current_location
        tag @a[tag=in_pass_to_blue_lake] add in_current_location_without_music

        tag @a[tag=in_e19] add in_current_location

        tag @a[tag=in_green_place_in_e19_sewer] add in_current_location
        tag @a[tag=in_green_place_in_e19_sewer] add in_inserted_current_location

# Анализируем, изменился ли биом/локация/время

    # Определяем, где и как находится игрок в переменную music_location
        # Выставляем значение music_location в 0 
            scoreboard players set @a music_location 0

        # Выставляем значения для особых локаций (пятизначеные)
            scoreboard players add @a[tag=near_scull_temple] music_location 30000
            scoreboard players add @a[tag=in_hail_6_basement] music_location 90000
            scoreboard players add @a[tag=in_green_place_in_e19_sewer] music_location 10000
            execute if entity @a[scores={vicious_demon=4..}] run scoreboard players add @a[x=-204, y=33, z=324, dx=25, dy=5, dz=25] music_location 1
            execute if entity @a[scores={march_battle_time=6..}] run scoreboard players add @a[x=43, y=18, z=-200, dx=17, dy=10, dz=17] music_location 1
            scoreboard players add @a[tag=near_hail_6] music_location 30000

        # Выставляем значения для биомов
            # Чистим тег, который запрещает изменять музыку зависимо от биома (restrict_biome_music_calculation)
                tag @a remove restrict_biome_music_calculation

            # Выдаем тег, который запрещает изменять музыку зависимо от биома (restrict_biome_music_calculation)
                tag @a[tag=in_current_location] add restrict_biome_music_calculation
                tag @a[tag=in_inserted_current_location] add restrict_biome_music_calculation
                tag @a[tag=in_day_night_current_location] add restrict_biome_music_calculation
                tag @a[tag=in_current_location_without_music] add restrict_biome_music_calculation
                tag @a[tag=bottom_mines_music] add restrict_biome_music_calculation
                tag @a[tag=upper_mines_music] add restrict_biome_music_calculation
                tag @a[tag=in_snow_biome] add restrict_biome_music_calculation
                tag @a[tag=scarlet_night] add restrict_biome_music_calculation
            
            # Рассчитываем значения биомов
                scoreboard players add @a[tag=in_snow_biome] music_location 1
                scoreboard players add @a[tag=BIOME_birch, tag=!restrict_biome_music_calculation] music_location 2
                scoreboard players add @a[tag=BIOME_desert, tag=!restrict_biome_music_calculation] music_location 3
                scoreboard players add @a[tag=BIOME_forest, tag=!restrict_biome_music_calculation] music_location 4
                scoreboard players add @a[tag=BIOME_jungle, tag=!restrict_biome_music_calculation] music_location 5
                scoreboard players add @a[tag=BIOME_mangrove_swamp, tag=!restrict_biome_music_calculation] music_location 6
                scoreboard players add @a[tag=BIOME_mesa, tag=!restrict_biome_music_calculation] music_location 7
                scoreboard players add @a[tag=BIOME_ocean, tag=!restrict_biome_music_calculation] music_location 8
                scoreboard players add @a[tag=BIOME_plains, tag=!restrict_biome_music_calculation] music_location 9
                scoreboard players add @a[tag=BIOME_plains, tag=!restrict_biome_music_calculation, tag=is_raining, scores={is_day=1}] music_location 10
                scoreboard players add @a[tag=BIOME_roofed, tag=!restrict_biome_music_calculation] music_location 10
                scoreboard players add @a[tag=BIOME_savanna, tag=!restrict_biome_music_calculation] music_location 11
                scoreboard players add @a[tag=BIOME_swamp, tag=!restrict_biome_music_calculation] music_location 12
                scoreboard players add @a[tag=BIOME_taiga, tag=!restrict_biome_music_calculation] music_location 13

        # Выставляем значения для особых локаций в общем (незавимисо от каждой локации)
            scoreboard players add @a[tag=in_current_location] music_location 100
            scoreboard players add @a[tag=in_inserted_current_location] music_location 200
            scoreboard players add @a[tag=in_current_location_without_music] music_location 300

        # Корректируем значения в случае дня и ночи, если это требуется
            scoreboard players add @a[scores={is_day=1}, tag=in_day_night_current_location] music_location 888
            scoreboard players add @a[scores={is_day=1}, tag=!in_current_location] music_location 888

        # Выставляем переменную, если игрок находится в шахтах
            scoreboard players add @a[tag=bottom_mines_music, tag=!in_current_location] music_location 10000
            scoreboard players add @a[tag=upper_mines_music, tag=!in_current_location] music_location 20000

    # Сравниваем предыдущее значение локации с текущим. Если не совпало, то это означает что местонахождение игрока поменялось и пора сменить музыку
        # Само сравнение
            tag @a remove __music_is_unchanging__
            execute as @a if score @s music_loc_log = @s music_location run tag @s add __music_is_unchanging__

        # Перезапуск музыки, если пора это сделать
            stopsound @a[tag=!__music_is_unchanging__]
            scoreboard players set @a[tag=!__music_is_unchanging__] music_delay 0
            
        # Записываем переменную местонахождения в журнальную переменную
            execute as @a run scoreboard players operation @s music_loc_log = @s music_location


# Анализируем, какую музыку включать
    # Запускаем музыку. Та музыка, которая приоритетнее, указана выше других.
        # Незер
            execute as @a[scores={music_delay=..0}, tag=in_nether] at @s run function music/start_music/nether
            
        # Респавн
            execute as @a[scores={music_delay=..0}, tag=at_respawn_room] at @s run function music/start_music/respawn

        # Кастом - вложенные
            execute as @a[scores={music_delay=..0}, tag=in_hail_6_basement] at @s run function music/start_music/custom/hail_6_basement
            execute as @a[scores={music_delay=..0}, tag=in_green_place_in_e19_sewer] at @s run function music/start_music/custom/green_place_in_e19_sewer
            execute as @a[scores={music_delay=..0}, tag=blue_lake] at @s run function music/start_music/custom/blue_lake
       
        # Шахты
            execute as @a[scores={music_delay=..0}, tag=upper_mines_music, tag=!in_current_location] at @s run function music/start_music/upper_mines
            execute as @a[scores={music_delay=..0}, tag=bottom_mines_music, tag=!in_current_location] at @s run function music/start_music/lower_mines

        # Кастом - основные локации
            execute if entity @a[scores={march_battle_time=6..}] as @a[scores={music_delay=..0}, tag=in_e19, x=43, y=18, z=-200, dx=17, dy=10, dz=17] at @s run function music/start_music/custom/march_battle
            execute as @a[scores={music_delay=..0}, tag=in_e19] at @s run function music/start_music/custom/e19_default
            execute as @a[scores={music_delay=..0}, tag=in_rat_bar] at @s run function music/start_music/custom/rat_bar
            execute as @a[scores={music_delay=..0}, tag=in_bunker] at @s run function music/start_music/custom/in_bunker
            execute if entity @a[scores={vicious_demon=4..}] as @a[scores={music_delay=..0}, tag=near_scull_temple, x=-204, y=33, z=324, dx=25, dy=5, dz=25] at @s run function music/start_music/custom/vicious_demon_battle
            execute as @a[scores={music_delay=..0}, tag=near_scull_temple] at @s run function music/start_music/custom/scull_temple
            execute as @a[scores={music_delay=..0}, tag=near_hail_6] at @s run function music/start_music/custom/hail_6

        # Алая ночь
            execute as @a[scores={music_delay=..0, is_day=0}, tag=!in_current_location, tag=scarlet_night] at @s run function music/start_music/scarlet_night

        # Биомы
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=in_snow_biome] at @s run function music/start_music/ice
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_birch] at @s run function music/start_music/birch
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_desert] at @s run function music/start_music/desert
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_forest] at @s run function music/start_music/forest
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_jungle] at @s run function music/start_music/jungle
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_mangrove_swamp] at @s run function music/start_music/mangrove_swamp
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_mesa] at @s run function music/start_music/mesa
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_ocean] at @s run function music/start_music/ocean
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_plains] at @s run function music/start_music/plains
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_roofed] at @s run function music/start_music/roofed
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_savanna] at @s run function music/start_music/savanna
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_swamp] at @s run function music/start_music/swamp
            execute as @a[scores={music_delay=..0}, tag=!in_current_location, tag=BIOME_taiga] at @s run function music/start_music/taiga

        # Неопознанная локация
            execute as @a[scores={music_delay=..0}, tag=!in_current_location_without_music] at @s run function music/start_music/unknown