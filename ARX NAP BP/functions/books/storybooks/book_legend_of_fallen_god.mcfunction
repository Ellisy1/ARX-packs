tellraw @s { "rawtext": [ { "text": "§lЛегенда о падшем боге\n" } ] }
tellraw @s { "rawtext": [ { "text": "В великом мире древнего народа,\nВ мире частых чёрных бед,\nНе все боги были знатного рода,\nКто-то доедал чёрствый хлеб.\n\nОставшись без воли и сил,\nОн долго по миру шатался,\nПока в злые руки не угодил.\nТам же он навсегда и потерялся...\n\nНо и вечную жизнь получил" } ] }

tellraw @s[scores={book_fallen_god=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_fallen_god=0}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_fallen_god=0}] xp_tray 200
scoreboard players set @s book_fallen_god 1