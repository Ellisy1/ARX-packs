# Табличка блок
# Анализ
    tag @s[hasitem={item=arx:descriptor, location=slot.armor.head}] add descriptor_equipped
    tag @s[scores={battery_charge=200..}] add has_enough_charge

# Недопуск
    tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=0}] { "rawtext": [ { "text": "§cНа планшетке явно что-то написано, но язык вам абсолюно незнаком." } ] }
    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!descriptor_equipped] { "rawtext": [ { "text": "§cНа планшетке явно что-то написано, но язык вам абсолюно незнаком." } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!has_enough_charge, tag=descriptor_equipped] { "rawtext": [ { "text": "§cНедостаточно заряда батарей для расшифровки. Требуется 200§fŐ" } ] }

# Успех
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s { "rawtext": [ { "text": "§f[§bПереведено§f>>> §oЗаказ NC-447291\nЗаказчик: Научный центр НГЦЭ Элитеи\nИсполнитель: <Магазин Электроники>, Элитея, Лоф-Анис, ул. Банкерхилл, 12\nИзготовление чипов неразглашаемых видов: военный чип, 320 штук. Чертёж в зашифрованномом виде передан исполнителю. Заказ должен быть готов в течении 3 суток\nURK код для проведения проверки в случае невыполнения: 9-8-2-2-1-D-A-8-1-2-4§r§f]" } ] }
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] battery_charge -200

# Чистка
    tag @s remove descriptor_equipped
    tag @s remove has_enough_charge