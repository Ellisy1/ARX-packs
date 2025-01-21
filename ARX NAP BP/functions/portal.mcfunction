# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ СВИТКОМ ТЕЛЕПОРТАЦИИ ИЛИ ЗАКЛИНАНИЕМ ТЕЛЕПОРТАЦИИ

# Определяем, стоим ли мы в портале [array]
    tag @s[x=248, y=64, z=286, dx=2, dy=2, dz=2] add portal1_to_big_swamp
    tag @s[x=248, y=64, z=286, dx=2, dy=2, dz=2] add in_portal

    tag @s[x=-994, y=73, z=4218, dx=2, dy=2, dz=2] add portal2_back_from_big_swamp
    tag @s[x=-994, y=73, z=4218, dx=2, dy=2, dz=2] add in_portal

    execute unless entity @e[type=arx:vicious_demon] run tag @s[x=-187, y=33, z=340, dx=2, dy=5, dz=2] add portal3_in_skull_temple
    execute unless entity @e[type=arx:vicious_demon] run tag @s[x=-187, y=33, z=340, dx=2, dy=5, dz=2] add in_portal

    tag @s[x=-214, y=33, z=335, dx=2, dy=2, dz=2] add portal4_bottom_in_skull_temple
    tag @s[x=-214, y=33, z=335, dx=2, dy=2, dz=2] add in_portal

    tag @s[x=-214, y=38, z=335, dx=2, dy=4, dz=2] add portal5_upper_in_skull_temple
    tag @s[x=-214, y=38, z=335, dx=2, dy=4, dz=2] add in_portal

    tag @s[x=-214, y=39, z=353, dx=2, dy=2, dz=2] add portal6_in_skull_temple_for_dwarfs
    tag @s[x=-214, y=39, z=353, dx=2, dy=2, dz=2] add in_portal

    tag @s[x=-21, y=-43, z=-304, dx=2, dy=2, dz=2] add portal7_in_bertolds_mines
    tag @s[x=-21, y=-43, z=-304, dx=2, dy=2, dz=2] add in_portal

    tag @s[x=21, y=8, z=-84, dx=1, dy=3, dz=1] add portal8_above_blue_lake_in_e19
    tag @s[x=21, y=8, z=-84, dx=1, dy=3, dz=1] add in_portal

    tag @s[x=-173, y=66, z=23, dx=2, dy=3, dz=2] add portal9_in_jungle_near_spawn_to_sea
    tag @s[x=-173, y=66, z=23, dx=2, dy=3, dz=2] add in_portal

    tag @s[x=1474, y=62, z=2691, dx=2, dy=3, dz=2] add portal10_on_island_far_away_to_jungle
    tag @s[x=1474, y=62, z=2691, dx=2, dy=3, dz=2] add in_portal

# Если мы не в портале и не используем свиток
    tag @s[tag=spell_available, tag=!in_portal, tag=!driven_by_scroll] add block_mp_withdraw

# Делаем партикл, звук и пишем в чат, если мы в портале
    # Замедляем. Для красивого эффекта приближения
        effect @s[tag=in_portal] slowness 2 255 true
    # Частицы и звук
        execute at @s[tag=in_portal] run particle arx:portal_embark ~ ~1.6 ~
        execute at @s[tag=in_portal] run playsound portal.embark @s ~ ~ ~ 
    # Текст
        # В портале
            tellraw @s[tag=in_portal, tag=!custom_title] { "rawtext": [ { "text": "§dВы проваливаетесь, кажется, через само пространоство" } ] }
        # Не в портале
            tellraw @s[tag=!in_portal] { "rawtext": [ { "text": "§cКажется, без портала это бесполезно..." } ] }
    # Фейд камеры
        camera @s[tag=in_portal, tag=!custom_graphics] fade time 0 2 2 color 100 0 180
        
# Телепортируем [array]
    execute as @s[tag=portal1_to_big_swamp] run tp @s -993 74 4219
    execute as @s[tag=portal2_back_from_big_swamp] run tp @s 249 65 287
    execute as @s[tag=portal3_in_skull_temple] run tp @s -181 59 336

    execute as @s[tag=portal4_bottom_in_skull_temple] run tp @s -213 39 336
    execute as @s[tag=portal5_upper_in_skull_temple] run tp @s -213 34 336
    execute as @s[tag=portal6_in_skull_temple_for_dwarfs] run function tp/1_spawn

    execute as @s[tag=portal7_in_bertolds_mines] run function tp/1_spawn

    execute as @s[tag=portal8_above_blue_lake_in_e19] run tp @s 20 51 -160

    execute as @s[tag=portal9_in_jungle_near_spawn_to_sea] run tp @s 1475 63 2692 
    execute as @s[tag=portal10_on_island_far_away_to_jungle] run tp @s -172 67 24

# Поворачиваем камеру вниз
    tp @s[tag=in_portal] ~ ~ ~ facing ~ ~-1 ~

# Звук и партикл по прибытию
    execute at @s[tag=in_portal] run playsound portal.arrive @s ~ ~ ~ 
    execute at @s[tag=in_portal] run particle arx:portal_arrive ~ ~1.3 ~

# Если инициировано свитком
    clear @s[tag=driven_by_scroll, tag=in_portal] arx:scroll_of_teleportation 0 1
    scoreboard players add @s[tag=driven_by_scroll, tag=in_portal] xp_tray 30

# Чистим остатки данных [array]
    tag @s remove portal1_to_big_swamp
    tag @s remove portal2_back_from_big_swamp
    tag @s remove portal3_in_skull_temple
    tag @s remove portal4_bottom_in_skull_temple
    tag @s remove portal5_upper_in_skull_temple
    tag @s remove portal6_in_skull_temple_for_dwarfs
    tag @s remove portal7_in_bertolds_mines
    tag @s remove portal8_above_blue_lake_in_e19
    tag @s remove portal9_in_jungle_near_spawn_to_sea
    tag @s remove portal10_on_island_far_away_to_jungle

# Чистим остатки данных
    tag @s remove driven_by_scroll
    tag @s remove in_portal
    tag @s remove custom_graphics
    tag @s remove custom_title