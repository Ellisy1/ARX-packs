# old execute syntaxis

# Чарим кандалы
    enchant @a[hasitem={item=arx:shackles, location=slot.weapon.mainhand}] binding 1

# Партиклы при превращении крысы-призрака в теру
    execute @e[type=arx:rat_ghost_to_eliminator] ~ ~ ~ particle arx:rat_ghost_despawn ~ ~1.5 ~

# Увеличиваем урон если надет амулет порочного демона
    event entity @a arx:set_0_base_dmg
    execute @a[hasitem={item=arx:amul_essence_of_vicious_demon, location=slot.armor.legs}] ~ ~ ~ event entity @s arx:set_5_base_dmg