execute if entity @s[scores={block_power=..0}] run w @s §4Ошибка входных данных. block_power <  1

execute if entity @s[scores={block_power=1}] run effect @s resistance 2 0 true
execute if entity @s[scores={block_power=2}] run effect @s resistance 2 1 true
execute if entity @s[scores={block_power=3}] run effect @s resistance 2 2 true
execute if entity @s[scores={block_power=4}] run effect @s resistance 2 3 true
execute if entity @s[scores={block_power=5}] run effect @s resistance 2 4 true

execute if entity @s[scores={block_power=6..}] run w @s §4Ошибка входных данных. block_power > 5