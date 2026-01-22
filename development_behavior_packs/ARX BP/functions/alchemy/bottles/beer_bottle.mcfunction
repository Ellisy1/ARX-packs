tellraw @s[tag=!in_block_water]  { "rawtext": [ { "text": "§eЧтобы наполнить бутылку, придется залезть в воду..." } ] }
clear @s[tag=in_block_water] arx:beer_bottle 0 1
give @s[tag=in_block_water] arx:beer_bottle_water