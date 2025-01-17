# Некоторые значения...
    scoreboard players set @s blocking 0

# Отчёт о фулл данных
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": ">>> §6ПКМ действие. ИНФО:" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_dagger] { "rawtext": [ { "text": "AOE урон\nТип оружия: кинжал\nБлокировка атаки +1с\nОслабление атаки +3с\nТреб. навык §aA9" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_default] { "rawtext": [ { "text": "Блокировка\nТип оружия: одноручный меч\nБлокировка атаки +2с\nОслабление атаки +3с\nТреб. навык §aA5" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_heavy] { "rawtext": [ { "text": "Блокировка\nТип оружия: тяжёлый двуручный меч\nБлокировка атаки +2с\nОслабление атаки +3с\nТреб. навык §eB2" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_lance] { "rawtext": [ { "text": "AOE урон\nТип оружия: копье\nБлокировка атаки +1с\nОслабление атаки +4с\nТреб. навык §aA10" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_longsword] { "rawtext": [ { "text": "AOE урон\nТип оружия: лёгкий двуручный меч\nБлокировка атаки +1.5с\nОслабление атаки +4с\nТреб. навык §eB2" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_scythe] { "rawtext": [ { "text": "Блокировка\nТип оружия: коса\nБлокировка атаки +2с\nОслабление атаки +3с\nТреб. навык §eB14" } ] }
    tellraw @s[tag=show_full_weapon_data, tag=is_very_heavy] { "rawtext": [ { "text": "Блокировка\nТип оружия: сверхтяжёлый меч\nБлокировка атаки +2с\nОслабление атаки +3с\nТреб. навык §cC2" } ] }

    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§aИсходный AOE урон оружия: " }, { "score": {"name": "@s", "objective": "aoe_dmg" } } ] }
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§aИсходное качество блока: " }, { "score": {"name": "@s", "objective": "block_power" } } ] }

# Анализ баффов и дебаффов AOE
    execute if entity @s[hasitem={item=arx:durasteel_bracers, location=slot.armor.legs}] run scoreboard players add @s aoe_dmg 5
    execute if entity @s[hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] run scoreboard players add @s aoe_dmg -10

#  Отчёт после баффов
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§bAOE урон оружия после рассчета баффов: " }, { "score": {"name": "@s", "objective": "aoe_dmg" } } ] }
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§bКачество блока после рассчета баффов: " }, { "score": {"name": "@s", "objective": "block_power" } } ] }

# Кинжалы AOE
    # Нет навыка
        execute if entity @s[tag=is_dagger, scores={sk_a_9=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не проводить AOE атаку кинжалом. Для этого требуется навык §aA9" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_dagger, scores={sk_a_9=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы атаковать" } ] }

    # Доступно
        execute if entity @s[tag=is_dagger, scores={sk_a_9=1, attack_weakness=..179}] run playsound knife_use @a ~ ~ ~
        execute if entity @s[tag=is_dagger, tag=!is_moving, scores={sk_a_9=1, attack_weakness=..179}] run playanimation @s animation.special.dagger.a
        execute if entity @s[tag=is_dagger, tag=is_moving, scores={sk_a_9=1, attack_weakness=..179}] run playanimation @s animation.special.dagger.b
        execute if entity @s[tag=is_dagger, scores={sk_a_9=1, attack_weakness=..179}] run scoreboard players add @s blocking 20
        execute if entity @s[tag=is_dagger, scores={sk_a_9=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 60
        execute if entity @s[tag=is_dagger, scores={sk_a_9=1, attack_weakness=..179}] run function attack/deal_aoe_dmg


# Обычные мечи (одноручи) БЛОК
    # Нет навыка
        execute if entity @s[tag=is_default, scores={sk_a_5=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете блокировать обычным мечом. Для этого требуется навык §aA5" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы блокировать" } ] }

    # Доступно
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=..179}] run playanimation @s animation.block.default.a
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=..179}] run scoreboard players add @s blocking 40
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=..179}] run scoreboard players add @s allow_block_buff 20
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 60
        execute if entity @s[tag=is_default, scores={sk_a_5=1, attack_weakness=..179}] run function attack/launch_blocking_effect


