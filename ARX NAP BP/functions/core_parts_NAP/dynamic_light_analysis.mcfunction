# Анализ динамического освещения
    scoreboard players set @a dynamic_light_power 0

    # ЭКИПИРУЕМЫЕ ЛАМПЫ
        # Анализ лапмового масла lamp_oil
            # Полная лампа = 100'000
            # Экономия масла = (50 / потреб. в сек.) * 100%
            # Яркость = макс. ур. светимости / 15 * 100%
            # Установка макс. уровня светимости (5..15), 0 - контрольное значение
                scoreboard players set @a max_light_range 0

                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:belt_lamp, location=slot.armor.legs}] max_light_range 10
                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:brightmouse, location=slot.armor.legs}] max_light_range 14
                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:magilight, location=slot.armor.legs}] max_light_range 9
                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:archilight, location=slot.armor.legs}] max_light_range 15
                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:firefly_belt_lamp, location=slot.armor.legs}] max_light_range 13
                scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:mechanic_belt_lamp, location=slot.armor.legs}] max_light_range 9

            # Дебаг 
                # Отрицательные значения
                    scoreboard players set @a[scores={lamp_oil=..-1}] lamp_oil 0
                # Слишком высокие значения
                    scoreboard players set @a[scores={lamp_oil=100000..}] lamp_oil 100000

            # Высчитываем процент
                execute as @a run scoreboard players operation @s lamp_oil_prc = @s lamp_oil
                execute as @a run scoreboard players operation @s lamp_oil_prc /= @p[scores={verify=2}] const_1000

        function core_parts_NAP/belt_lamps
    
    # ПРЕДМЕТЫ В РУКЕ
        execute as @a[hasitem={item=minecraft:torch, location=slot.weapon.mainhand}] run scoreboard players set @s dynamic_light_power 14
        execute as @a[hasitem={item=minecraft:redstone_torch, location=slot.weapon.mainhand}] run scoreboard players set @s dynamic_light_power 7
        execute as @a[hasitem={item=minecraft:soul_torch, location=slot.weapon.mainhand}] run scoreboard players set @s dynamic_light_power 10
        execute as @a[hasitem={item=minecraft:lantern, location=slot.weapon.mainhand}] run scoreboard players set @s dynamic_light_power 14

    # Сущности
        execute as @e[type=arx:wandering_flame_of_night] run scoreboard players set @s dynamic_light_power 12
        execute as @e[type=arx:wandering_flame_of_mines] run scoreboard players set @s dynamic_light_power 9