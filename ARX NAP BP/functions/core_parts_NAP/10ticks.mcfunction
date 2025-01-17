
# Анализ порочного демона
    function core_parts_NAP/vicious_demon_analysis

# Анализ эффектов - 10tcs
    function core_parts_NAP/effects_analisys/10tick

# Урон истрибитора
    execute as @e[type=arx:gasgolder_istribitor] at @s run damage @a[r=3.2] 4
    execute as @e[type=arx:gasgolder_istribitor] at @s run damage @e[r=3, type=horse] 4

# Обжигание об раскаленные предметы (Не добавлять в 20ticks)
    function core_parts/damage_by_hot_item

# Звук от магического рывка
    execute at @a[scores={tp_cd=1..}] run playsound magic_dash @a ~ ~1.3 ~

# [Костыль] Активируем заправку генератора в магазине электроники
    execute as @a[tag=__activate_fuel_generator_in_electronics_shop__] run function high_tec/activate_fuel_generator_in_electronics_shop
    execute as @a[tag=__activate_putting_paper_into_printer_in_electronics_shop__] run function high_tec/activate_putting_paper_into_printer_in_electronics_shop

# Март
    # Урон огнем при полете
        execute as @e[type=arx:march, has_property={arx:active_engines=true}] at @s positioned ~ ~-2 ~ run damage @e[r=2, type=!arx:march] 6 fire
        execute as @e[type=arx:march, has_property={arx:active_engines=true}] at @s positioned ~ ~-4 ~ run damage @e[r=2, type=!arx:march] 3 fire

    # Начало боя
        scoreboard players set @a[scores={verify=2}] march_crossed_line_players_counter 0
        execute at @a[x=51, y=18, z=-184, dx=10, dy=10, dz=-15, m=!spectator] run scoreboard players add @a[scores={verify=2}] march_crossed_line_players_counter 1
        execute if entity @a[scores={verify=2, march_crossed_line_players_counter=3.., march_defeated=0}] unless entity @e[type=arx:march] run function march/start_battle

    # Свет внизу поля боя
        # Внутренний квадрат
            # Включение
                execute if entity @a[scores={verify=2, march_battle_time=!1..45}] run fill 53 17 -190 53 17 -190 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..45}] run fill 53 17 -193 53 17 -193 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..45}] run fill 50 17 -190 50 17 -190 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..45}] run fill 50 17 -193 50 17 -193 minecraft:redstone_block

            # Выключение
                execute if entity @a[scores={verify=2, march_battle_time=1..45}] run fill 53 17 -190 53 17 -190 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..45}] run fill 53 17 -193 53 17 -193 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..45}] run fill 50 17 -190 50 17 -190 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..45}] run fill 50 17 -193 50 17 -193 minecraft:air

        # Внешний квадрат
            # Включение
                execute if entity @a[scores={verify=2, march_battle_time=!1..55}] run fill 55 17 -188 55 17 -188 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..55}] run fill 55 17 -195 55 17 -195 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..55}] run fill 48 17 -188 48 17 -188 minecraft:redstone_block
                execute if entity @a[scores={verify=2, march_battle_time=!1..55}] run fill 48 17 -195 48 17 -195 minecraft:redstone_block

            # Выключение
                execute if entity @a[scores={verify=2, march_battle_time=1..55}] run fill 55 17 -188 55 17 -188 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..55}] run fill 55 17 -195 55 17 -195 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..55}] run fill 48 17 -188 48 17 -188 minecraft:air
                execute if entity @a[scores={verify=2, march_battle_time=1..55}] run fill 48 17 -195 48 17 -195 minecraft:air