# Тяжи БЛОК
    # Нет навыка
        execute if entity @s[tag=is_heavy, scores={sk_b_2=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете блокировать двуручным тяжёлым мечом. Для этого требуется навык §eB2" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы блокировать" } ] }

    # Доступно
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=..179}] run playanimation @s animation.block.heavy.a
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=..179}] run scoreboard players add @s blocking 40
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=..179}] run scoreboard players add @s allow_block_buff 20
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 60
        execute if entity @s[tag=is_heavy, scores={sk_b_2=1, attack_weakness=..179}] run function attack/launch_blocking_effect


# Копья AOE
    # Нет навыка
        execute if entity @s[tag=is_lance, scores={sk_a_10=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете проводить AOE атаку копьем. Для этого требуется навык §aА10" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы атаковать" } ] }

    # Доступно
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=..179}] run playsound knife_use @a ~ ~ ~
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=..179}] run playanimation @s animation.special.lance.a
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=..179}] run scoreboard players add @s blocking 20
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 81
        execute if entity @s[tag=is_lance, scores={sk_a_10=1, attack_weakness=..179}] run function attack/deal_aoe_dmg


# Легкие двуручи AOE
    # Нет навыка
        execute if entity @s[tag=is_longsword, scores={sk_b_2=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете проводить AOE атаку легикием двуручным мечом. Для этого требуется навык §eB2" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы атаковать" } ] }

    # Доступно
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=..179}] run playsound knife_use @a ~ ~ ~
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=..179}] run playanimation @s animation.special.longsword.a
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=..179}] run scoreboard players add @s blocking 30
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 81
        execute if entity @s[tag=is_longsword, scores={sk_b_2=1, attack_weakness=..179}] run function attack/deal_aoe_dmg


# Косы БЛОК
    # Нет навыка
        execute if entity @s[tag=is_scythe, scores={sk_b_14=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете блокировать косой. Для этого требуется навык §eB14" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы блокировать" } ] }

    # Доступно
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=..179}] run playanimation @s animation.block.scythe.a
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=..179}] run scoreboard players add @s blocking 40
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=..179}] run scoreboard players add @s allow_block_buff 20
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 60
        execute if entity @s[tag=is_scythe, scores={sk_b_14=1, attack_weakness=..179}] run function attack/launch_blocking_effect


# Сверхтяжи БЛОК
    # Нет навыка
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=0}] run tellraw @s { "rawtext": [ { "text": "§cВы не умеете блокировать сверхтяжёлым мечом. Для этого требуется навык §cC2" } ] }

    # Слишком высокий кд
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=180..}] run tellraw @s { "rawtext": [ { "text": "§cВы слишком ослаблены, чтобы блокировать" } ] }

    # Доступно
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=..179}] run playanimation @s animation.block.veryheavy.a
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=..179}] run scoreboard players add @s blocking 40
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=..179}] run scoreboard players add @s allow_block_buff 20
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=..179}] run scoreboard players add @s attack_weakness 60
        execute if entity @s[tag=is_very_heavy, scores={sk_c_2=1, attack_weakness=..179}] run function attack/launch_blocking_effect


# Отчет после рассчетов
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Фактическое кол-во тактов (1/20 сек) блокировки атаки: " }, { "score": {"name": "@s", "objective": "blocking" } } ] }
    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "Фактическое кол-во тактов (1/20 сек) ослабления атаки: " }, { "score": {"name": "@s", "objective": "attack_weakness" } } ] }

    tellraw @s[tag=show_full_weapon_data] { "rawtext": [ { "text": "§6=====" } ] }

tag @s remove is_dagger
tag @s remove is_default
tag @s remove is_heavy
tag @s remove is_lance
tag @s remove is_longsword
tag @s remove is_scythe
tag @s remove is_very_heavy

scoreboard players set @s aoe_dmg 0
scoreboard players set @s block_power 0