tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "§lЛегенда о священной сакуре" } ] }
tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "Обретая силу и форму, Паллас пролил слезы, потеряв надежду быть другом Пиреса. На том месте выросла из слез и боли сакура, способная исцелить даже погибшего." } ] }

tellraw @s[scores={book_holy_sakura=1, sk_a_26=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_holy_sakura=0, sk_a_26=1}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_holy_sakura=0, sk_a_26=1}] xp_tray 250
scoreboard players set @s[scores={sk_a_26=1}] book_holy_sakura 1