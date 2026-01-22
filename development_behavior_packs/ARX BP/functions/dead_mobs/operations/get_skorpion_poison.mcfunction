# Этот код управляет взятием яда скорпиона в банку с трупа моба

tag @s[hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @s[scores={gender=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли ядом скорпиона, если бы они у меня были." } ] }
    tellraw @s[scores={gender=2}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли ядом скорпиона, если бы они у меня были." } ] }
    give @s[tag=has_bottle_for_blood] arx:skorpion_poison
    clear @s[tag=has_bottle_for_blood] arx:bottle_for_blood 0 1

tag @s remove has_bottle_for_blood