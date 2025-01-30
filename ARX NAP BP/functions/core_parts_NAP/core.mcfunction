# Это функция, запускающаяся каждый такт, использующая новый синтаксис execute [NAP]

# Могила (выпадает из игрока при его ноке и подсасывает лут)
    # Выдаём тег могиле, если рядом с коробом есть неподнятый им лут
        tag @e[type=arx:grave, tag=grave_cd_expired] remove some_items_not_hopped
        execute at @e[type=arx:grave, tag=grave_cd_expired, tag=!some_items_not_hopped, tag=!stop_hopping] at @e[type=item, r=3] run tag @e[type=arx:grave, tag=grave_cd_expired] add some_items_not_hopped
    
    # Запускаем эвент arx:remove_item_hopper (теперь могила не притягивает предметы) 
        event entity @e[type=arx:grave, tag=grave_cd_expired, tag=!some_items_not_hopped] arx:remove_item_hopper
        tag @e[type=arx:grave, tag=grave_cd_expired, tag=!some_items_not_hopped] add stop_hopping
        tag @e[type=arx:grave, tag=grave_cd_expired, tag=stop_hopping] remove some_items_not_hopped

    # Телепортируем все предметы на короб, если они ещё не закончились
        execute at @e[type=arx:grave, tag=!grave_cd_expired] run tp @e[type=item, r=3] ~ ~0.5 ~
        execute at @e[type=arx:grave, tag=some_items_not_hopped] run tp @e[type=item, r=3] ~ ~0.5 ~

    # Киляем гроб, если он пустой
        event entity @e[type=arx:grave, tag=grave_cd_expired] arx:test_is_empty

# Комната регистрации (определяем, в ней ли игрок)
    tag @a remove at_respawn_room
    tag @e[x=9990, y=-43, z=9990, dx=20, dy=20, dz=20] add at_respawn_room

# Проверяем количество игроков с scores={verify=2} (Не может располагаться в другой области движка, так как на @a[scores={verify=2}] базируется запуск всех остальных областей движка)
    scoreboard players set @a debug_verify 0
    execute as @a[scores={verify=2}] run scoreboard players add @a debug_verify 1
    execute as @r[scores={verify=2, debug_verify=2..}] run w @a[scores={verify=2}] §4Обнаржуена §cкритическая §4ошибка системы core>>>scores>>>too_many_players_with_verification_2
    execute as @r[scores={debug_verify=..0}] run w @a §4Обнаржуена §cкритическая §4ошибка системы core>>>scores>>>no_players_with_verification_2

# Движок температур
    function core_parts/temperature_core

# Движок рывка вперед
    execute if entity @a[scores={tp_cd=1..}] run function core_parts_NAP/tp_forward_by_magic_dash

# Кровь при ранениях
    execute at @a[tag=!is_dead, tag=low_hp, scores={class=!1, custom_random=550..570}] run particle arx:blood_one
    execute at @a[tag=!is_dead, tag=very_low_hp, scores={class=!1, custom_random=550..650}] run particle arx:blood_one

#Свет экипировки
    execute at @a[hasitem={item=minecraft:torch, location=slot.weapon.mainhand}] if block ~ ~1.5 ~ air run fill ~ ~1.5 ~ ~ ~1.5 ~ arx:dynamic_light_block_14
    execute at @a[hasitem={item=minecraft:redstone_torch, location=slot.weapon.mainhand}] if block ~ ~1.5 ~ air run fill ~ ~1.5 ~ ~ ~1.5 ~ arx:dynamic_light_block_7
    execute at @a[hasitem={item=minecraft:lantern, location=slot.weapon.mainhand}] if block ~ ~1.5 ~ air run fill ~ ~1.5 ~ ~ ~1.5 ~ arx:dynamic_light_block_14
    # Свет от ламп
        execute as @a[scores={max_light_range=!0, lamp_oil=1..}, m=!spectator] at @s run function core_parts_NAP/belt_lamps

# Проверка едем ли мы на ком-то
    tag @a remove is_riding
    event entity @a arx:test_is_riding 

    tag @a remove has_riders
    event entity @a arx:test_has_riders 


# Код для специального анимирования от предметов, на которых можно сидеть
    # Пуфик поджопник
        execute as @a[tag=is_riding] at @s if entity @e[r=1, type=arx:ottoman] run playanimation @s animation.player.ottoman

    # Кровати
        execute as @a[tag=is_riding] at @s if entity @e[r=1, type=arx:bed_straw] run playanimation @s animation.player.sleep_on_custom_bed


