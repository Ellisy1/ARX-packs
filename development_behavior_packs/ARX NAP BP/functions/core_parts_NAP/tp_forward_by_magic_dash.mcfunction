# Телепортация вперед от заклинаний
    # Чистка тегов с прошлой итерации
        tag @a remove affirm_tp_forward
        tag @a remove affirm_tp_forward_bottom_block
        tag @a remove affirm_tp_forward_upper_block

    # Теговый анализ окружения
        execute as @a at @s if block ~ ~ ~ minecraft:air run tag @s add affirm_tp_forward_bottom_block
        execute as @a at @s if block ~ ~ ~ minecraft:tallgrass run tag @s add affirm_tp_forward_bottom_block
        execute as @a at @s if block ~ ~ ~ minecraft:web run tag @s add affirm_tp_forward_bottom_block
        execute as @a at @s if block ~ ~ ~ minecraft:ladder run tag @s add affirm_tp_forward_bottom_block

        execute as @a at @s if block ~ ~1 ~ minecraft:air run tag @s add affirm_tp_forward_upper_block
        execute as @a at @s if block ~ ~1 ~ minecraft:tallgrass run tag @s add affirm_tp_forward_upper_block
        execute as @a at @s if block ~ ~1 ~ minecraft:web run tag @s add affirm_tp_forward_upper_block
        execute as @a at @s if block ~ ~1 ~ minecraft:ladder run tag @s add affirm_tp_forward_upper_block

        tag @a[tag=affirm_tp_forward_bottom_block, tag=affirm_tp_forward_upper_block] add affirm_tp_forward

    # Телепортируемся вперед
        execute as @a[scores={tp_cd=1..}, tag=affirm_tp_forward] at @s run tp ^ ^ ^1
        execute as @a[scores={tp_cd=1..}, tag=affirm_tp_forward, tag=!disable_magic_of_modified_moving] run effect @s slow_falling 1 0 true
        execute at @a[scores={tp_cd=1.., tp_cd_ghost=..1}, tag=!disable_magic_of_modified_moving] run particle arx:magic_dash ~ ~1 ~ 
        execute as @a[scores={tp_cd=1..}, tag=!disable_magic_of_modified_moving] run playanimation @s animation.player.magic_dash
        execute as @a[scores={tp_cd_ghost=1..}, tag=!disable_magic_of_modified_moving] run playanimation @s animation.player.ghost_magic_dash_arm_fix

    # Оканчиваем рывок, если столкнулись с чем-то
        execute as @a[scores={tp_cd=1..}, tag=!affirm_tp_forward] run tellraw @s { "rawtext": [ { "text": "§cРывок прерван из-за столкновения" } ] }
        execute as @a[scores={tp_cd=1..}, tag=!affirm_tp_forward] at @s run tp ^ ^ ^-1.5
        execute as @a[scores={tp_cd=1..}, tag=!affirm_tp_forward] run scoreboard players set @s tp_cd_ghost 0
        execute as @a[scores={tp_cd=1..}, tag=!affirm_tp_forward] run scoreboard players set @s tp_cd 0
    
    # Оканчиваем рывок, если шифтимся
        execute as @a[scores={tp_cd=1..}, tag=is_sneaking] run tellraw @s { "rawtext": [ { "text": "§cРывок прерван вручную" } ] }
        execute as @a[scores={tp_cd=1..}, tag=is_sneaking] at @s run tp ^ ^ ^-1
        execute as @a[scores={tp_cd=1..}, tag=is_sneaking] run scoreboard players set @s tp_cd_ghost 0
        execute as @a[scores={tp_cd=1..}, tag=is_sneaking] run scoreboard players set @s tp_cd 0

    # Оканчиваем рывок, если идет блокировка от блока запретителя
        execute as @a[scores={tp_cd=1..}, tag=disable_magic_of_modified_moving] run tellraw @s { "rawtext": [ { "text": "§cЧто-то прервало ваш рывок..." } ] }
        execute as @a[scores={tp_cd=1..}, tag=disable_magic_of_modified_moving] at @s run tp ^ ^ ^-1
        execute as @a[scores={tp_cd=1..}, tag=disable_magic_of_modified_moving] run scoreboard players set @s tp_cd_ghost 0
        execute as @a[scores={tp_cd=1..}, tag=disable_magic_of_modified_moving] run scoreboard players set @s tp_cd 0

    # Уменьшаем откат
        scoreboard players add @a[scores={tp_cd=1..}] tp_cd -1
        scoreboard players add @a[scores={tp_cd_ghost=1..}] tp_cd_ghost -1