# Эта функция запускается авторматически пороным демоном

# Юзаем атаку магией на 50 - 100
    execute if entity @s[has_property={arx:hp=0}] if entity @a[scores={verify=2, custom_random=0..500}] run event entity @s cast_default_damage_spell
    execute if entity @s[has_property={arx:hp=1}] if entity @a[scores={verify=2, custom_random=0..250}] run event entity @s cast_default_damage_spell
    execute if entity @s[has_property={arx:hp=2}] if entity @a[scores={verify=2, custom_random=0..100}] run event entity @s cast_default_damage_spell
    execute if entity @s[has_property={arx:hp=3}] if entity @a[scores={verify=2, custom_random=0..50}] run event entity @s cast_default_damage_spell

# Если 0% - 25%
    execute if entity @s[has_property={arx:hp=0}] if entity @a[scores={verify=2, custom_random=0..333}] run event entity @s start_spin
    execute if entity @s[has_property={arx:hp=0}] if entity @a[scores={verify=2, custom_random=334..1000}] run event entity @s start_agressive_rush

# Если 25% - 50%
    execute if entity @s[has_property={arx:hp=1}] if entity @a[scores={verify=2, custom_random=0..666}] run event entity @s start_spin
    execute if entity @s[has_property={arx:hp=1}] if entity @a[scores={verify=2, custom_random=667..1000}] run event entity @s start_rush

# Если 50% - 75%
    execute if entity @s[has_property={arx:hp=2}] if entity @a[scores={verify=2, custom_random=0..333}] run event entity @s start_spin
    execute if entity @s[has_property={arx:hp=2}] if entity @a[scores={verify=2, custom_random=334..1000}] run event entity @s start_rush

# Если 75% - 100%
    execute if entity @s[has_property={arx:hp=3}] run event entity @s start_rush