tag @s add self
execute if entity @s[scores={aoe_dmg=..0}] run tellraw @s { "rawtext": [ { "text": "§4Текущий AOE урон не совпадает с границами ожидаемого. Обратитесь к модератору." } ] }
execute if entity @s[scores={aoe_dmg=1}] run damage @e[tag=!self, r=4, type=!item] 1 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=2}] run damage @e[tag=!self, r=4, type=!item] 2 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=3}] run damage @e[tag=!self, r=4, type=!item] 3 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=4}] run damage @e[tag=!self, r=4, type=!item] 4 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=5}] run damage @e[tag=!self, r=4, type=!item] 5 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=6}] run damage @e[tag=!self, r=4, type=!item] 6 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=7}] run damage @e[tag=!self, r=4, type=!item] 7 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=8}] run damage @e[tag=!self, r=4, type=!item] 8 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=9}] run damage @e[tag=!self, r=4, type=!item] 9 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=10}] run damage @e[tag=!self, r=4, type=!item] 10 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=11}] run damage @e[tag=!self, r=4, type=!item] 11 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=12}] run damage @e[tag=!self, r=4, type=!item] 12 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=13}] run damage @e[tag=!self, r=4, type=!item] 13 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=14}] run damage @e[tag=!self, r=4, type=!item] 14 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=15}] run damage @e[tag=!self, r=4, type=!item] 15 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=16}] run damage @e[tag=!self, r=4, type=!item] 16 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=17}] run damage @e[tag=!self, r=4, type=!item] 17 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=18}] run damage @e[tag=!self, r=4, type=!item] 18 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=19}] run damage @e[tag=!self, r=4, type=!item] 19 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=20}] run damage @e[tag=!self, r=4, type=!item] 20 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=21}] run damage @e[tag=!self, r=4, type=!item] 21 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=22}] run damage @e[tag=!self, r=4, type=!item] 22 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=23}] run damage @e[tag=!self, r=4, type=!item] 23 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=24}] run damage @e[tag=!self, r=4, type=!item] 24 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=25}] run damage @e[tag=!self, r=4, type=!item] 25 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=26}] run damage @e[tag=!self, r=4, type=!item] 26 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=27}] run damage @e[tag=!self, r=4, type=!item] 27 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=28}] run damage @e[tag=!self, r=4, type=!item] 28 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=29}] run damage @e[tag=!self, r=4, type=!item] 29 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=30}] run damage @e[tag=!self, r=4, type=!item] 30 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=31}] run damage @e[tag=!self, r=4, type=!item] 31 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=32}] run damage @e[tag=!self, r=4, type=!item] 32 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=33}] run damage @e[tag=!self, r=4, type=!item] 33 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=34}] run damage @e[tag=!self, r=4, type=!item] 34 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=35}] run damage @e[tag=!self, r=4, type=!item] 35 entity_attack entity @s 
execute if entity @s[scores={aoe_dmg=36}] run damage @e[tag=!self, r=4, type=!item] 36 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=37}] run damage @e[tag=!self, r=4, type=!item] 37 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=38}] run damage @e[tag=!self, r=4, type=!item] 38 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=39}] run damage @e[tag=!self, r=4, type=!item] 39 entity_attack entity @s
execute if entity @s[scores={aoe_dmg=40..}] run tellraw @s { "rawtext": [ { "text": "§4Текущий AOE урон превышает программно возможный (39). Обратитесь к модератору." } ] }
tag @s remove self