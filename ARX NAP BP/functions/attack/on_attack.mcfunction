# Отчёт о фулл данных
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": ">>> §6Атака. ИНФО:" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_dagger] { "rawtext": [ { "text": "Тип оружия: §6кинжал" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_default] { "rawtext": [ { "text": "Тип оружия: одноручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_heavy] { "rawtext": [ { "text": "Тип оружия: тяжёлый двуручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_lance] { "rawtext": [ { "text": "Тип оружия: §6копье" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_longsword] { "rawtext": [ { "text": "Тип оружия: лёгкий двуручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_scythe] { "rawtext": [ { "text": "Тип оружия: §6коса" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_very_heavy] { "rawtext": [ { "text": "Тип оружия: сверхтяжёлый §6меч" } ] }

    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Ослабление атаки от оружия: " }, { "score": {"name": "@s", "objective": "uni_cool_down" } } ] }


# Конвертируем кд с секунд в такты (uni_cool_down)
    scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20

    # Прибавляем к фактическому (который, например, мог остаться с прошлого удара) вычисленный выше кд
        scoreboard players operation @s attack_weakness += @s uni_cool_down

    # Отчет по факту кд
        tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Фактическое кол-во тактов ослабления атаки: " }, { "score": {"name": "@s", "objective": "attack_weakness" } } ] }
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