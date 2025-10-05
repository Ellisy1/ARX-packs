# Анализ освещения от сущностей
    
    scoreboard players set @a dynamic_light_power 0

    # Предметы в руке
        execute as @a[hasitem={item=minecraft:torch, location=slot.weapon.mainhand}] run scoreboard players add @s dynamic_light_power 14
        execute as @a[hasitem={item=minecraft:redstone_torch, location=slot.weapon.mainhand}] run scoreboard players add @s dynamic_light_power 7
        execute as @a[hasitem={item=minecraft:soul_torch, location=slot.weapon.mainhand}] run scoreboard players add @s dynamic_light_power 12
        execute as @a[hasitem={item=minecraft:copper_torch, location=slot.weapon.mainhand}] run scoreboard players add @s dynamic_light_power 12
        execute as @a[hasitem={item=minecraft:lantern, location=slot.weapon.mainhand}] run scoreboard players add @s dynamic_light_power 14

    # Надетые предметы
        execute as @a[hasitem={item=arx:belt_lamp, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 10
        execute as @a[hasitem={item=arx:brightmouse, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 14
        execute as @a[hasitem={item=arx:magilight, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 9
        execute as @a[hasitem={item=arx:archilight, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 15
        execute as @a[hasitem={item=arx:firefly_belt_lamp, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 14
        execute as @a[hasitem={item=arx:mechanic_belt_lamp, location=slot.armor.legs}] run scoreboard players add @s dynamic_light_power 9

    # Сущности
        execute as @e[type=arx:wandering_flame_of_night] run scoreboard players set @s dynamic_light_power 12
        execute as @e[type=arx:wandering_flame_of_mines] run scoreboard players set @s dynamic_light_power 9