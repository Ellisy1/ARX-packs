execute as @s[scores={custom_random=..950}] at @s run function wands/wand_default

execute as @s[scores={custom_random=951..}] at @s run playsound random.break @a ~ ~ ~
execute as @s[scores={custom_random=951..}] at @s run replaceitem entity @s slot.weapon.mainhand 0 arx:wand_wooden_broken
execute as @s[scores={custom_random=951..}] at @s run damage @s 1 fire