# НАМОКАНИЕ И ВЫСЫХАНИЕ
    # Анализ окружения и условий высыхания и намокания
        tag @a remove in_water
        event entity @a arx:test_in_water 

        tag @a remove in_block_water
        event entity @a arx:test_in_block_water

        tag @a remove in_rain
        tag @a[tag=in_water, tag=!in_block_water] add in_rain

        tag @a remove in_boat
        execute at @e[family=boat] run tag @a[r=0.5] add in_boat

        # Если зонт или сапф. амулет (дополнительное вычитание намокания)
            # Чистка тегов
                tag @a remove holding_umbrella
                tag @a remove amul_sapphire
            
            # Выдача тегов
                # Зонты
                    tag @a[hasitem={item=arx:umbrella_golden_silk, location=slot.weapon.mainhand}] add holding_umbrella
                    tag @a[hasitem={item=arx:umbrella_silk, location=slot.weapon.mainhand}] add holding_umbrella
                    tag @a[hasitem={item=arx:umbrella_skin, location=slot.weapon.mainhand}] add holding_umbrella
                    tag @a[hasitem={item=arx:umbrella_small_silk, location=slot.weapon.mainhand}] add holding_umbrella
                    # Если держим зонт, даем всем вокруг блок дождя
                        execute at @a[tag=holding_umbrella] run tag @a[r=1] add holding_umbrella
                    
                # Амулет с сапфиром
                    tag @a[hasitem={item=arx:amul_sapphire, location=slot.armor.legs}] add amul_sapphire

    # ВЫСЫХАНИЕ
        # Основное высыхание
            scoreboard players add @a[scores={water_delay=1..2400}, tag=!in_water] water_delay -1

        # Высыхание в аду
            scoreboard players add @a[scores={water_delay=1..2400}, tag=in_nether] water_delay -4

        # Высыхание с зонтиком
            scoreboard players add @a[scores={water_delay=1..2400}, tag=in_rain, tag=holding_umbrella] water_delay -1

        # Высыхание с амулетом-сапфиром
            scoreboard players add @a[scores={water_delay=1..2400}, tag=in_rain, tag=amul_sapphire] water_delay -1

    # НАМОКАНИЕ
        # В воде
            scoreboard players add @a[scores={water_delay=0..2389, water_block=..0}, tag=in_block_water, tag=!in_boat, tag=!blue_lake, m=!spectator] water_delay 10

        # Под дождем
            scoreboard players add @a[scores={water_delay=0..2399, water_block=..0}, tag=in_rain, tag=!amul_sapphire, tag=!holding_umbrella, tag=!underground, m=!spectator] water_delay 1


    # Дебаг отриц. значений
        scoreboard players set @a[scores={water_delay=..0}] water_delay 0

    # Сообщения
        title @a[scores={water_delay=1, freezing=0}] actionbar §fВы высохли
        title @a[scores={water_delay=2..200, freezing=0}] actionbar Ģ §bВы промокли §fĢ
        title @a[scores={water_delay=201..400, freezing=0}] actionbar ĢĢ §bВы промокли §fĢĢ
        title @a[scores={water_delay=401..2400, freezing=0}] actionbar ĢĢĢ §bВы промокли §fĢĢĢ

    # Партиклы
        execute at @a[scores={water_delay=1..2400}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~.2 ~ ~.2
        execute at @a[scores={water_delay=1..2400}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~-0.2 ~ ~.2
        execute at @a[scores={water_delay=1..2400}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~.2 ~ ~-0.2
        execute at @a[scores={water_delay=1..2400}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~-0.2 ~ ~-0.2
        execute at @a[scores={water_delay=1..2400}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~ ~ ~

# Камера на плече
#    execute as @a[tag=shoulersurfing_camera] at @s run camera @s set minecraft:free ease 0.2 linear pos ^-1 ^2 ^-3.3 facing ^-0.8 ^2 ^0
    
# Настройка позы
    execute if entity @a[has_property={arx:is_knocked=0}, hasitem={item=arx:pose_tuning, location=slot.weapon.mainhand}] run function core_parts_NAP/pose_tuning_titles

# Свет от огоньков
    execute unless entity @a[tag=scarlet_night] at @e[type=arx:wandering_flame_of_night] if block ~ ~ ~ air run fill ~ ~ ~ ~ ~ ~ arx:dynamic_light_block_14
    execute at @e[type=arx:march, has_property={arx:active_engines=true}] if block ~ ~ ~ air run fill ~ ~ ~ ~ ~ ~ arx:dynamic_light_block_14

# Твикер нажатия на блоки
    scoreboard players add @a[scores={restrict_block_interact=1..}] restrict_block_interact -1

# Деспавним всех приговоренных алой ночью / обычной ночью
    execute if entity @a[scores={is_day=0}] run event entity @e[tag=force_to_despawn] arx:despawn_forced

# Комментарии при взятии книжки инфо
    execute if entity @a[scores={respawn_delay=0}, m=!spectator, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] run function core_parts_NAP/display_united_player_data

# Анализ маны
    function core_parts_NAP/mana

# Нокаут
    # Темнеем камеру, если нокнуты
        execute as @a[scores={respawn_delay=7..}] run camera @s fade time 0.1 2 0 color 20 3 3
    # Выход из состояния нокаута
        execute as @a[scores={respawn_delay=0}, has_property={arx:is_knocked=1..}, tag=is_moving, tag=!is_riding] run event entity @s arx:property_is_knockout_set_0

        # Сбрасываем игрока, если тащим его, присев и разблокируем ему управление, если это нужно
            execute as @a[tag=is_riding, has_property={arx:is_knocked=1..}] at @s if entity @p[r=2, has_property={arx:is_knocked=0}, tag=is_sneaking, tag=has_riders] run ride @s stop_riding
            execute as @a[has_property={arx:is_knocked=1..}, scores={respawn_delay=0}] at @s if entity @p[r=2, has_property={arx:is_knocked=0}, tag=is_sneaking, tag=has_riders] run inputpermission set @s movement enabled
            execute as @a[has_property={arx:is_knocked=1..}, scores={respawn_delay=0}] at @s if entity @p[r=2, has_property={arx:is_knocked=0}, tag=is_sneaking, tag=has_riders] run event entity @s arx:property_is_knockout_set_0