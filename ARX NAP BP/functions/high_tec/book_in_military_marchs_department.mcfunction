# Табличка блок
# Анализ
    tag @s[hasitem={item=arx:descriptor, location=slot.armor.head}] add descriptor_equipped
    tag @s[scores={battery_charge=200..}] add has_enough_charge

# Недопуск
    tellraw @s[scores={battery_avail=0}] { "rawtext": [ { "text": "§cВ книге явно что-то написано, но язык вам абсолюно незнаком." } ] }
    tellraw @s[scores={battery_avail=1}, tag=!descriptor_equipped] { "rawtext": [ { "text": "§cВ книге явно что-то написано, но язык вам абсолюно незнаком." } ] }

    tellraw @s[scores={battery_avail=1}, tag=!has_enough_charge, tag=descriptor_equipped] { "rawtext": [ { "text": "§cНедостаточно заряда батарей для расшифровки. Требуется 200§fŐ" } ] }

# Успех
    execute as @s[tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s { "rawtext": [ { "text": "§f[§bПереведено§f>>> §oЖурнал E-19 22-12-03. Поступило требование от ЭПКЛА активировать трассировку электричества в радиорадар Оклик-6. Согласно заявлению, произошла авария на линии электропередач, и трассировка является необходимой. Предоставленный код для активации трассировки URK-F48DC3DBC. Трассировка была успешно запущена и отключена спустя 1 час 46 минут по требованию ЭПКЛА.§r§f]" } ] }
    execute as @s[tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s battery_charge -200

# Чистка
    tag @s remove descriptor_equipped
    tag @s remove has_enough_charge