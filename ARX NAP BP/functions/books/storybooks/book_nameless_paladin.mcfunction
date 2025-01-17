tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§cЯ не умею читать" } ] }

tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "§lЛегенда о безымянном паладине" } ] }
tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "Человек, отдавший себя свету, использующий меч в одной руке и руну в другой. В один вечер на такого паладина напали силы тьмы. Используя набор трёх рун, он даровал себе защиту, исходящую от самого солнца. И сразил он тварей без промедления." } ] }

tellraw @s[scores={book_namel_pal=1, sk_a_26=1}] { "rawtext": [ { "text": "§6Я это уже знаю" } ] }
tellraw @s[scores={book_namel_pal=0, sk_a_26=1}] { "rawtext": [ { "text": "§aИнтересная книга!" } ] }
scoreboard players add @s[scores={book_namel_pal=0, sk_a_26=1}] xp_tray 250
scoreboard players set @s[scores={sk_a_26=1}] book_namel_pal 1