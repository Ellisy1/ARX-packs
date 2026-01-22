# Делаем энивей
    fill -204 34 337 -204 36 335 arx:bronze_block
    fill -191 56 336 -191 56 336 verdant_froglight

# Проверяем, идет ли уже бой
    execute as @a[scores={verify=2, vicious_demon=0}] run tag @s add allow
    execute as @a[scores={verify=2, vicious_demon=1..}] run tag @s add deny

# Если бой ещё не идет
    scoreboard players set @a[scores={verify=2}, tag=allow] vicious_demon 1
    execute if entity @a[scores={verify=2}, tag=allow] run effect @a[x=-204, y=33, z=324, dx=25, dy=5, dz=25] darkness 5 0 true
    execute as @p[scores={verify=2}, tag=allow] run tellraw @p { "rawtext": [ { "text": "§aВы бросаете вызов демону!" } ] }
    
# Если бой уже идет 
    execute as @p[scores={verify=2}, tag=deny] run tellraw @p { "rawtext": [ { "text": "§cВы уже сражаетесь с демоном!" } ] }

# Очищаем
    tag @a[scores={verify=2}] remove allow
    tag @a[scores={verify=2}] remove deny