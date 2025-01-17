# Эта функция запускается авторматически пороным демоном

# Тест хп
    event entity @s test_hp

# Юзаем атаку магией на 50 - 100
    execute if entity @s[tag=hp_0_to_25] if entity @a[scores={verify=2, custom_random=0..500}] run event entity @s cast_default_damage_spell
    execute if entity @s[tag=hp_25_tp_50] if entity @a[scores={verify=2, custom_random=0..250}] run event entity @s cast_default_damage_spell
    execute if entity @s[tag=hp_50_to_75] if entity @a[scores={verify=2, custom_random=0..100}] run event entity @s cast_default_damage_spell
    execute if entity @s[tag=hp_75_to_100] if entity @a[scores={verify=2, custom_random=0..50}] run event entity @s cast_default_damage_spell

# Если 0% - 25%
    execute if entity @s[tag=hp_0_to_25] if entity @a[scores={verify=2, custom_random=0..333}] run event entity @s start_spin
    execute if entity @s[tag=hp_0_to_25] if entity @a[scores={verify=2, custom_random=334..1000}] run event entity @s start_agressive_rush

# Если 25% - 50%
    execute if entity @s[tag=hp_25_tp_50] if entity @a[scores={verify=2, custom_random=0..666}] run event entity @s start_spin
    execute if entity @s[tag=hp_25_tp_50] if entity @a[scores={verify=2, custom_random=667..1000}] run event entity @s start_rush

# Если 50% - 75%
    execute if entity @s[tag=hp_50_to_75] if entity @a[scores={verify=2, custom_random=0..333}] run event entity @s start_spin
    execute if entity @s[tag=hp_50_to_75] if entity @a[scores={verify=2, custom_random=334..1000}] run event entity @s start_rush

# Если 75% - 100%
    execute if entity @s[tag=hp_75_to_100] run event entity @s start_rush