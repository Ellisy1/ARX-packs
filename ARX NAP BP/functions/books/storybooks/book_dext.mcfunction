tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "§lЛегенда о Дексте" } ] }
tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "Жил великий лучник Декст. Был он эльфом без рода и знамени. Спасал он людей от бед, оставаясь незримым. Он был единственным, кто владел и луком, и волшебством идеально. Используя чары невидимости, он поражал своих врагов стрелами, оставаясь так и не замеченным. Как он появился, так и пропал. Говорят, что он случайно убил себя, изучая опасные заклинания с руной din." } ] }

tellraw @s[scores={book_dext=1, sk_a_26=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_dext=0, sk_a_26=1}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_dext=0, sk_a_26=1}] xp_tray 250
scoreboard players set @s[scores={sk_a_26=1}] book_dext 1