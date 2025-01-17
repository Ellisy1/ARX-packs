# Эта функция включает или выключает полный отчет о характеристиках оружия. Тег show_full_weapon_data

# Определяем контрольный тег
    execute if entity @s[tag=show_full_weapon_data] run tag @s add control

# Если тег уже есть
    execute if entity @s[tag=control] run tellraw @s { "rawtext": [ { "text": "Режим полного отображения характеристик оружия §cвыключен§f." } ] }
    execute if entity @s[tag=control] run tag @s remove show_full_weapon_data

# Если тега нет
    execute if entity @s[tag=!control] run tellraw @s { "rawtext": [ { "text": "Режим полного отображения характеристик оружия §aвключен§f. Атакуйте или используйте ПКМ-действие оружия, чтобы увидеть информацию о нём." } ] }
    execute if entity @s[tag=!control] run tag @s add show_full_weapon_data

# Чистим 
    tag @s remove control