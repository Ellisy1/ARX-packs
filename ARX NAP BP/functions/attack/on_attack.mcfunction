# Отчёт о фулл данных
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": ">>> §6Атака. ИНФО:" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_dagger] { "rawtext": [ { "text": "Тип оружия: §6кинжал" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_default_sword] { "rawtext": [ { "text": "Тип оружия: одноручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_heavy_sword] { "rawtext": [ { "text": "Тип оружия: тяжёлый двуручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_lance] { "rawtext": [ { "text": "Тип оружия: §6копье" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_long_sword] { "rawtext": [ { "text": "Тип оружия: лёгкий двуручный §6меч" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_scythe] { "rawtext": [ { "text": "Тип оружия: §6коса" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_staff] { "rawtext": [ { "text": "Тип оружия: посох" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_hheavy_sword] { "rawtext": [ { "text": "Тип оружия: сверхтяжёлый §6меч" } ] }

    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Ослабление атаки от оружия: " }, { "score": {"name": "@s", "objective": "uni_cool_down" } } ] }

# Конвертируем кд с секунд в такты (uni_cool_down)
    scoreboard players operation @s uni_cool_down *= @p[scores={verify=2}] const_20

    # Прибавляем к фактическому (который, например, мог остаться с прошлого удара) вычисленный выше кд
        scoreboard players operation @s attack_weakness += @s uni_cool_down

    # Отчет по факту кд
        tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Фактическое кол-во тактов ослабления атаки: " }, { "score": {"name": "@s", "objective": "attack_weakness" } } ] }
        tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§6=====" } ] }


# Обработка атаки

    # Кинжал
        execute if entity @s[tag=is_dagger] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_dagger, tag=on_ground, scores={custom_random=0..500}] animation.attack.dagger.a
        playanimation @s[tag=is_dagger, tag=on_ground, scores={custom_random=501..}] animation.attack.dagger.b
        playanimation @s[tag=is_dagger, tag=!on_ground] animation.attack.dagger.c

    # Обычный меч
        execute if entity @s[tag=is_default_sword] run playsound knife_use @a ~ ~ ~
        # Не в движении
            playanimation @s[tag=is_default_sword, tag=!is_moving, scores={custom_random=0..333}] animation.attack.default.a
            playanimation @s[tag=is_default_sword, tag=!is_moving, scores={custom_random=334..666}] animation.attack.default.b
            playanimation @s[tag=is_default_sword, tag=!is_moving, scores={custom_random=667..1000}] animation.attack.default.c
        # В движении
            playanimation @s[tag=is_default_sword, tag=is_moving] animation.attack.default.fast_moving


    # Тяжи 
        execute if entity @s[tag=is_heavy_sword] run playsound axe_use @a ~ ~ ~
        playanimation @s[tag=is_heavy_sword] animation.attack.heavy.a

    # Древка
        execute if entity @s[tag=is_lance] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_lance, tag=on_ground] animation.attack.lance.a
        playanimation @s[tag=is_lance, tag=!on_ground] animation.attack.lance.b

    
    # Длинный меч
        execute if entity @s[tag=is_long_sword] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_long_sword, scores={custom_random=0..333}] animation.attack.longsword.a
        playanimation @s[tag=is_long_sword, scores={custom_random=334..665}] animation.attack.longsword.b
        playanimation @s[tag=is_long_sword, scores={custom_random=666..}] animation.attack.longsword.c

    # Коса
        execute if entity @s[tag=is_scythe] run playsound knife_use @a ~ ~ ~
        playanimation @s[tag=is_scythe] animation.attack.scythe.a

    # Посох
        playanimation @s[tag=is_staff] animation.attack.staff.a

    # Сверхтяжи
        execute if entity @s[tag=is_hheavy_sword] run playsound axe_use @a ~ ~ ~
        playanimation @s[tag=is_hheavy_sword] animation.attack.veryheavy.a

    # Безоружен
        playanimation @s[tag=is_unarmed] animation.attack.unarmed.a



# Чистка
    tag @s remove is_heavy_sword
    tag @s remove is_long_sword
    tag @s remove is_dagger
    tag @s remove is_default_sword
    tag @s remove is_staff
    tag @s remove is_lance
    tag @s remove is_scythe
    tag @s remove is_hheavy_sword
    tag @s remove is_wand
    tag @s remove is_unarmed