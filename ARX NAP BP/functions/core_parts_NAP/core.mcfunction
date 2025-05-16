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


# НАМОКАНИЕ И ВЫСЫХАНИЕ
    # Анализ окружения и условий высыхания и намокания
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
            scoreboard players add @a[scores={water_delay=1..}, tag=!in_water] water_delay -1

        # Высыхание в аду
            scoreboard players add @a[scores={water_delay=1..}, tag=in_nether] water_delay -4

        # Высыхание с зонтиком
            scoreboard players add @a[scores={water_delay=1..}, tag=in_rain, tag=holding_umbrella] water_delay -1

        # Высыхание с амулетом-сапфиром
            scoreboard players add @a[scores={water_delay=1..}, tag=in_rain, tag=amul_sapphire] water_delay -1

    # НАМОКАНИЕ
        # В воде
            scoreboard players add @a[scores={water_delay=..1200, water_block=..0}, tag=in_block_water, tag=!in_boat, tag=!blue_lake, m=!spectator] water_delay 10

        # Под дождем
            scoreboard players add @a[scores={water_delay=..1200, water_block=..0}, tag=in_rain, tag=!amul_sapphire, tag=!holding_umbrella, tag=!underground, m=!spectator] water_delay 1


    # Дебаг отриц. значений
        scoreboard players set @a[scores={water_delay=..0}] water_delay 0

    # Сообщения
        title @a[scores={water_delay=1}] actionbar §fВы высохли
        title @a[scores={water_delay=2..200}] actionbar  §bВы промокли §f
        title @a[scores={water_delay=201..400}] actionbar  §bВы промокли §f
        title @a[scores={water_delay=401..}] actionbar  §bВы промокли §f

    # Партиклы
        execute at @a[scores={water_delay=1..}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~.2 ~ ~.2
        execute at @a[scores={water_delay=1..}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~-0.2 ~ ~.2
        execute at @a[scores={water_delay=1..}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~.2 ~ ~-0.2
        execute at @a[scores={water_delay=1..}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~-0.2 ~ ~-0.2
        execute at @a[scores={water_delay=1..}, tag=!in_block_water, m=!spectator] run particle arx:arx_water_splash_particle ~ ~ ~

# Твикер нажатия на блоки
    scoreboard players add @a[scores={restrict_block_interact=1..}] restrict_block_interact -1

# Деспавним всех приговоренных алой ночью / обычной ночью
    execute if entity @a[scores={is_day=0}] run event entity @e[tag=force_to_despawn] arx:despawn_forced

# Телепортируем невидимые щиты на игроков
    execute as @e[type=arx:blocking_invisible_shield] at @s run tp @s @p[r=3]