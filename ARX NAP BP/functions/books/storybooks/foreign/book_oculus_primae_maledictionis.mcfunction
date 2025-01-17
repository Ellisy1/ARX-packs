# Иностранная книга
# Анализ
    tag @s[hasitem={item=arx:descriptor, location=slot.armor.head}] add descriptor_equipped
    tag @s[scores={battery_charge=200..}] add has_enough_charge

# Недопуск
    tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=0}] { "rawtext": [ { "text": "§cЯ не понимаю язык, на котором написана эта книга. Чтобы прочитать её, мне надо найти способ перевода." } ] }
    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!descriptor_equipped] { "rawtext": [ { "text": "§cЯ не понимаю язык, на котором написана эта книга. Чтобы прочитать её, мне надо найти способ перевода." } ] }

    tellraw @s[scores={sk_a_26=1, battery_avail=1}, tag=!has_enough_charge, tag=descriptor_equipped] { "rawtext": [ { "text": "§cНедостаточно заряда батарей для расшифровки. Требуется 200§fŐ" } ] }

# Успех
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s { "rawtext": [ { "text": "§f[§bПереведено§f>>> §oРуна Affuono, она же - сердце проклятия. Она не принадлежит никому, и в то же время принадлежит всем. Сложнейшие заклинания, обрекающие неповинные души извечно страдать и мучаться - её предназначение. Только истинный некромант сможет воспрозоваться ей с умом.§r§f]" } ] }
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] battery_charge -200
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s[scores={book_oculus_primae_maledictionis=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run tellraw @s[scores={book_oculus_primae_maledictionis=0}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players add @s[scores={book_oculus_primae_maledictionis=0}] xp_tray 250
    execute as @s[scores={sk_a_26=1}, tag=has_enough_charge, tag=descriptor_equipped] run scoreboard players set @s book_oculus_primae_maledictionis 1

# Чистка
    tag @s remove descriptor_equipped
    tag @s remove has_enough_charge