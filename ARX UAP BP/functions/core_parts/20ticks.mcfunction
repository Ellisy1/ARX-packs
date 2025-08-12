#Эффекты брони
    camera @a[hasitem={item=arx:blindness_bandage, location=slot.armor.head}] fade time 0 2 0 color 30 30 30 

#Просчёт стабильности ядра
    scoreboard players add @a[scores={verify=2}] stability_core 1

#Просчёт общего времени
    execute @a[scores={verify=2, sec=60}] ~ ~ ~ scoreboard players add @a time_m 1
    execute @a[scores={time_m=60}] ~ ~ ~ scoreboard players add @s time_h 1
    execute @a[scores={time_m=60..}] ~ ~ ~ scoreboard players set @s time_m 0
    scoreboard objectives remove time_h_display
    scoreboard objectives add time_h_display dummy "§a§lЧасы игры"
    execute @a ~ ~ ~ scoreboard players operation @s time_h_display = @s time_h
    scoreboard objectives setdisplay list time_h_display

#Невидимость 
    scoreboard players add @a[scores={invisible=1..}] invisible -1
    effect @a[scores={invisible=1..}] invisibility 2 0 true
    effect @a[tag=alone, scores={invis_saki=1..}] invisibility 2 0 true

    #Откат переменной боя (получается при ударах чего-л)
        scoreboard players add @a[scores={in_battle=1..}] in_battle -1

        scoreboard players add @a[scores={vic_dag_bonus=1..}] vic_dag_bonus -1

    #Вычитание поинтов блока син иноффо
        execute @e[scores={sin_host_block=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] sin_host_block -1
        execute @e[scores={sin_host_saki=1}] ~ ~ ~ scoreboard players set @e[r=0.0001] sin_host_block 1

    #Вычитание поинтов блока сэмпры
        execute @e[scores={tick_nosempra_a=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] tick_nosempra_a -1 
        execute @e[scores={tick_nosempra_b=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] tick_nosempra_b -1
        execute @e[scores={tick_nosempra_c=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] tick_nosempra_c -1

        execute @e[scores={tick_nosempra_c=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] tick_nosempra_a 0 
        execute @e[scores={tick_nosempra_c=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] tick_nosempra_b 0 
        execute @e[scores={tick_nosempra_b=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] tick_nosempra_a 0 

    #Вычитание поинтов защиты
        execute @e[scores={resist_up_a=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] resist_up_a -1
        execute @e[scores={resist_up_b=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] resist_up_b -1
        execute @e[scores={resist_up_c=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] resist_up_c -1
        execute @e[scores={resist_up_d=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] resist_up_d -1

        execute @e[scores={resist_up_d=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_a 0 
        execute @e[scores={resist_up_d=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_b 0 
        execute @e[scores={resist_up_d=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_c 0 
        execute @e[scores={resist_up_c=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_a 0 
        execute @e[scores={resist_up_c=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_b 0 
        execute @e[scores={resist_up_b=1..}] ~ ~ ~ scoreboard players set @e[r=0.0001] resist_up_a 0 

    #Вычитание поинтов блока ослепления
        scoreboard players add @a[scores={blind_block=1..}] blind_block -1
        scoreboard players set @a[scores={blind_block_saki=1}] blind_block 1
        
    #Вычитание поинтов блока намокания
        scoreboard players add @a[scores={water_block=1..}] water_block -1
        scoreboard players set @a[scores={water_block_saki=1}] water_block 1
    
    #Вычитание поинтов заклинания лука
        scoreboard players add @a[scores={bow_spell_a=1..}] bow_spell_a -1
        scoreboard players add @a[scores={bow_spell_b=1..}] bow_spell_b -1
        scoreboard players add @a[scores={bow_spell_c=1..}] bow_spell_c -1
        scoreboard players add @a[scores={bow_spell_d=1..}] bow_spell_d -1
    

# Демон
    # Откат бонуса демона
        scoreboard players add @a[scores={demon_power=1..}] demon_power -1

    # Фиксация бонуса демона при паразитировании
        scoreboard players set @a[scores={c_demon=1}] demon_power 1
    
    # Надета ли цепь демона?
        tag @a remove demon_chain_equipped
        tag @a[hasitem={location=slot.armor.legs, item=arx:demon_chain}] add demon_chain_equipped

    # Бонус демона
        camerashake add @a[scores={demon_power=1..}, tag=!demon_chain_equipped] 0.1 1 rotational

    # Урон от демона при паразитировании
        damage @a[scores={c_demon=1}, hasitem={item=arx:salt}] 5 entity_attack
        damage @a[scores={c_demon=1}, hasitem={item=arx:undemon_book}] 12 entity_attack
        execute @a[scores={c_demon=1}, hasitem={item=arx:salt}] ~ ~ ~ playsound demon.agressive @a ~ ~ ~
        execute @a[scores={c_demon=1}, hasitem={item=arx:undemon_book}] ~ ~ ~ playsound demon.agressive @a ~ ~ ~

#Анализ биомов
    tag @a remove BIOME_birch
    event entity @a arx:test_biome_birch
    tag @a remove BIOME_jungle
    event entity @a arx:test_biome_jungle
    tag @a remove BIOME_ocean
    event entity @a arx:test_biome_ocean
    event entity @a arx:test_biome_river
    tag @a remove BIOME_forest
    event entity @a arx:test_biome_forest
    event entity @a arx:test_biome_flower_forest
    tag @a remove BIOME_desert
    event entity @a arx:test_biome_desert
    tag @a remove BIOME_mesa
    event entity @a arx:test_biome_mesa
    tag @a remove BIOME_plains
    event entity @a arx:test_biome_plains
    tag @a remove BIOME_savanna
    event entity @a arx:test_biome_savanna
    tag @a remove BIOME_swamp
    event entity @a arx:test_biome_swamp
    tag @a remove BIOME_mangrove_swamp
    event entity @a arx:test_biome_mangrove_swamp
    tag @a remove BIOME_beach
    event entity @a arx:test_biome_beach
    tag @a remove BIOME_mountain
    event entity @a arx:test_biome_mountain
    tag @a remove BIOME_ice
    event entity @a arx:test_biome_ice
    event entity @a arx:test_biome_cold
    tag @a remove BIOME_roofed
    event entity @a arx:test_biome_roofed
    tag @a remove BIOME_taiga
    event entity @a arx:test_biome_taiga

    #Удаление лишних тегов
        tag @a[tag=BIOME_birch, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_roofed, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_taiga, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_beach] add BIOME_ocean
        tag @a[tag=BIOME_ocean] remove BIOME_beach

#ДВИЖОК ПОГОДЫ:
    #Вычитаем поинты погоды
        execute @a[scores={verify=2, weather=1..}] ~ ~ ~ scoreboard players add @s weather -1

    #Сменяем погоду
        #Ставим погоду по прохождению отката
            execute @a[scores={verify=2, weather=1}] ~ ~ ~ weather clear
        #Дождь
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=0..250}] ~ ~ ~ weather rain
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=0..50}] ~ ~ ~ scoreboard players random @s weather 200 800
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=51..250}] ~ ~ ~ scoreboard players random @s weather 10 200

# Партиклы опыта (когда бонус 1.5)
    execute @a[scores={xp_х1_5=1..}] ~ ~ ~ particle arx:xp_upgrade ~ ~2 ~ 

# Снимаем переменную буста опыта
    execute @a[scores={xp_х1_5=1..}] ~ ~ ~ scoreboard players add @s xp_х1_5 -1

# Снимаем переменную невидимости от магии
    execute @a[scores={invis_saki=1..}] ~ ~ ~ scoreboard players add @s invis_saki -1