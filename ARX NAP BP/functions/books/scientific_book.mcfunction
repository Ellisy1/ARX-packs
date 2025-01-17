tellraw @s[scores={sk_a_26=0}] { "rawtext": [ { "text": "§сЯ не умею читать" } ] }

tellraw @s[scores={sk_a_26=1}] { "rawtext": [ { "text": "§aВы внимательно читаете научную книгу" } ] }
clear @s[scores={sk_a_26=1}] arx:scientific_book 0 1
give @s[scores={sk_a_26=1}] arx:scientific_book_unused
xp 236 @s[scores={sk_a_26=1}]