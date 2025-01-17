# Март
    execute as @e[type=arx:march, has_property={arx:descent=true}] at @s run tp @s ~ ~0.005 ~

# Скример в Э-19 с мертвой крысой
    execute as @a[x=20, y=18, z=-156, dx=0, dy=3, dz=0.8, tag=!__heard_cherry_rat_jumpscare__] at @s run playsound cherry_rat_jumpscare @s ~ ~ ~ 
    execute as @a[x=20, y=18, z=-156, dx=0, dy=3, dz=0.8, tag=!__heard_cherry_rat_jumpscare__] run effect @s darkness 6 0 true
    execute as @a[x=20, y=18, z=-156, dx=0, dy=3, dz=0.8, tag=!__heard_cherry_rat_jumpscare__] run tag @s add __heard_cherry_rat_jumpscare__

# Скример в Э-19 на входе
    execute as @a[x=19, y=50, z=-155, dx=3, dy=3, dz=0, tag=!__heard_e19_entrance_jumpscare__] at @s run playsound e19_entrance_jumpscare @s ~ ~ ~ 
    execute as @a[x=19, y=50, z=-155, dx=3, dy=3, dz=0, tag=!__heard_e19_entrance_jumpscare__] run tag @s add __heard_e19_entrance_jumpscare__

# Пк в Э-19 в воен части
    # Анализ ПК
        execute if entity @a[x=60, y=18, z=-193, dx=10, dy=4, dz=11] run function core_parts_NAP/march_e19pc_analyse

# URK
    # Настраиваем опции универсального ключа
        tag @a remove urk_remote_controller_mode
        
        tag @a[x=63, y=18, z=-190, dx=4, dy=4, dz=5] add urk_remote_controller_mode
        execute if entity @a[scores={verify=2, hail6_enabled=33..}] run tag @a[x=-37, y=55, z=29, dx=-4, dy=4, dz=5] add urk_remote_controller_mode