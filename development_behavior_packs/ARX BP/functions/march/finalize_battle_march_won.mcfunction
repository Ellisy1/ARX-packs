# Открытие дверей
    # Деспавним Марта
        event entity @e[type=arx:march] suicide 
    # Внутренняя, только если Март хоть раз был побеждён
        execute if entity @a[scores={verify=2, march_defeated=1}] run fill 61 19 -191 61 21 -192 air
    # Внешняя
        fill 42 19 -191 42 21 -192 air

# Оканчиваем счет времени
    scoreboard players set @a[scores={verify=2}] march_battle_time 0

kill @e[type=arx:march_sitting_calm]

# Вызываем избитого марта
    execute if entity @a[scores={verify=2, march_defeated=1}] run summon arx:march_sitting_calm 52.0 19 -199 facing ~ ~ ~10000000

event entity @e[type=arx:rat_monstr_meca, x=43, y=18, z=-200, dx=17, dy=10, dz=17] despawn