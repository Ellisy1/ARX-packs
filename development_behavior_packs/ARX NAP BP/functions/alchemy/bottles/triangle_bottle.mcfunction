tellraw @s[tag=!in_block_water]  { "rawtext": [ { "text": "§eЧтобы наполнить бутылку, придется залезть в воду..." } ] }
clear @s[tag=in_block_water] arx:triangle_bottle 0 1
give @s[tag=in_block_water] arx:triangle_bottle_water