# Отчёт о фулл данных
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": ">>> §6Атака. ИНФО:" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_dagger] { "rawtext": [ { "text": "Тип оружия: кинжал\nТреб. навык §aA9" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_default] { "rawtext": [ { "text": "Тип оружия: одноручный меч\nТреб. навык §aA5" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_heavy] { "rawtext": [ { "text": "Тип оружия: тяжёлый двуручный меч\nТреб. навык §eB2" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_lance] { "rawtext": [ { "text": "Тип оружия: копье\nТреб. навык §A10" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_longsword] { "rawtext": [ { "text": "Тип оружия: лёгкий двуручный меч\nТреб. навык §B2" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_scythe] { "rawtext": [ { "text": "Тип оружия: коса\nТреб. навык §B14" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_very_heavy] { "rawtext": [ { "text": "Тип оружия: сверхтяжёлый меч\nТреб. навык §cC2" } ] }

    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Ослабление атаки (в сек.): " }, { "score": {"name": "@s", "objective": "uni_cool_down" } } ] }
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§cЕсли нет навыка оружия (см. выше), то ослабление атаки будет умножено на 4" } ] }


# Выставляем кд
    execute if entity @s[tag=is_dagger, scores={sk_a_9=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_dagger, scores={sk_a_9=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_default, scores={sk_a_5=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_default, scores={sk_a_5=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_heavy, scores={sk_b_2=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_heavy, scores={sk_b_2=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_lance, scores={sk_a_10=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_lance, scores={sk_a_10=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_longsword, scores={sk_b_2=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_longsword, scores={sk_b_2=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_scythe, scores={sk_b_14=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_scythe, scores={sk_b_14=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_staff, scores={sk_a_29=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_staff, scores={sk_a_29=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20
    execute if entity @s[tag=is_very_heavy, scores={sk_c_2=0}] run scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_80

    # Прибавляем рассчетный кд к фактическому
        scoreboard players operation @s attack_weakness += @s uni_cool_down

# Отчет по факту кд
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Фактическое кол-во тактов (1/20 сек) ослабления атаки: " }, { "score": {"name": "@s", "objective": "attack_weakness" } } ] }
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§6=====" } ] }


# Анимация + звук

    # Кинжал
        execute if entity @s[tag=is_dagger] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_dagger] animation.attack.dagger.a

    # Обычный меч
        execute if entity @s[tag=is_default] run playsound knife_use @a ~ ~ ~
        # Не в движении
            playanimation @s[tag=is_default, tag=!is_moving, scores={custom_random=0..333}] animation.attack.default.a
            playanimation @s[tag=is_default, tag=!is_moving, scores={custom_random=334..666}] animation.attack.default.b
            playanimation @s[tag=is_default, tag=!is_moving, scores={custom_random=667..1000}] animation.attack.default.c
        # В движении
            playanimation @s[tag=is_default, tag=is_moving] animation.attack.default.fast_moving

    # Тяжи 
        execute if entity @s[tag=is_heavy] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_heavy] animation.attack.heavy.a

    # Древка
        execute if entity @s[tag=is_lance] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_lance] animation.attack.lance.a

    
    # Длинный меч
        execute if entity @s[tag=is_longsword] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_longsword, scores={custom_random=0..500}] animation.attack.longsword.a
        playanimation @s[tag=is_longsword, scores={custom_random=501..1000}] animation.attack.longsword.b

    # Коса
        execute if entity @s[tag=is_scythe] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_scythe] animation.attack.scythe.a

    # Посох
        playanimation @s[tag=is_staff] animation.attack.staff.a

    # Сверхтяжи
        execute if entity @s[tag=is_very_heavy] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_very_heavy] animation.attack.veryheavy.a



# Чистка
    tag @s remove is_heavy
    tag @s remove is_longsword
    tag @s remove is_dagger
    tag @s remove is_default
    tag @s remove is_staff
    tag @s remove is_lance
    tag @s remove is_scythe
    tag @s remove is_very_heavy