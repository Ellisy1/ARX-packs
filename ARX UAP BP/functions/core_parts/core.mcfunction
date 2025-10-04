#Дебаг двух игроков на одной позиции (ИМЕЕТ СМЫСЛ, ПОКА ОСТАЛСЯ ПОЗ. КОД)
    scoreboard players set @a check_one_point 0
    execute @a ~ ~ ~ scoreboard players add @a[r=0.0001] check_one_point 1
    execute @a[scores={check_one_point=2..}] ~ ~ ~ function core_parts/debugtp

#Просчёт тактов от лица хостера со счётом verify = 2
    execute @a[scores={verify=2}] ~ ~ ~ scoreboard players add @s tick 1
    execute @a[scores={verify=2, tick=21}] ~ ~ ~ scoreboard players set @s tick 1
    execute @a[tag=test, scores={tick=20}] ~ ~ ~ tellraw @s { "rawtext": [ { "score": {"name": "@s", "objective": "sec" } } ] }

#Просчёт секунд, минут и часов, базируясь на тактах
    execute @a[scores={verify=2, tick=20}] ~ ~ ~ scoreboard players add @s sec 1
    execute @a[scores={verify=2, tick=20, sec=61..}] ~ ~ ~ scoreboard players set @s sec 1

#Рандом
    scoreboard players random @a custom_random 0 1000
    scoreboard players random @a custom_random_b 0 1000
    scoreboard players random @a custom_random_c 0 1000

#Определение состояний игрока
    #Игрок один
        tag @a add alone
        execute @a ~ ~ ~ tag @a[r=20, rm=0.0001] remove alone

    #ОБНАРУЖЕНИЕ МЕСТОНАХОЖДЕНИЯ ПО ВЫСОТЕ
        tag @a remove in_hot_deep
        execute @a ~ ~ ~ tag @s[y=-60, dy=49, tag=!in_nether] add in_hot_deep

        tag @a remove in_safe_zone
        execute @a ~ ~ ~ tag @s[y=-10, dy=20, tag=!in_nether] add in_safe_zone

        tag @a remove in_mines
        execute @a ~ ~ ~ tag @s[y=11, dy=42, tag=!in_nether] add in_mines

        tag @a remove in_surface
        execute @a ~ ~ ~ tag @s[y=54, dy=65, tag=!in_nether] add in_surface

        tag @a remove in_sky
        execute @a ~ ~ ~ tag @s[y=120, dy=199, tag=!in_nether] add in_sky

        tag @a remove in_space
        execute @a ~ ~ ~ tag @s[y=320, dy=100000] add in_space

#Телепортация мага
    execute @a[tag=!is_dead, scores={teleport_def=20}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_def=16}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_def=12}] ~ ~ ~ tp @p ~ ~ ~-10
    execute @a[tag=!is_dead, scores={teleport_def=8}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_def=4}] ~ ~ ~ tp @p ~-5 ~ ~

    execute @a[tag=!is_dead, scores={teleport_dmg=20}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_dmg=16}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_dmg=12}] ~ ~ ~ tp @p ~ ~ ~-10
    execute @a[tag=!is_dead, scores={teleport_dmg=8}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_dmg=4}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_dmg=20}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=16}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=12}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=8}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=4}] ~ ~ ~ damage @e[r=15] 4

    #Откат очков телепортации мага
        execute @a[tag=!is_dead, scores={teleport_def=1..}] ~ ~ ~ scoreboard players add @p teleport_def -1
        execute @a[tag=!is_dead, scores={teleport_dmg=1..}] ~ ~ ~ scoreboard players add @p teleport_dmg -1

# Обнаружение несуществующих мобов и их деспавн
    tp @e[type=pillager] -10000 -100 -10000
    tp @e[type=villager] -10000 -100 -10000
    tp @e[type=wandering_trader] -10000 -100 -10000
    tp @e[type=zombie] -10000 -100 -10000
    tp @e[type=skeleton] -10000 -100 -10000
    tp @e[type=skeleton_horse] -10000 -100 -10000
    tp @e[type=zombie_villager] -10000 -100 -10000
    tp @e[type=spider] -10000 -100 -10000
    tp @e[type=witch] -10000 -100 -10000