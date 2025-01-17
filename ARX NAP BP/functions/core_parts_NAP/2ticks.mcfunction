# Эта функция вызывается раз в 2 такта (1/10 сек) и использует синтаксис NAP
effect @a[hasitem={item=arx:lamenite_plate_armor, location=slot.armor.chest}, tag=low_hp, scores={freezing=!..-1001}] fire_resistance 2 0 true

# Сообщения при держании посохов
    # Чистка тегов с предыдущей итерации
        tag @a remove holds_staff_sexto
        tag @a remove holds_staff_quintu
        tag @a remove holds_staff_quadro
        tag @a remove holds_staff_trio
        tag @a remove holds_staff_duo
        tag @a remove holds_staff_mono

    # Определяем что мы держим   tag @a[hasitem={item=arx:sample, location=slot.weapon.mainhand}] add holds_staff_channel_id
        # sexto
            tag @a[hasitem={item=arx:staff_san, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_din, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_sin, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_kon, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_dragon, location=slot.weapon.mainhand}] add holds_staff_sexto

        # quintu
            tag @a[hasitem={item=arx:staff_battle, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_battle_custom_magik, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_fulminant, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_caryite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_chloronite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dark_netherite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dorionite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dorionite_with_caryite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_netherite_with_ruby, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_snowlands, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_twilight, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:vicious_staff_refined, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_hell, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_shaman, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_angel, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_heaven, location=slot.weapon.mainhand}] add holds_staff_quintu

        # quadro
            tag @a[hasitem={item=arx:staff_naginitis, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:vicious_staff, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:staff_with_skull, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:staff_golden_cross, location=slot.weapon.mainhand}] add holds_staff_quadro

        # trio
            tag @a[hasitem={item=arx:staff_cast_iron_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_golden_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_golden_with_sapphire, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_of_forest, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_of_phoenix, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_precious, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_with_ruby, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_steel_with_topaz, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_with_diamond, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_simple_with_ruby, location=slot.weapon.mainhand}] add holds_staff_trio
            
        # duo
            tag @a[hasitem={item=arx:staff_gold, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_tin_with_gold, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_wooden_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_wooden_with_riolik, location=slot.weapon.mainhand}] add holds_staff_duo

        # mono
            tag @a[hasitem={item=arx:staff_wooden, location=slot.weapon.mainhand}] add holds_staff_mono
            tag @a[hasitem={item=arx:staff_golden_with_violet_handle, location=slot.weapon.mainhand}] add holds_staff_mono
            tag @a[hasitem={item=arx:staff_of_scarlet_moon, location=slot.weapon.mainhand}] add holds_staff_mono

    # Вывод о канале и цели
        execute if entity @a[tag=holds_staff_sexto] run function core_parts_NAP/display_staff_channels/sexto
        execute if entity @a[tag=holds_staff_quintu] run function core_parts_NAP/display_staff_channels/quintu
        execute if entity @a[tag=holds_staff_quadro] run function core_parts_NAP/display_staff_channels/quadro
        execute if entity @a[tag=holds_staff_trio] run function core_parts_NAP/display_staff_channels/trio
        execute if entity @a[tag=holds_staff_duo] run function core_parts_NAP/display_staff_channels/duo
        execute if entity @a[tag=holds_staff_mono] run function core_parts_NAP/display_staff_channels/mono
        


