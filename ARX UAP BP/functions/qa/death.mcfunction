# ЗАПУСКАЕТСЯ МОДЕРАТОРОМ ПРИ РП УБИЙСТВЕ

# Анализируем, в комнате попущения ли игрок
    tag @s remove at_respawn_room
    tag @s[x=9990, y=-33, z=9990, dx=20, dy=10, dz=20] add at_respawn_room

# Анализируем, какой класс у игрока
    tag @s[scores={class=0}] add is_not_ghost
    tag @s[scores={class=1}] add is_ghost

    # Если класс неопределён (ошибка)
        execute @s[tag=!is_not_ghost, tag=!is_ghost] ~ ~ ~ w @a[scores={verify=2}] §4Обнаружена ошибка у @s scripts>>scores>>no_class_detected_on_death
        execute @s[tag=!is_not_ghost, tag=!is_ghost] ~ ~ ~ w @s §4Обнаружена ошибка входных данных. Обратитесь к модератору.

# Если игрок не в комнате попущения
    execute @s[tag=!at_respawn_room] ~ ~ ~ w @a[scores={verify=2}] §6Игрок @s не на респавне, его невозможно убить.

# Если в комнате (else к условию выше)
    # Логика
        effect @s clear
        scoreboard players set @s stress 0

    # Звук 
        execute @s[tag=at_respawn_room] ~ ~ ~ playsound mob.rat_eliminator.spawn @s ~ ~ ~ 

    # Затемнение экрана
        execute @s[tag=at_respawn_room] ~ ~ ~ camera @s fade time 0.8 1 0.8 color 60 20 20

    # Сообщение титлом
        execute @s[tag=at_respawn_room] ~ ~ ~ title @s subtitle §cдобиты
        execute @s[tag=at_respawn_room] ~ ~ ~ title @s title §cВы были

        execute @s[tag=at_respawn_room] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "=====" } ] }

    # Если умер призрак
        execute @s[tag=at_respawn_room, tag=is_ghost, tag=!death_by_disease] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§cТак и закончилась эта история. Вы были добиты и погибли навсегда." } ] }
        execute @s[tag=at_respawn_room, tag=is_ghost, tag=death_by_disease, scores={drugs_delay=1..1200}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§cТак и закончилась эта история. Вы доигрались с наркотиками и погибли навсегда." } ] }
        execute @s[tag=at_respawn_room, tag=is_ghost, tag=death_by_disease, scores={drugs_delay=!1..1200}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§cТак и закончилась эта история. Вы серьёзно заболели и погибли навсегда." } ] }
        execute @s[tag=at_respawn_room, tag=is_ghost] ~ ~ ~ function completely_wipe_character
        execute @s[tag=at_respawn_room, tag=is_ghost] ~ ~ ~ scoreboard players set @s respawn_delay -1
        execute @s[tag=at_respawn_room, tag=is_ghost] ~ ~ ~ tag @s add rp_is_dead
        execute @s[tag=at_respawn_room, tag=is_ghost] ~ ~ ~ function food/set_zero_tastes
        execute @s[tag=at_respawn_room, tag=is_ghost] ~ ~ ~ clear @s

    # Если умер не призрак
        execute @s[tag=at_respawn_room, tag=is_not_ghost, tag=!death_by_disease] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6Вы былы убиты и обращены в §4ПРИЗРАКА!§f. Достигнув 7 уровня Аркса, вы сможете снова стать человеком." } ] }
        execute @s[tag=at_respawn_room, tag=is_not_ghost, tag=death_by_disease, scores={drugs_delay=1..1200}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6Вы погибли во время наркотической ломки и обратились в §4ПРИЗРАКА!§f. Достигнув 7 уровня Аркса, вы сможете снова стать человеком." } ] }
        execute @s[tag=at_respawn_room, tag=is_not_ghost, tag=death_by_disease, scores={drugs_delay=!1..1200}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6Вы слишком тяжело заболели, умерли и обратились в §4ПРИЗРАКА!§f. Достигнув 7 уровня Аркса, вы сможете снова стать человеком." } ] }
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aВаш откат респавна обновлён, выставлено 60 секунд." } ] }
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§6Вы будете невидимы 3 минуты с текущего момента. Не забудьте, что вы будете получать урон под солнцем, под дождём и в воде." } ] }
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ effect @s invisibility 180 0 true
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ event entity @s arx:become_ghost
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s xp 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s xp_stage 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s speed_skill 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s magic_skill 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s strength_skill 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s skill_point 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s sk_a_1 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s respawn_delay 60
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s stress 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_cancer 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_mild_cold 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_severe_cold 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_pneumonia 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_broken_leg 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_broken_arm 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_flu 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_helminth 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_appendicitis 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_anal_fissure 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_r_head 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s ill_r_stomach 0
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s class 1
        execute @s[tag=at_respawn_room, tag=is_not_ghost] ~ ~ ~ scoreboard players set @s drugs_delay 0

# Чистим теги
    tag @s remove is_not_ghost
    tag @s remove is_ghost
    tag @s remove death_by_disease