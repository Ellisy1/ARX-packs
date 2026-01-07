# Эта функция вызывается каждые 10 тактов при условии что в мире есть хотя бы один порочный демон в нужной для него локации
# Задача функции - "руковоить" порочным демоном и выполнять различные действия от его лица
    # Урон от вращения
        execute as @e[type=arx:vicious_demon, tag=spin, tag=hp_0_to_25] at @s run damage @a[r=3, has_property={arx:is_knocked=false}] 8 entity_attack
        execute as @e[type=arx:vicious_demon, tag=spin, tag=!hp_0_to_25] at @s run damage @a[r=3, has_property={arx:is_knocked=false}] 6 entity_attack
        execute at @e[type=arx:vicious_demon, tag=spin] if entity @a[r=3, has_property={arx:is_knocked=false}] run playsound axe_use @a ~ ~ ~
        execute at @e[type=arx:vicious_demon, tag=spin] unless entity @a[r=3, has_property={arx:is_knocked=false}] run playsound knife_use @a ~ ~ ~

    # Анимируем блокировку
        execute as @e[type=arx:vicious_demon, tag=shield] run playanimation @s animation.vicious_demon.block

    # Очки получения ударов
        execute as @e[type=arx:vicious_demon, scores={vic_dem_hit_cnt=9..}] run event entity @s shield
        execute as @e[type=arx:vicious_demon, scores={vic_dem_hit_cnt=9..}] run scoreboard players set @s vic_dem_hit_cnt 0
        execute as @e[type=arx:vicious_demon, scores={vic_dem_hit_cnt=1..}] run scoreboard players add @s vic_dem_hit_cnt -1

    # Анализ порочного демона
        tag @a remove players_on_battlefield
        tag @a remove demon_on_battlefield

        execute if entity @a[has_property={arx:is_knocked=false}, x=-204, y=33, z=324, dx=25, dy=5, dz=25] as @a[scores={verify=2}] run tag @s add players_on_battlefield
        execute if entity @e[type=arx:vicious_demon, x=-204, y=33, z=324, dx=25, dy=5, dz=25] as @a[scores={verify=2}] run tag @s add demon_on_battlefield

    # Если никого нет в локации порочного демона
        execute if entity @a[scores={verify=2}, tag=demon_on_battlefield, tag=!players_on_battlefield] run event entity @e[type=arx:vicious_demon] despawn

    # Частицы когда мало хп
        execute at @e[type=arx:vicious_demon, tag=hp_0_to_25, tag=spin] run particle arx:vicious_flame ~ ~1.4 ~
        execute at @e[type=arx:vicious_demon, tag=hp_0_to_25, tag=spin] run scoreboard players set @a[r=3, has_property={arx:is_knocked=false}] vicious_flame 1