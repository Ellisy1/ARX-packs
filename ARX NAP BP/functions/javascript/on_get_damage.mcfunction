# Эта функция запускается файлом игрока player.json в папке entities при получении урона

# Графика (1 лицо)
    effect @s[scores={allow_block_buff=!15..20}] blindness 1 0 true

    camerashake add @s 0.5 0.1 rotational 
    camerashake add @s 0.2 0.1 positional 
    #                  инт. время тип

# Увеличение счётчика ударов
    scoreboard players add @s count_hits 1

# Отслеживание состояний
    # Отслеживание боя (нигде не используется, просто есть)
        scoreboard players set @s in_battle 10
    # Задержка для установки минимального интервала между получеными ударами
        scoreboard players set @s on_hurt_delay 10

# Действие амулета брызг
    execute as @s[hasitem={item=arx:amul_of_splash, location=slot.armor.legs}, scores={custom_random=0..500}] run effect @s fire_resistance 2 0 true
    execute at @s[hasitem={item=arx:amul_of_splash, location=slot.armor.legs}] run particle arx:amul_of_splash ~ ~1.5 ~ 

# Встаем, если притворялись мертвым
    event entity @s[has_property={arx:is_knocked=true}, scores={respawn_delay=0}, tag=!is_riding] arx:property_is_knockout_set_0