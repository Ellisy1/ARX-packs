tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "§lЛегенда о падшем боге\n" } ] }
tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "В великом мире древнего народа,\nВ мире частых чёрных бед,\nНе все боги были знатного рода,\nКто-то доедал чёрствый хлеб.\n\nОставшись без воли и сил,\nОн долго по миру шатался,\nПока в злые руки не угодил.\nТам же он навсегда и потерялся...\n\nНо и вечную жизнь получил" } ] }

tellraw @s[scores={book_fallen_god=1, sk_a_26=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_fallen_god=0, sk_a_26=1}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_fallen_god=0, sk_a_26=1}] xp_tray 250
scoreboard players set @s[scores={sk_a_26=1}] book_fallen_god 1