# ОПЫТ
    # Рассчёт увеличения
        # Эксеринц. зелье
            execute as @a[scores={xp_х1_5=1..}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1500
            execute as @a[scores={xp_х1_5=1..}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
        # Амулет выс. знания
            execute as @a[hasitem={item=arx:amul_higher_knowledge, location=slot.armor.legs}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1050
            execute as @a[hasitem={item=arx:amul_higher_knowledge, location=slot.armor.legs}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
        # Черта c_genious
            execute as @a[scores={c_genious=1..}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1030
            execute as @a[scores={c_genious=1..}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
        # Черта c_lazy
            execute as @a[scores={c_lazy=1..}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_850
            execute as @a[scores={c_lazy=1..}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
        # Первопроходец
            # 1
                execute as @a[scores={trailblazer_skill=1}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1050
                execute as @a[scores={trailblazer_skill=1}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
            # 2
                execute as @a[scores={trailblazer_skill=2}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1100
                execute as @a[scores={trailblazer_skill=2}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
            # 3
                execute as @a[scores={trailblazer_skill=3}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1150
                execute as @a[scores={trailblazer_skill=3}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
            # 4
                execute as @a[scores={trailblazer_skill=4}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1200
                execute as @a[scores={trailblazer_skill=4}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
            # 5
                execute as @a[scores={trailblazer_skill=5}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1250
                execute as @a[scores={trailblazer_skill=5}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
            # 6
                execute as @a[scores={trailblazer_skill=6}] run scoreboard players operation @s xp_tray *= @p[scores={verify=2}] const_1300
                execute as @a[scores={trailblazer_skill=6}] run scoreboard players operation @s xp_tray /= @p[scores={verify=2}] const_1000
    
    # Отчёт о получении/списании опыта
        execute as @a[m=!spectator, tag=!is_dead, scores={xp_tray=1..}] run tellraw @s { "rawtext": [ { "text": "§a[§fXP§a]§f " }, { "score": {"name": "@s", "objective": "xp_tray" } }, { "text": " §aопыта получено" } ] }
        execute as @a[m=!spectator, tag=!is_dead, scores={xp_tray=..-1}] run tellraw @s { "rawtext": [ { "text": "§4[§fXP§4]§f " }, { "score": {"name": "@s", "objective": "xp_tray" } }, { "text": " §4опыта списано" } ] }
    
    # Перевод трея опыта в фактический опыт
        execute as @a[m=!spectator, tag=!is_dead] run scoreboard players operation @s xp += @s xp_tray
        execute as @a run scoreboard players set @s xp_tray 0

    # Устанавливаем лимит опыта зависимо от уровня
        scoreboard players add @a xp_stage 0
        scoreboard players set @a[scores={xp_stage=0}] xp_lim 200
        scoreboard players set @a[scores={xp_stage=1}] xp_lim 600
        scoreboard players set @a[scores={xp_stage=2}] xp_lim 1400
        scoreboard players set @a[scores={xp_stage=3}] xp_lim 3000
        scoreboard players set @a[scores={xp_stage=4}] xp_lim 6200
        scoreboard players set @a[scores={xp_stage=5}] xp_lim 12600
        scoreboard players set @a[scores={xp_stage=6}] xp_lim 25400
        scoreboard players set @a[scores={xp_stage=7}] xp_lim 51000
        scoreboard players set @a[scores={xp_stage=8}] xp_lim 102200
        scoreboard players set @a[scores={xp_stage=9}] xp_lim 204600
        scoreboard players set @a[scores={xp_stage=10}] xp_lim 409400
        scoreboard players set @a[scores={xp_stage=11}] xp_lim 819000
        scoreboard players set @a[scores={xp_stage=12}] xp_lim 1638200
        #scoreboard players set @a[scores={xp_stage=13}] xp_lim 3276600
        scoreboard players set @a[scores={xp_stage=13}] xp_lim 999999999

    # Вычисляем разницу (xp_lim_delta) между опытом (xp) и лимитом опыта (xp_lim)
        execute as @a run scoreboard players operation @s xp_lim_delta = @s xp_lim
        execute as @a run scoreboard players operation @s xp_lim_delta -= @s xp

    # Если разница между лимитом опыта и опытом =< 0, даем новый ур.
        execute as @a[scores={xp_lim_delta=..0}] run scoreboard players add @s xp_stage 1
        execute as @a[scores={xp_lim_delta=..0}] run scoreboard players operation @s xp -= @s xp_lim

        tellraw @a[scores={xp_lim_delta=..0}] { "rawtext": [{ "text": "§l§6> §dУровень повышен!\n§l§6> §cМаксимальное здоровье увеличено" } ] } 
        execute as @a[scores={xp_lim_delta=..0}] at @s run playsound action.lvl_up @a ~ ~ ~

    # Сообщения при новом уровне
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=1}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=2}] { "rawtext": [{ "text": "§l§6> §aОткрыт уровень религии: служитель!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=3}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=4}] { "rawtext": [{ "text": "§l§6> §aОткрыт уровень религии: адепт!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=5}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=6}] { "rawtext": [{ "text": "§l§6> §aОткрыт специальный уровень религии!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=7}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=8}] { "rawtext": [{ "text": "§l§6> §aОткрыт высший уровень религии!" } ] }
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=9}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 
        tellraw @a[scores={xp_lim_delta=..0, xp_stage=10}] { "rawtext": [{ "text": "§l§6> §a+1 очко обучения!" } ] } 

    # Даем очки обучения на новом уровне
        execute as @a[scores={xp_lim_delta=..0, xp_stage=1}] run scoreboard players add @s skill_point 1
        execute as @a[scores={xp_lim_delta=..0, xp_stage=3}] run scoreboard players add @s skill_point 1
        execute as @a[scores={xp_lim_delta=..0, xp_stage=5}] run scoreboard players add @s skill_point 1
        execute as @a[scores={xp_lim_delta=..0, xp_stage=7}] run scoreboard players add @s skill_point 1
        execute as @a[scores={xp_lim_delta=..0, xp_stage=9}] run scoreboard players add @s skill_point 1
        execute as @a[scores={xp_lim_delta=..0, xp_stage=10}] run scoreboard players add @s skill_point 1

# Партиклы от блуждающих огоньков
    execute at @e[type=arx:wandering_flame_of_tsaskhin] run particle arx:wandering_flame_of_tsaskhin ~ ~ ~
    execute unless entity @a[tag=scarlet_night] at @e[type=arx:wandering_flame_of_night] run particle arx:wandering_flame_of_night ~ ~ ~
    execute at @e[type=arx:wandering_flame_of_mines] run particle arx:wandering_flame_of_mines ~ ~ ~

# Анализ держания рун
    execute as @a run function core_parts_NAP/rune_titles
    
    title @a[tag=holds_rune, m=!spectator, rx=-60] actionbar §bI Канал
    title @a[tag=holds_rune, m=!spectator, rxm=-60, rx=-30] actionbar §bII Канал
    title @a[tag=holds_rune, m=!spectator, rxm=-30, rx=0] actionbar §bIII Канал
    title @a[tag=holds_rune, m=!spectator, rxm=0.001, rx=30] actionbar §bIV Канал
    title @a[tag=holds_rune, m=!spectator, rxm=30, rx=60] actionbar §bV Канал
    title @a[tag=holds_rune, m=!spectator, rxm=60] actionbar §bVI Канал

# Титлы настройки звука
    execute if entity @a[m=!spectator, hasitem={item=arx:music_volume_tuner, location=slot.weapon.mainhand}] run function core_parts_NAP/display_volume_tuner_titles

# Титлы универсального ключа
    execute if entity @a[m=!spectator, hasitem={item=arx:universal_radio_key, location=slot.weapon.mainhand}, tag=!urk_remote_controller_mode] run function core_parts_NAP/display_universal_radio_key