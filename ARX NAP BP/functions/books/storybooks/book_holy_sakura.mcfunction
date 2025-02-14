tellraw @s { "rawtext": [ { "text": "§lЛегенда о священной сакуре" } ] }
tellraw @s { "rawtext": [ { "text": "Обретая силу и форму, Паллас пролил слезы, потеряв надежду быть другом Пиреса. На том месте выросла из слез и боли сакура, способная исцелить даже погибшего." } ] }

tellraw @s[scores={book_holy_sakura=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_holy_sakura=0}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_holy_sakura=0}] xp_tray 200
scoreboard players set @s book_holy_sakura 1