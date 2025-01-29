#КОНЕЧНЫЕ ЭФФЕКТЫ - 10tcs

    #Конечное копание
        scoreboard players set @a final_mining 0

        scoreboard players add @a[scores={speed_skill=1..2}] final_mining 1
        scoreboard players add @a[scores={speed_skill=3..4}] final_mining 2
        scoreboard players add @a[scores={speed_skill=5..6}] final_mining 3

        scoreboard players add @a[scores={strength_skill=1..2}] final_mining 1
        scoreboard players add @a[scores={strength_skill=3..4}] final_mining 2
        scoreboard players add @a[scores={strength_skill=5..6}] final_mining 3

        scoreboard players add @a[scores={c_miner=1..}, tag=in_hot_deep] final_mining 1
        scoreboard players add @a[scores={c_miner=1..}, tag=in_safe_zone] final_mining 1
        scoreboard players add @a[scores={c_miner=1..}, tag=!in_safe_zone, tag=!in_hot_deep] final_mining -1

        scoreboard players add @a[scores={pois_cond=2}] final_mining -1
        scoreboard players add @a[scores={pois_cond=3}] final_mining -2
        scoreboard players add @a[scores={pois_cond=4..}] final_mining -3

        scoreboard players add @a[hasitem={item=arx:ring_caryite_topaz, location=slot.armor.feet}] final_mining 1
        scoreboard players add @a[hasitem={item=arx:ring_toliriite_topaz, location=slot.armor.feet}] final_mining 2
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_topaz, location=slot.armor.feet}] final_mining 3
        scoreboard players add @a[hasitem={item=arx:shackles, location=slot.armor.legs}] final_mining -1
        scoreboard players add @a[hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] final_mining -3

        scoreboard players add @a[scores={jump_speed_up_a=1..}] final_mining 1
        scoreboard players add @a[scores={jump_speed_up_b=1..}] final_mining 1
        scoreboard players add @a[scores={jump_speed_up_c=1..}] final_mining 2
        scoreboard players add @a[scores={jump_speed_up_d=1..}] final_mining 2
        scoreboard players add @a[scores={jump_speed_up_e=1..}] final_mining 3
        scoreboard players add @a[scores={jump_speed_up_f=1..}] final_mining 5

        scoreboard players add @a[scores={poit_mining_u=1..}] final_mining 1
        scoreboard players add @a[scores={poit_mining_d=1..}] final_mining -1
        execute as @a[scores={heavy_result=1..}] run scoreboard players operation @s final_mining -= @s heavy_result

        scoreboard players add @a[scores={water_delay=201..}] final_mining -1
        scoreboard players add @a[scores={water_delay=401..}] final_mining -2
        scoreboard players add @a[scores={freezing=1001..2400}] final_mining -3
        scoreboard players add @a[scores={freezing=-2400..-1001}] final_mining -3
        
        scoreboard players add @a[scores={stress_cond=3}] final_mining -1
        scoreboard players add @a[scores={stress_cond=4, c_conscious=0}] final_mining -3
        scoreboard players add @a[scores={stress_cond=4, c_conscious=1..}] final_mining -2
        scoreboard players add @a[scores={stress_cond=-4}] final_mining 1

        scoreboard players add @a[scores={dwarf_curse=1}] final_mining 1

        scoreboard players add @a[has_property={arx:is_knocked=1..}] final_mining -1000

        #взаимодействие болезней
            scoreboard players add @a[scores={ill_cancer=1..4800}] final_mining -1
            scoreboard players add @a[scores={ill_cancer=1..1200}] final_mining -3
            scoreboard players add @a[scores={ill_mild_cold=9001..10000}] final_mining -1
            scoreboard players add @a[scores={ill_severe_cold=12201..13400}] final_mining -2
            scoreboard players add @a[scores={ill_severe_cold=8001..13400}] final_mining -1
            scoreboard players add @a[scores={ill_pneumonia=16301..18000}] final_mining -1 
            scoreboard players add @a[scores={ill_pneumonia=15000..16300}] final_mining -4
            scoreboard players add @a[scores={ill_pneumonia=11200..15000}] final_mining -2
            scoreboard players add @a[scores={ill_pneumonia=10000..11200}] final_mining -1
            scoreboard players add @a[scores={ill_flu=38001..39000}] final_mining -3 
            scoreboard players add @a[scores={ill_flu=30000..38000}] final_mining -1
            scoreboard players add @a[scores={ill_helminth=1}] final_mining -1 
            scoreboard players add @a[scores={ill_appendicitis=2401..5000}] final_mining -1
            scoreboard players add @a[scores={ill_appendicitis=1201..2400}] final_mining -2
            scoreboard players add @a[scores={ill_appendicitis=1..1200}] final_mining -5
            scoreboard players add @a[scores={ill_broken_arm=36001..72000}] final_mining -3
            scoreboard players add @a[scores={ill_broken_arm=1..36000}] final_mining -2


        effect @a[scores={final_mining=1}] haste 1 0 true
        effect @a[scores={final_mining=2}] haste 1 1 true
        effect @a[scores={final_mining=3}] haste 1 2 true
        effect @a[scores={final_mining=4}] haste 1 3 true
        effect @a[scores={final_mining=5}] haste 1 4 true
        effect @a[scores={final_mining=6}] haste 1 5 true
        effect @a[scores={final_mining=7}] haste 1 6 true
        effect @a[scores={final_mining=8}] haste 1 7 true
        effect @a[scores={final_mining=9}] haste 1 8 true
        effect @a[scores={final_mining=10}] haste 1 9 true
        effect @a[scores={final_mining=11}] haste 1 10 true
        effect @a[scores={final_mining=12}] haste 1 11 true
        effect @a[scores={final_mining=13}] haste 1 12 true
        effect @a[scores={final_mining=14}] haste 1 13 true
        effect @a[scores={final_mining=15}] haste 1 14 true
        effect @a[scores={final_mining=16}] haste 1 15 true
        effect @a[scores={final_mining=17}] haste 1 16 true
        effect @a[scores={final_mining=18}] haste 1 17 true
        effect @a[scores={final_mining=19}] haste 1 18 true
        effect @a[scores={final_mining=20..}] haste 1 19 true

        effect @a[scores={final_mining=-1}] mining_fatigue 1 0 true
        effect @a[scores={final_mining=-2}] mining_fatigue 1 1 true
        effect @a[scores={final_mining=-3}] mining_fatigue 1 2 true
        effect @a[scores={final_mining=-4}] mining_fatigue 1 3 true
        effect @a[scores={final_mining=-5}] mining_fatigue 1 4 true
        effect @a[scores={final_mining=-6}] mining_fatigue 1 5 true
        effect @a[scores={final_mining=-7}] mining_fatigue 1 6 true
        effect @a[scores={final_mining=-8}] mining_fatigue 1 7 true
        effect @a[scores={final_mining=-9}] mining_fatigue 1 8 true
        effect @a[scores={final_mining=-10}] mining_fatigue 1 9 true
        effect @a[scores={final_mining=-11}] mining_fatigue 1 10 true
        effect @a[scores={final_mining=-12}] mining_fatigue 1 11 true
        effect @a[scores={final_mining=-13}] mining_fatigue 1 12 true
        effect @a[scores={final_mining=-14}] mining_fatigue 1 13 true
        effect @a[scores={final_mining=-15}] mining_fatigue 1 14 true
        effect @a[scores={final_mining=-16}] mining_fatigue 1 15 true
        effect @a[scores={final_mining=-17}] mining_fatigue 1 16 true
        effect @a[scores={final_mining=-18}] mining_fatigue 1 17 true
        effect @a[scores={final_mining=-19}] mining_fatigue 1 18 true
        effect @a[scores={final_mining=..-20}] mining_fatigue 1 255 true
