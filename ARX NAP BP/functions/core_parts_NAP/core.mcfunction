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

# Проверяем количество игроков с scores={verify=2}
    scoreboard players set @a debug_verify 0
    execute as @a[scores={verify=2}] run scoreboard players add @a debug_verify 1
    execute as @r[scores={verify=2, debug_verify=2..}] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§4Обнаржуена §cкритическая §4ошибка системы core>>>scores>>>too_many_players_with_verification_2" } ] }
    execute as @r[scores={debug_verify=..0}] run tellraw @a { "rawtext": [ { "text": "§4Обнаржуена §cкритическая §4ошибка системы core>>>scores>>>no_players_with_verification_2" } ] }

# Движок температур
    function core_parts/temperature_core

# Движок рывка вперед
    execute if entity @a[scores={tp_cd=1..}] run function core_parts_NAP/tp_forward_by_magic_dash
    
# Код для специального анимирования от предметов, на которых можно сидеть
    # Пуфик поджопник
        execute as @a[tag=is_riding] at @s if entity @e[r=1, type=arx:ottoman] run playanimation @s animation.player.ottoman

    # Кровати
        execute as @a[tag=is_riding] at @s if entity @e[r=1, type=arx:bed_straw] run playanimation @s animation.player.sleep_on_custom_bed

# Твикер нажатия на блоки
    scoreboard players add @a[scores={restrict_block_interact=1..}] restrict_block_interact -1

# Деспавним всех приговоренных алой ночью / обычной ночью
    execute if entity @a[scores={is_day=0}] run event entity @e[tag=force_to_despawn] arx:despawn_forced