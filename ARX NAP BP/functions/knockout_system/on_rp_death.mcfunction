# Запускается автоматически при смерти игрока

# Анализируем, какой класс у игрока
    tag @s[scores={class=1}] add is_ghost

# Логика
    effect @s clear

    scoreboard players set @s stress 0
    scoreboard players set @s knockout_row_sounter 0
    scoreboard players set @s respawn_delay 0

    inputpermission set @s movement enabled 
    inputpermission set @s camera enabled 

    event entity @s arx:property_is_knockout_set_0

# Звук 
    playsound mob.rat_eliminator.spawn @s ~ ~ ~ 

# Затемнение экрана
    camera @s clear

# Сообщение титлом
    title @s title §c= Вы погибли =

    tellraw @s { "rawtext": [ { "text": "=====" } ] }

# Если умер призрак
    execute as @s[tag=is_ghost] run tellraw @s { "rawtext": [ { "text": "§cТак и закончилась эта история. Вы погибли навсегда." } ] }
    execute as @s[tag=is_ghost] run function knockout_system/data_wipe/_wipe_main
    execute as @s[tag=is_ghost] run tag @s add rp_is_dead
    execute as @s[tag=is_ghost] run function food/set_zero_tastes
    execute as @s[tag=is_ghost] run clear @s
    execute as @s[tag=is_ghost] run function tp/8_respawn
    execute as @s[tag=is_ghost] run scoreboard players set @s verify 0

# Если умер не призрак
    execute as @s[tag=!is_ghost, tag=!death_by_disease] run tellraw @s { "rawtext": [ { "text": "§сВы былы убиты и обращены в §4ПРИЗРАКА!§f. Достигнув 7 уровня Аркса, вы сможете снова стать человеком, использовав §r§fСвиток перерождения §c[Мифическое]" } ] }
    execute as @s[tag=!is_ghost] run tellraw @s { "rawtext": [ { "text": "§eВы будете невидимы 3 минуты с текущего момента. Не забудьте, что вы будете получать урон под солнцем, под дождём и в воде." } ] }
    execute as @s[tag=!is_ghost] run effect @s invisibility 180 0 true
    execute as @s[tag=!is_ghost] run event entity @s arx:become_ghost

    execute as @s[tag=!is_ghost] run scoreboard players operation @s xp_roll_back = @s xp
    execute as @s[tag=!is_ghost] run scoreboard players operation @s xp_stage_roll_back = @s xp_stage

    execute as @s[tag=!is_ghost] run scoreboard players set @s xp 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s xp_stage 0
    
    execute as @s[tag=!is_ghost] run scoreboard players set @s speed_skill 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s magic_skill 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s strength_skill 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s trailblazer_skill 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s might_skill 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s skill_point 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s stress 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_cancer 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_mild_cold 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_severe_cold 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_pneumonia 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_broken_leg 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_broken_arm 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_flu 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_helminth 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_appendicitis 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_anal_fissure 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_r_head 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s ill_r_stomach 0
    execute as @s[tag=!is_ghost] run scoreboard players set @s class 1
    execute as @s[tag=!is_ghost] run scoreboard players set @s drugs_delay 0
    execute as @s[tag=!is_ghost] run particle arx:blood_burst ~ ~0.3 ~
    execute as @s[tag=!is_ghost] run particle arx:blood ~ ~0.3 ~
    execute as @s[tag=!is_ghost] run function tp/1_spawn

# Чистим теги
    tag @s remove is_ghost
    tag @s remove death_by_disease
    tag @s remove __force_to_rp_death__

# Отладка 
    tag @s add __died_last_second__