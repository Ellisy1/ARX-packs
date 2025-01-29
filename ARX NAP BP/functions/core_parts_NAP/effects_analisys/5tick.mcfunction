#КОНЕЧНЫЕ ЭФФЕКТЫ - 5tcs

    #Конечная скорость
        scoreboard players set @e final_speed 0

        scoreboard players add @a[scores={speed_skill=2..3}] final_speed 1
        scoreboard players add @a[scores={speed_skill=4..5}] final_speed 2
        scoreboard players add @a[scores={speed_skill=6}] final_speed 3

        scoreboard players add @a[scores={trailblazer_skill=2..3}] final_speed 1
        scoreboard players add @a[scores={trailblazer_skill=4..5}] final_speed 2
        scoreboard players add @a[scores={trailblazer_skill=6}] final_speed 3

        scoreboard players add @a[scores={pois_cond=2}] final_speed -1
        scoreboard players add @a[scores={pois_cond=3}] final_speed -2
        scoreboard players add @a[scores={pois_cond=4..}] final_speed -3

        scoreboard players add @a[scores={religion=7}, tag=low_hp] final_speed 1
        scoreboard players add @a[scores={religion=7}, tag=very_low_hp] final_speed 2

        scoreboard players add @a[scores={religion=8..9}] final_speed 1
        scoreboard players add @a[scores={religion=18..19}] final_speed 1

        scoreboard players add @a[scores={religion=9}, tag=low_bright] final_speed 1
        scoreboard players add @a[scores={religion=19}, tag=high_bright] final_speed 1

        scoreboard players add @a[scores={poit_speed_a=1..}] final_speed 1
        scoreboard players add @a[scores={poit_speed_b=1..}] final_speed 2
        scoreboard players add @e[scores={jump_speed_up_a=1..}] final_speed 1
        scoreboard players add @e[scores={jump_speed_up_b=1..}] final_speed 1
        scoreboard players add @e[scores={jump_speed_up_c=1..}] final_speed 2
        scoreboard players add @e[scores={jump_speed_up_d=1..}] final_speed 2
        scoreboard players add @e[scores={jump_speed_up_e=1..}] final_speed 3
        scoreboard players add @e[scores={jump_speed_up_f=1..}] final_speed 5
        scoreboard players add @a[scores={armor_assas_dmg=1..}] final_speed 4
        scoreboard players add @a[scores={armor_ranger_dmg=1..}] final_speed 2
        scoreboard players add @a[scores={armor_conq_dmg=1..}] final_speed 1

        execute as @a[scores={heavy_result=1..}] run scoreboard players operation @s final_speed -= @s heavy_result

        scoreboard players add @a[hasitem={item=arx:ring_durasteel_chrysolite, location=slot.armor.feet}] final_speed 1
        scoreboard players add @a[hasitem={item=arx:ring_caryite_chrysolite, location=slot.armor.feet}] final_speed 1
        scoreboard players add @a[hasitem={item=arx:ring_toliriite_chrysolite, location=slot.armor.feet}] final_speed 2
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_chrysolite, location=slot.armor.feet}] final_speed 1
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_chrysolite_max, location=slot.armor.feet}] final_speed 1
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_chrysolite, location=slot.armor.feet}] final_speed 2
        scoreboard players add @a[hasitem={item=arx:shackles, location=slot.armor.legs}] final_speed -4
        scoreboard players add @a[hasitem={item=arx:medical_leg_splint, location=slot.armor.legs}] final_speed -2
        scoreboard players add @a[scores={is_day=0}, hasitem={item=arx:raven_armor, location=slot.armor.chest}] final_speed 1

        scoreboard players add @a[scores={blocking=21..}] final_speed -1
        scoreboard players add @a[scores={water_delay=201..}] final_speed -1
        scoreboard players add @a[scores={water_delay=401..}] final_speed -2
        scoreboard players add @a[scores={freezing=1001..2400}] final_speed -3
        scoreboard players add @a[scores={freezing=-2400..-1001}] final_speed -3
        scoreboard players add @a[scores={stress_cond=3}] final_speed -1
        scoreboard players add @a[scores={stress_cond=4, c_conscious=0}] final_speed -3
        scoreboard players add @a[scores={stress_cond=4, c_conscious=1..}] final_speed -2

        scoreboard players add @a[scores={stress_cond=-3}] final_speed 1
        scoreboard players add @a[scores={stress_cond=-4}] final_speed 2

        scoreboard players add @a[scores={vic_dag_bonus=1..}] final_speed 1

        scoreboard players add @a[scores={dwarf_curse=1}] final_speed -2

        #взаимодействие болезней
            scoreboard players add @a[scores={ill_cancer=1..4800}] final_speed -1
            scoreboard players add @a[scores={ill_cancer=1..1200}] final_speed -3
            scoreboard players add @a[scores={ill_mild_cold=9001..10000}] final_speed -1
            scoreboard players add @a[scores={ill_severe_cold=12201..13400}] final_speed -2
            scoreboard players add @a[scores={ill_severe_cold=8001..13400}] final_speed -1
            scoreboard players add @a[scores={ill_pneumonia=16301..18000}] final_speed -1 
            scoreboard players add @a[scores={ill_pneumonia=15000..16300}] final_speed -4
            scoreboard players add @a[scores={ill_pneumonia=11200..15000}] final_speed -2
            scoreboard players add @a[scores={ill_pneumonia=10000..11200}] final_speed -1
            scoreboard players add @a[scores={ill_flu=38001..39000}] final_speed -3 
            scoreboard players add @a[scores={ill_flu=30000..38000}] final_speed -1
            scoreboard players add @a[scores={ill_helminth=1}] final_speed -1 
            scoreboard players add @a[scores={ill_appendicitis=2401..5000}] final_speed -1
            scoreboard players add @a[scores={ill_appendicitis=1201..2400}] final_speed -2
            scoreboard players add @a[scores={ill_appendicitis=1..1200}] final_speed -5
            scoreboard players add @a[scores={ill_broken_leg=36001..72000}] final_speed -3
            scoreboard players add @a[scores={ill_broken_leg=1..36000}] final_speed -2
            scoreboard players add @a[scores={ill_anal_fissure=1..2400}] final_speed -1

        effect @e[scores={final_speed=1}] speed 1 0 true
        effect @e[scores={final_speed=2}] speed 1 1 true
        effect @e[scores={final_speed=3}] speed 1 2 true
        effect @e[scores={final_speed=4}] speed 1 3 true
        effect @e[scores={final_speed=5}] speed 1 4 true
        effect @e[scores={final_speed=6}] speed 1 5 true
        effect @e[scores={final_speed=7}] speed 1 6 true
        effect @e[scores={final_speed=8}] speed 1 7 true
        effect @e[scores={final_speed=9}] speed 1 8 true
        effect @e[scores={final_speed=10}] speed 1 9 true
        effect @e[scores={final_speed=11}] speed 1 10 true
        effect @e[scores={final_speed=12}] speed 1 11 true
        effect @e[scores={final_speed=13}] speed 1 12 true
        effect @e[scores={final_speed=14}] speed 1 13 true
        effect @e[scores={final_speed=15}] speed 1 14 true
        effect @e[scores={final_speed=16}] speed 1 15 true
        effect @e[scores={final_speed=17}] speed 1 16 true
        effect @e[scores={final_speed=18}] speed 1 17 true
        effect @e[scores={final_speed=19}] speed 1 18 true
        effect @e[scores={final_speed=20..}] speed 1 19 true

        effect @e[scores={final_speed=-1}] slowness 1 0 true
        effect @e[scores={final_speed=-2}] slowness 1 1 true
        effect @e[scores={final_speed=-3}] slowness 1 2 true
        effect @e[scores={final_speed=-4}] slowness 1 3 true
        effect @e[scores={final_speed=-5}] slowness 1 4 true
        effect @e[scores={final_speed=-6}] slowness 1 5 true
        effect @e[scores={final_speed=..-7}] slowness 1 255 true



    #Конечный прыжок
        scoreboard players set @a final_jump 0

        scoreboard players add @a[scores={speed_skill=2..3}] final_jump 1
        scoreboard players add @a[scores={speed_skill=4..5}] final_jump 2
        scoreboard players add @a[scores={speed_skill=6}] final_jump 3

        scoreboard players add @a[scores={poit_jump_a=1..}] final_jump 1
        scoreboard players add @a[scores={poit_jump_b=1..}] final_jump 2

        scoreboard players add @a[scores={pois_cond=2}] final_jump -1
        scoreboard players add @a[scores={pois_cond=3}] final_jump -2
        scoreboard players add @a[scores={pois_cond=4..}] final_jump -3

        execute as @a[scores={heavy_result=1..}] run scoreboard players operation @s final_jump -= @s heavy_result

        scoreboard players add @a[scores={jump_speed_up_a=1..}] final_jump 1
        scoreboard players add @a[scores={jump_speed_up_b=1..}] final_jump 1
        scoreboard players add @a[scores={jump_speed_up_c=1..}] final_jump 2
        scoreboard players add @a[scores={jump_speed_up_d=1..}] final_jump 2
        scoreboard players add @a[scores={jump_speed_up_e=1..}] final_jump 3
        scoreboard players add @a[scores={jump_speed_up_f=1..}] final_jump 5

        scoreboard players add @a[scores={stress_cond=3}] final_jump -1
        scoreboard players add @a[scores={stress_cond=4, c_conscious=0}] final_jump -3
        scoreboard players add @a[scores={stress_cond=4, c_conscious=1..}] final_jump -2

        scoreboard players add @a[scores={religion=9}] final_jump 1
        scoreboard players add @a[scores={religion=19}] final_jump 1
        scoreboard players add @a[scores={armor_conq_dmg=1..}] final_jump 1

        scoreboard players add @a[hasitem={item=arx:ring_gold_chrysolite, location=slot.armor.feet}] final_jump 1
        scoreboard players add @a[hasitem={item=arx:ring_caryite_chrysolite, location=slot.armor.feet}] final_jump 1
        scoreboard players add @a[hasitem={item=arx:ring_toliriite_chrysolite, location=slot.armor.feet}] final_jump 1
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_chrysolite, location=slot.armor.feet}] final_jump 2
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_chrysolite_max, location=slot.armor.feet}] final_jump 2
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_chrysolite, location=slot.armor.feet}] final_jump 2
        scoreboard players add @a[hasitem={item=arx:shackles, location=slot.armor.legs}] final_jump -10
        scoreboard players add @a[hasitem={item=arx:medical_leg_splint, location=slot.armor.legs}] final_jump -10


        #взаимодействие болезней
            scoreboard players add @a[scores={ill_cancer=1..4800}] final_jump -1
            scoreboard players add @a[scores={ill_cancer=1..1200}] final_jump -3
            scoreboard players add @a[scores={ill_mild_cold=9001..10000}] final_jump -1
            scoreboard players add @a[scores={ill_severe_cold=12201..13400}] final_jump -2
            scoreboard players add @a[scores={ill_severe_cold=8001..13400}] final_jump -1
            scoreboard players add @a[scores={ill_pneumonia=16301..18000}] final_jump -1 
            scoreboard players add @a[scores={ill_pneumonia=15000..16300}] final_jump -4
            scoreboard players add @a[scores={ill_pneumonia=11200..15000}] final_jump -2
            scoreboard players add @a[scores={ill_pneumonia=10000..11200}] final_jump -1
            scoreboard players add @a[scores={ill_flu=38001..39000}] final_jump -3 
            scoreboard players add @a[scores={ill_flu=30000..38000}] final_jump -1
            scoreboard players add @a[scores={ill_helminth=1}] final_jump -1 
            scoreboard players add @a[scores={ill_appendicitis=2401..5000}] final_jump -1
            scoreboard players add @a[scores={ill_appendicitis=1201..2400}] final_jump -2
            scoreboard players add @a[scores={ill_appendicitis=1..1200}] final_jump -5
            scoreboard players add @a[scores={ill_broken_leg=36001..72000}] final_jump -3
            scoreboard players add @a[scores={ill_broken_leg=1..36000}] final_jump -2
            scoreboard players add @a[scores={ill_anal_fissure=1..2400}] final_jump -1

        effect @a[scores={final_jump=1}] jump_boost 1 0 true
        effect @a[scores={final_jump=2}] jump_boost 1 1 true
        effect @a[scores={final_jump=3}] jump_boost 1 2 true
        effect @a[scores={final_jump=4}] jump_boost 1 3 true
        effect @a[scores={final_jump=5}] jump_boost 1 4 true
        effect @a[scores={final_jump=6}] jump_boost 1 5 true
        effect @a[scores={final_jump=7}] jump_boost 1 6 true
        effect @a[scores={final_jump=8}] jump_boost 1 7 true
        effect @a[scores={final_jump=9}] jump_boost 1 8 true
        effect @a[scores={final_jump=10}] jump_boost 1 9 true
        effect @a[scores={final_jump=11}] jump_boost 1 10 true
        effect @a[scores={final_jump=12}] jump_boost 1 11 true
        effect @a[scores={final_jump=13}] jump_boost 1 12 true
        effect @a[scores={final_jump=14}] jump_boost 1 13 true
        effect @a[scores={final_jump=15}] jump_boost 1 14 true
        effect @a[scores={final_jump=16}] jump_boost 1 15 true
        effect @a[scores={final_jump=17}] jump_boost 1 16 true
        effect @a[scores={final_jump=18}] jump_boost 1 17 true
        effect @a[scores={final_jump=19}] jump_boost 1 18 true
        effect @a[scores={final_jump=20..}] jump_boost 1 19 true


    #Конечная сила
        scoreboard players set @a final_strength 0

        scoreboard players add @a[scores={strength_skill=2..3}] final_strength 1
        scoreboard players add @a[scores={strength_skill=4..5}] final_strength 2
        scoreboard players add @a[scores={strength_skill=6}] final_strength 3

        scoreboard players add @a[scores={might_skill=2..3}] final_strength 1
        scoreboard players add @a[scores={might_skill=4..5}] final_strength 2
        scoreboard players add @a[scores={might_skill=6}] final_strength 3

        scoreboard players add @a[hasitem={item=arx:lamenite_plate_armor, location=slot.armor.chest}, tag=low_hp] final_strength 1

        scoreboard players add @a[hasitem={item=arx:composite_toothed_sawsword, location=slot.weapon.mainhand}, tag=low_hp] final_strength 1
        scoreboard players add @a[hasitem={item=arx:composite_toothed_sawsword, location=slot.weapon.mainhand}, tag=very_low_hp] final_strength 2

        scoreboard players add @a[scores={pois_cond=2}] final_strength -1
        scoreboard players add @a[scores={pois_cond=3}] final_strength -2
        scoreboard players add @a[scores={pois_cond=4..}] final_strength -3

        scoreboard players add @a[scores={c_loner=1..}, tag=alone] final_strength 1
        scoreboard players add @a[scores={c_loner=1..}, tag=!alone] final_strength -1

        scoreboard players add @a[scores={demon_power=1..}] final_strength 1
        scoreboard players add @a[scores={drugs_delay=301..600}] final_strength 1
        scoreboard players add @a[scores={drugs_delay=2..300}] final_strength 2
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_ruby, location=slot.armor.feet}] final_strength 1
        scoreboard players add @a[hasitem={item=arx:shackles, location=slot.armor.legs}] final_strength -10
        scoreboard players add @a[hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] final_strength -3
        execute as @a[scores={backpack_volume=1..}] run scoreboard players operation @s final_strength -= @s backpack_volume
        execute as @a[scores={heavy_result=1..}] run scoreboard players operation @s final_strength -= @s heavy_result

        scoreboard players add @e[scores={resist_up_d=1..}] final_strength -1000
        scoreboard players add @a[scores={water_delay=201..}] final_strength -1
        scoreboard players add @a[scores={water_delay=401..}] final_strength -2
        scoreboard players add @a[scores={freezing=1001..2400}] final_strength -3
        scoreboard players add @a[scores={freezing=-2400..-1001}] final_strength -3
        scoreboard players add @a[scores={stress_cond=-4}] final_strength 1
        scoreboard players add @a[scores={stress_cond=3}] final_strength -1
        scoreboard players add @a[scores={stress_cond=4, c_conscious=0}] final_strength -3
        scoreboard players add @a[scores={stress_cond=4, c_conscious=1..}] final_strength -2

        scoreboard players add @a[scores={vicious_flame=1..}] final_strength -1000

        scoreboard players add @a[scores={dwarf_curse=1}] final_strength -2

        scoreboard players add @a[has_property={arx:is_knocked=1..}] final_strength -1000

        # Слабость при держании ванильных инструментов
            scoreboard players add @a[hasitem={item=minecraft:wooden_axe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:stone_axe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:golden_axe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:iron_axe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:diamond_axe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:netherite_axe, location=slot.weapon.mainhand}] final_strength -100

            scoreboard players add @a[hasitem={item=minecraft:wooden_pickaxe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:stone_pickaxe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:golden_pickaxe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:iron_pickaxe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:diamond_pickaxe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:netherite_pickaxe, location=slot.weapon.mainhand}] final_strength -100

            scoreboard players add @a[hasitem={item=minecraft:wooden_shovel, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:stone_shovel, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:golden_shovel, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:iron_shovel, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:diamond_shovel, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:netherite_shovel, location=slot.weapon.mainhand}] final_strength -100

            scoreboard players add @a[hasitem={item=minecraft:wooden_hoe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:stone_hoe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:golden_hoe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:iron_hoe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:diamond_hoe, location=slot.weapon.mainhand}] final_strength -100
            scoreboard players add @a[hasitem={item=minecraft:netherite_hoe, location=slot.weapon.mainhand}] final_strength -100

        # Блок
            scoreboard players add @a[scores={blocking=21..}] final_strength -1000


        #Откат атаки
            scoreboard players add @a[scores={attack_weakness=20..39}] final_strength -1
            scoreboard players add @a[scores={attack_weakness=40..59}] final_strength -2
            scoreboard players add @a[scores={attack_weakness=60..79}] final_strength -3
            scoreboard players add @a[scores={attack_weakness=80..99}] final_strength -4
            scoreboard players add @a[scores={attack_weakness=100..119}] final_strength -5
            scoreboard players add @a[scores={attack_weakness=120..139}] final_strength -6
            scoreboard players add @a[scores={attack_weakness=140..159}] final_strength -7
            scoreboard players add @a[scores={attack_weakness=160..179}] final_strength -8
            scoreboard players add @a[scores={attack_weakness=180..199}] final_strength -9
            scoreboard players add @a[scores={attack_weakness=200..}] final_strength -1000

        #Взаимодействие болезней
            scoreboard players add @a[scores={ill_cancer=1..4800}] final_strength -1
            scoreboard players add @a[scores={ill_cancer=1..1200}] final_strength -3
            scoreboard players add @a[scores={ill_mild_cold=9001..10000}] final_strength -1
            scoreboard players add @a[scores={ill_severe_cold=12201..13400}] final_strength -2
            scoreboard players add @a[scores={ill_severe_cold=8001..13400}] final_strength -1
            scoreboard players add @a[scores={ill_pneumonia=16301..18000}] final_strength -1 
            scoreboard players add @a[scores={ill_pneumonia=15000..16300}] final_strength -4
            scoreboard players add @a[scores={ill_pneumonia=11200..15000}] final_strength -2
            scoreboard players add @a[scores={ill_pneumonia=10000..11200}] final_strength -1
            scoreboard players add @a[scores={ill_flu=38001..39000}] final_strength -3 
            scoreboard players add @a[scores={ill_flu=30000..38000}] final_strength -1
            scoreboard players add @a[scores={ill_helminth=1}] final_strength -1 
            scoreboard players add @a[scores={ill_appendicitis=2401..5000}] final_strength -1
            scoreboard players add @a[scores={ill_appendicitis=1201..2400}] final_strength -2
            scoreboard players add @a[scores={ill_appendicitis=1..1200}] final_strength -5
            scoreboard players add @a[scores={ill_broken_arm=36001..72000}] final_strength -3
            scoreboard players add @a[scores={ill_broken_arm=1..36000}] final_strength -2

        #Исполнение
            effect @a[scores={final_strength=1}] strength 1 0 true
            effect @a[scores={final_strength=2}] strength 1 1 true
            effect @a[scores={final_strength=3}] strength 1 2 true
            effect @a[scores={final_strength=4}] strength 1 3 true
            effect @a[scores={final_strength=5}] strength 1 4 true
            effect @a[scores={final_strength=6}] strength 1 5 true
            effect @a[scores={final_strength=7}] strength 1 6 true
            effect @a[scores={final_strength=8}] strength 1 7 true
            effect @a[scores={final_strength=9}] strength 1 8 true
            effect @a[scores={final_strength=10}] strength 1 9 true
            effect @a[scores={final_strength=11}] strength 1 10 true
            effect @a[scores={final_strength=12}] strength 1 11 true
            effect @a[scores={final_strength=13}] strength 1 12 true
            effect @a[scores={final_strength=14}] strength 1 13 true
            effect @a[scores={final_strength=15}] strength 1 14 true
            effect @a[scores={final_strength=16}] strength 1 15 true
            effect @a[scores={final_strength=17}] strength 1 16 true
            effect @a[scores={final_strength=18}] strength 1 17 true
            effect @a[scores={final_strength=19}] strength 1 18 true
            effect @a[scores={final_strength=20..}] strength 1 19 true

            effect @a[scores={final_strength=-1}] weakness 1 0 true
            effect @a[scores={final_strength=-2}] weakness 1 1 true
            effect @a[scores={final_strength=-3}] weakness 1 2 true
            effect @a[scores={final_strength=-4}] weakness 1 3 true
            effect @a[scores={final_strength=-5}] weakness 1 4 true
            effect @a[scores={final_strength=-6}] weakness 1 5 true
            effect @a[scores={final_strength=-7}] weakness 1 6 true
            effect @a[scores={final_strength=-8}] weakness 1 7 true
            effect @a[scores={final_strength=-9}] weakness 1 8 true
            effect @a[scores={final_strength=-10}] weakness 1 9 true
            effect @a[scores={final_strength=-11}] weakness 1 10 true
            effect @a[scores={final_strength=-12}] weakness 1 11 true
            effect @a[scores={final_strength=-13}] weakness 1 12 true
            effect @a[scores={final_strength=-14}] weakness 1 13 true
            effect @a[scores={final_strength=-15}] weakness 1 14 true
            effect @a[scores={final_strength=-16}] weakness 1 15 true
            effect @a[scores={final_strength=-17}] weakness 1 16 true
            effect @a[scores={final_strength=-18}] weakness 1 17 true
            effect @a[scores={final_strength=-19}] weakness 1 18 true
            effect @a[scores={final_strength=..-20}] weakness 1 255 true


    #Конечная защита
        scoreboard players set @e final_resist 0
        scoreboard players add @e[scores={resist_up_a=1..}] final_resist 1
        scoreboard players add @e[scores={resist_up_b=1..}] final_resist 2
        scoreboard players add @e[scores={resist_up_c=1..}] final_resist 3
        scoreboard players add @e[scores={resist_up_d=1..}] final_resist 5
        scoreboard players add @a[scores={religion=17}, tag=low_hp] final_resist 1
        scoreboard players add @a[scores={religion=17}, tag=very_low_hp] final_resist 1
        scoreboard players add @a[hasitem={item=arx:amul_of_desert_shield, location=slot.armor.legs}, tag=low_hp] final_resist 1
        scoreboard players add @a[hasitem={item=arx:amul_of_desert_shield, location=slot.armor.legs}, tag=very_low_hp] final_resist 2

        # Исполнение
            effect @e[scores={final_resist=1}] resistance 1 0 true
            effect @e[scores={final_resist=2}] resistance 1 1 true
            effect @e[scores={final_resist=3}] resistance 1 2 true
            effect @e[scores={final_resist=4}] resistance 1 3 true
            effect @e[scores={final_resist=5}] resistance 1 4 true
            effect @e[scores={final_resist=6}] resistance 1 5 true
            effect @e[scores={final_resist=7}] resistance 1 6 true
            effect @e[scores={final_resist=8}] resistance 1 7 true
            effect @e[scores={final_resist=9..}] resistance 1 8 true