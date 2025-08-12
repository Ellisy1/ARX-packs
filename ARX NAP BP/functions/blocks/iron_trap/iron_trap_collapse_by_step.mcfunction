# Срабатывание капкана. Запускается через js
    fill ~ ~ ~ ~ ~ ~ arx:iron_trap_collapsed
    effect @e[type=!item, r=1] slowness 5 255 true
    damage @e[type=!item, r=1] 15 contact
    scoreboard players set @a[r=1] ill_broken_leg 72000
    playsound random.anvil_land @a ~ ~ ~