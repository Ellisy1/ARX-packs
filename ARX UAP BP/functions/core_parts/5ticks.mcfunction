# old execute syntaxis

#ТЯЖЕСТЬ ИНВЕНТАРЯ (вес)
    #Вычисление тяжести
        function core_parts_NAP/weigh
    # Вычисление компенсации тяжести (= вместимости инвентаря по весу)
        # Навыки, статы
            scoreboard players set @a heavy_compens 5
            execute @a[scores={poit_heigth_a=1..}] ~ ~ ~ scoreboard players add @s heavy_compens 2
            execute @a[scores={poit_heigth_b=1..}] ~ ~ ~ scoreboard players add @s heavy_compens 5
            execute @a[scores={c_powerful=1..}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a[scores={c_seen_death=1..}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a[scores={c_indeclinable=1..}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a ~ ~ ~ scoreboard players operation @s heavy_compens += @s strength_skill
            execute @a ~ ~ ~ scoreboard players operation @s heavy_compens += @s strength_skill
            execute @a ~ ~ ~ scoreboard players operation @s heavy_compens += @s might_skill
            execute @a ~ ~ ~ scoreboard players operation @s heavy_compens += @s trailblazer_skill
            execute @a[scores={speed_skill=1..2}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a[scores={speed_skill=3..4}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a[scores={speed_skill=5..6}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            execute @a[scores={stress_cond=4, c_conscious=0}] ~ ~ ~ scoreboard players add @s heavy_compens -2
            execute @a[scores={stress_cond=4, c_conscious=1}] ~ ~ ~ scoreboard players add @s heavy_compens -1
            execute @a[scores={stress_cond=2..4}] ~ ~ ~ scoreboard players add @s heavy_compens -1
            execute @a[scores={stress_cond=-4}] ~ ~ ~ scoreboard players add @s heavy_compens 2
            execute @a[scores={stress_cond=-4..-2}] ~ ~ ~ scoreboard players add @s heavy_compens 1

        # Шмот
            execute @a ~ ~ ~ scoreboard players operation @s heavy_compens += @s backpack_volume
            # execute @a[hasitem={item=arx:ring_aluminum_cornelian, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s heavy_compens 1
            # execute @a[hasitem={item=arx:ring_durasteel_cornelian, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s heavy_compens 2
            # execute @a[hasitem={item=arx:ring_caryite_cornelian, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s heavy_compens 3
            # execute @a[hasitem={item=arx:ring_toliriite_cornelian, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s heavy_compens 4
            # execute @a[hasitem={item=arx:ring_lamenite_cornelian, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s heavy_compens 5

    # Eсли компенсация меньше 1
        execute @a[scores={heavy_compens=..0}] ~ ~ ~ scoreboard players set @s heavy_compens 1

    # Рассчёт фактической загруженности
        execute @a ~ ~ ~ scoreboard players operation @s heavy_result = @s heavy
        execute @a ~ ~ ~ scoreboard players operation @s heavy_result -= @s heavy_compens

    # Сообщения
        execute @a ~ ~ ~ scoreboard players operation @s heavy_delta = @s heavy
        execute @a ~ ~ ~ scoreboard players operation @s heavy_delta -= @s heavy_log
        execute @a[scores={heavy_delta=1..}] ~ ~ ~ title @s actionbar §4Мне стало тяжелее нести свои вещи
        execute @a[scores={heavy_delta=..-1}] ~ ~ ~ title @s actionbar §aМне стало легче нести свои вещи
        execute @a ~ ~ ~ scoreboard players operation @s heavy_log = @s heavy

# Чарим кандалы
    enchant @a[hasitem={item=arx:shackles, location=slot.weapon.mainhand}] binding 1

# Партиклы при превращении крысы-призрака в теру
    execute @e[type=arx:rat_ghost_to_eliminator] ~ ~ ~ particle arx:rat_ghost_despawn ~ ~1.5 ~

# Увеличиваем урон если надет амулет порочного демона
    event entity @a arx:set_0_base_dmg
    execute @a[hasitem={item=arx:amul_essence_of_vicious_demon, location=slot.armor.legs}] ~ ~ ~ event entity @s arx:set_5_base_dmg