# Табличка блок
# Анализ
    tag @s[hasitem={item=arx:descriptor, location=slot.armor.head}] add descriptor_equipped
    tag @s[scores={battery_charge=200..}] add has_enough_charge

# Недопуск
    tellraw @s[scores={battery_avail=0}] { "rawtext": [ { "text": "§cНа планшетке явно что-то написано, но язык вам абсолюно незнаком." } ] }
    tellraw @s[scores={battery_avail=1}, tag=!descriptor_equipped] { "rawtext": [ { "text": "§cНа планшетке явно что-то написано, но язык вам абсолюно незнаком." } ] }

    tellraw @s[scores={battery_avail=1}, tag=!has_enough_charge, tag=descriptor_equipped] { "rawtext": [ { "text": "§cНедостаточно заряда батарей для расшифровки. Требуется 200§fŐ" } ] }

# Успех
    execute as @s[tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s { "rawtext": [ { "text": "§f[§bПереведено§f>>> §oТермоядерный акселерационный генератор электроэнергии мегабашни Э-19.\nЗапускать допустимо только в случае отключения мегабашни Э-19 от внешней элетросети или в случае разрешения от ЭПКЛА (Электропотребительский контроль Лоф-Аниса). Данный генератор поддерживает функцию трассировка электричества. Допустимо использовать только при разрешении от ЭПКЛА. Трассировка позволяет передавать электричество на большую дистанцию в конкретное место, в котором проблемы с центральным электроснабжением. В случае необходимости ЭПКЛА вышлет URK (универсальный) код для трассировки, который активируется на локальном устройстве.§r§f]" } ] }
    execute as @s[tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s battery_charge -200

# Чистка
    tag @s remove descriptor_equipped
    tag @s remove has_enough_charge