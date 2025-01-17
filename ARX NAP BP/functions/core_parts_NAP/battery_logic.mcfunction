# ЗАРЯД БАТАРЕЙ

# Эта функция запускается логически + позиционно от каждого игрока, который открыл доступность батарей (score battery_avail=1) 1 раз в секунду

# Определение переменных scores:
    # battery_max - максимально возможный заряд, который суммируется из всех надетых зарядных устройств
    # battery_max_log - предыдущее значение battery_max (с прошлой обработки)
    # battery_charge - фактический заряд батарей
    # battery_charg_lg - предыдущее значение фактического заряда батарей (с прошлой обработки)

# Начальный дебаг
    # Если максимальный объём батрей меньше текущего заряда (логически не может быть), приравниваем заряд к макс. объёму батарей
        execute if score @s battery_max < @s battery_charge run scoreboard players operation @s battery_charge = @s battery_max 

# Вычисляем максимальный доступный заряд battery_max. Больше 3 одинаковых батарей носить невозможно: их просто нельзя продключить вместе.
    scoreboard players operation @s battery_max_log = @s battery_max
    scoreboard players set @s battery_max 0
    scoreboard players add @s[hasitem={item=arx:battery_small, quantity=1}] battery_max 500
    scoreboard players add @s[hasitem={item=arx:battery_small, quantity=2}] battery_max 1000
    scoreboard players add @s[hasitem={item=arx:battery_small, quantity=3..}] battery_max 1500
    scoreboard players add @s[hasitem={item=arx:battery_large, quantity=1}] battery_max 1000
    scoreboard players add @s[hasitem={item=arx:battery_large, quantity=2}] battery_max 2000
    scoreboard players add @s[hasitem={item=arx:battery_large, quantity=3..}] battery_max 3000
    scoreboard players add @s[hasitem={item=arx:battery_ultra, quantity=1}] battery_max 2000
    scoreboard players add @s[hasitem={item=arx:battery_ultra, quantity=2}] battery_max 4000
    scoreboard players add @s[hasitem={item=arx:battery_ultra, quantity=3..}] battery_max 6000
    scoreboard players add @s[hasitem={item=arx:battery_homemade, quantity=1}] battery_max 10
    scoreboard players add @s[hasitem={item=arx:battery_homemade, quantity=2}] battery_max 20
    scoreboard players add @s[hasitem={item=arx:battery_homemade, quantity=3..}] battery_max 30

    #Выводим изменение объёма батарей
        execute if score @s battery_max_log > @s battery_max run tellraw @s { "rawtext": [ { "text": "§cОбъём батарей уменьшился, теперь §f" }, { "score": {"name": "@s", "objective": "battery_max" } }, { "text": "Ő" } ] } 
        execute if score @s battery_max_log < @s battery_max run tellraw @s { "rawtext": [ { "text": "§aОбъём батарей увеличился, теперь §f" }, { "score": {"name": "@s", "objective": "battery_max" } }, { "text": "Ő" } ] } 

# Выводим сообщения и звуки (о динамике заряда)
    # Уведомления об обычной динамике заряда. Так же проверяется, чтобы он не был пограничным с минимальным и максимальным зарядом, т.к. там уже надо выводить другие сообщения
        # Падение
            execute if score @s battery_charg_lg > @s battery_charge if score @s battery_charge > @p[scores={verify=2}] const_0 run title @s actionbar §cЗаряд батарей падает
        # Рост
            execute if score @s battery_charg_lg < @s battery_charge if score @s battery_charge < @s battery_max run title @s actionbar §aЗаряд батарей растёт

    # Уведомления о динамике заряда на минимальном и максимальном значении заряда
        # Упал до минимального
            execute if score @s battery_charg_lg > @s battery_charge if score @s battery_charge = @p[scores={verify=2}] const_0 run title @s actionbar §4Батареи полностью разряжены
            execute if score @s battery_charg_lg > @s battery_charge if score @s battery_charge = @p[scores={verify=2}] const_0 run playsound battery_discharging @a ~ ~ ~ 

        # Поднялся до максимального
            execute if score @s battery_charg_lg < @s battery_charge if score @s battery_charge = @s battery_max run tellraw @s { "rawtext": [ { "text": "§2Батареи полностью заряжены §f(" }, { "score": {"name": "@s", "objective": "battery_charge" } }, { "text": "Ő)" } ] }

# Взаимодействие с потребляющими энергию предметами
    # ! Основным значением для работы электрических устройств будет battery_charge, т.к. она отражает фактический заряд, что по сути является самым важным.
    #Вычисляем
        scoreboard players add @s[tag=!is_sneaking, hasitem={item=arx:night_vision_device, location=slot.armor.head}, scores={battery_charge=1..}] battery_charge -1
        scoreboard players add @s[tag=is_sneaking, hasitem={item=arx:night_vision_device, location=slot.armor.head}, scores={battery_charge=1..}] battery_charge -5

    #Если не хватает энергии
        execute if score @s battery_charge < @p[scores={verify=2}] const_0 run title @s actionbar §4§lБатареи полностью разряжены

# Определяем журнальную переменную battery_charg_lg
    scoreboard players operation @s battery_charg_lg = @s battery_charge

# Дебаг
    # Если максимальный объём батрей меньше текущего заряда (логически не может быть), приравниваем заряд к макс. объёму батарей
        execute if score @s battery_max < @s battery_charge run scoreboard players operation @s battery_charge = @s battery_max 

    #Если заряд улетел в минус
        scoreboard players set @s[scores={battery_charge=..-1}] battery_charge 0