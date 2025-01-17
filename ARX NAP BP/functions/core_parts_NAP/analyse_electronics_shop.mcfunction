# Спадание заправки генератора в магазине электроники + его шум + частицы
    scoreboard players add @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] generator_in_electronics_shop_cd -1
    execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] run playsound generator_noise @a -159 59 137
    execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] run particle arx:generator -159 59 137 

# Печать, если у нас есть работающий генератор (generator_in_electronics_shop_cd = 1..)
    # Проброс переменной, определяющей интервалы для печати (printer_in_electrinics_shop_cycle)
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] run scoreboard players add @a[scores={verify=2}] printer_in_electrinics_shop_cycle 1
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] run scoreboard players set @a[scores={verify=2, printer_in_electrinics_shop_cycle=5..}] printer_in_electrinics_shop_cycle 0

    # Устанавливаем блоки
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing9 run loot spawn -159 60 138 loot "custom/printer_in_electronics_shop_ready_blueprint"
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing9 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing9 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing8 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing8 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing9
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing7 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing7 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing8
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing6 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing6 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing7
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing5 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing5 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing6
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing4 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing4 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing5
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing3 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing3 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing4
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing2 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing2 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing3
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing1 run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_printing1 run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing2
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_with_paper run playsound printer @a -159 60 138
        execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1.., printer_in_electrinics_shop_cycle=2}] if block -159 60 138 arx:printer_in_electronics_shop_with_paper run fill -159 60 138 -159 60 138 arx:printer_in_electronics_shop_printing1

# Ставим нужный ноут
    execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=1..}] run fill -159 60 139 -159 60 139 arx:laptop_in_electronics_shop_enabled
    execute if entity @a[scores={verify=2, generator_in_electronics_shop_cd=0}] run fill -159 60 139 -159 60 139 arx:laptop_in_electronics_shop_disabled