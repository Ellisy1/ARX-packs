# Эта функция включает или выключает полный отчет о характеристиках еды. Тег show_full_food_data

# Определяем контрольный тег
    execute if entity @s[tag=show_full_food_data] run tag @s add control

# Если тег уже есть
    execute if entity @s[tag=control] run tellraw @s { "rawtext": [ { "text": "Режим полного отображения характеристик еды §cвыключен§f." } ] }
    execute if entity @s[tag=control] run tag @s remove show_full_food_data

# Если тега нет
    execute if entity @s[tag=!control] run tellraw @s { "rawtext": [ { "text": "Режим полного отображения характеристик еды §aвключен§f. Скушайте еду чтобы получить отчёт о её характеристиках." } ] }
    execute if entity @s[tag=!control] run tag @s add show_full_food_data

# Чистим 
    tag @s remove control