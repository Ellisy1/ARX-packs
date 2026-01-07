# Этот код управляет взятием крови в банку с трупа моба

tag @s[hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @s[scores={gender=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§d§l[!]§r§e Я бы мог наполнить бутыли кровью, если бы они у меня были." } ] }
    tellraw @s[scores={gender=2}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§d§l[!]§r§e Я бы могла наполнить бутыли кровью, если бы они у меня были." } ] }
    give @s[tag=has_bottle_for_blood] arx:bottle_of_blood
    clear @s[tag=has_bottle_for_blood] arx:bottle_for_blood 0 1

tag @s remove has_bottle_for_blood