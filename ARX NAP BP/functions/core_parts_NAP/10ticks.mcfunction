
# Анализ эффектов - 10tcs
    function core_parts_NAP/effects_analisys/10tick

# Урон истрибитора
    execute as @e[type=arx:gasgolder_istribitor] at @s run damage @a[r=3.2, has_property={arx:is_knocked=false}] 4
    execute as @e[type=arx:gasgolder_istribitor] at @s run damage @e[r=3, type=horse] 4

# Звук от магического рывка
    execute at @a[scores={tp_cd=1..}] run playsound magic_dash @a ~ ~1.3 ~

# Партиклы от деражщих факел
    execute at @a[hasitem={item=minecraft:torch, location=slot.weapon.mainhand}] positioned ~ ~1.9 ~ run particle minecraft:basic_smoke_particle ^-0.3 ^0 ^0.4