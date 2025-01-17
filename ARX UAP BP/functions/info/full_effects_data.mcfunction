tellraw @s { "rawtext": [ { "text": "§6=====§aВСЕ ВОЗДЕЙСТВИЯ НА ИГРОКА§6=====" } ] }
tellraw @s { "rawtext": [ { "text": "§6=====§aСкорость:§6=====" } ] }

    tellraw @s[scores={speed_skill=2..3}] { "rawtext": [ { "text": "§a+1§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=4..5}] { "rawtext": [ { "text": "§a+2§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=6..}] { "rawtext": [ { "text": "§a+3§f (Базовая ловкость)" } ] }

    tellraw @s[scores={trailblazer_skill=2..3}] { "rawtext": [ { "text": "§a+1§f (навык Первопроходца)" } ] }
    tellraw @s[scores={trailblazer_skill=4..5}] { "rawtext": [ { "text": "§a+2§f (навык Первопроходца)" } ] }
    tellraw @s[scores={trailblazer_skill=6..}] { "rawtext": [ { "text": "§a+3§f (навык Первопроходца)" } ] }

    tellraw @s[scores={pois_cond=2}] { "rawtext": [ { "text": "§c-1§f (Отравление 2 ур.)" } ] }
    tellraw @s[scores={pois_cond=3}] { "rawtext": [ { "text": "§c-2§f (Отравление 3 ур.)" } ] }
    tellraw @s[scores={pois_cond=4}] { "rawtext": [ { "text": "§c-3§f (Отравление 4 ур.)" } ] }

    tellraw @s[scores={religion=7}, tag=low_hp] { "rawtext": [ { "text": "§a+1§f (Завоеватель Палласа + низкое здоровье)" } ] }
    tellraw @s[tag=very_low_hp, scores={religion=7}, tag=low_hp] { "rawtext": [ { "text": "§a+2§f (Завоеватель Палласа + очень низкое здоровье)" } ] }

    tellraw @s[scores={religion=8..9}] { "rawtext": [ { "text": "§a+1§f (Стрелок (или выше) Палласа)" } ] }
    tellraw @s[scores={religion=18..19}] { "rawtext": [ { "text": "§a+1§f (Рейнджер (или выше) Пиреса)" } ] }

    tellraw @s[scores={religion=9}, tag=low_bright] { "rawtext": [ { "text": "§a+1§f (Ассасин Палласа + низкое освещение)" } ] }
    tellraw @s[scores={religion=19}, tag=high_bright] { "rawtext": [ { "text": "§a+1§f (Страж леса Пиреса + высокое освещение)" } ] }

    tellraw @s[scores={poit_speed_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие зелья)" } ] }
    tellraw @s[scores={poit_speed_b=1..}] { "rawtext": [ { "text": "§a+2§f (Действие зелья)" } ] }

    tellraw @s[scores={jump_speed_up_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_b=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_c=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_d=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_e=1..}] { "rawtext": [ { "text": "§a+3§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_f=1..}] { "rawtext": [ { "text": "§a+5§f (Действие заклинания)" } ] }

    tellraw @s[scores={armor_assas_dmg=1..}] { "rawtext": [ { "text": "§a+4§f (Бонус доспеха Ассасина Палласа при уроне)" } ] }
    tellraw @s[scores={armor_ranger_dmg=1..}] { "rawtext": [ { "text": "§a+2§f (Бонус доспеха Рейнджера Пиреса при уроне)" } ] }
    tellraw @s[scores={armor_conq_dmg=1..}] { "rawtext": [ { "text": "§a+1§f (Бонус доспеха Завоевателя Палласа при уроне)" } ] }

    tellraw @s[scores={heavy_result=1..}] { "rawtext": [ { "text": "§c-" }, { "score": {"name": "@s", "objective": "heavy_result" } }, { "text": "§f (Перегруз)" } ] }
    
    tellraw @s[hasitem={item=arx:ring_durasteel_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_caryite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_toliriite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_malafiotironite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_malafiotironite_chrysolite_max, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_lamenite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:shackles, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-4§f (Действие кандалов)" } ] }
    tellraw @s[hasitem={item=arx:medical_leg_splint, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-2§f (Действие медицинской шины)" } ] }

    tellraw @s[scores={is_day=0}, hasitem={item=arx:raven_armor, location=slot.armor.chest}] { "rawtext": [ { "text": "§a+1§f (Бонус доспеха Ворона)" } ] }

    tellraw @s[scores={blocking=21..}] { "rawtext": [ { "text": "§c-1§f (Вы блокируете)" } ] }
    
    tellraw @s[scores={water_delay=201..400}] { "rawtext": [ { "text": "§c-1§f (Вы немного промокли)" } ] }
    tellraw @s[scores={water_delay=401..}] { "rawtext": [ { "text": "§c-3§f (Вы сильно промокли)" } ] }

    tellraw @s[scores={freezing=1001..2400}] { "rawtext": [ { "text": "§c-3§f (Вы сильно обморозились)" } ] }
    tellraw @s[scores={freezing=-2400..-1001}] { "rawtext": [ { "text": "§c-3§f (Вы сильно перегрелись)" } ] }

    tellraw @s[scores={stress_cond=3}] { "rawtext": [ { "text": "§c-1§f (Стресс 3 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=0}] { "rawtext": [ { "text": "§c-3§f (Стресс 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=1..}] { "rawtext": [ { "text": "§c-2§f (Стресс 4 ур. при черте <сознательный>)" } ] }

    tellraw @s[scores={stress_cond=-3}] { "rawtext": [ { "text": "§a+1§f (Счастье 3 ур.)" } ] }
    tellraw @s[scores={stress_cond=-4}] { "rawtext": [ { "text": "§a+2§f (Счастье 4 ур.)" } ] }
    
    tellraw @s[scores={dwarf_curse=1}] { "rawtext": [ { "text": "§c-2§f (Проклятие карлика)" } ] }


    tellraw @s[scores={ill_cancer=1..4800}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_cancer=1..1200}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_mild_cold=9001..10000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_severe_cold=12201..13400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_severe_cold=8001..13400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=16301..18000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_pneumonia=15000..16300}] { "rawtext": [ { "text": "§c-4§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_pneumonia=11200..15000}] { "rawtext": [ { "text": "§c-2§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=10000..11200}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_flu=38001..39000}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] } 
    tellraw @s[scores={ill_flu=30000..38000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_helminth=1}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_appendicitis=2401..5000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_appendicitis=1201..2400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_appendicitis=1..1200}] { "rawtext": [ { "text": "§c-5§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_broken_leg=36001..72000}] { "rawtext": [ { "text": "§c-3§f (Сломаная нога)" } ] }
    tellraw @s[scores={ill_broken_leg=1..36000}] { "rawtext": [ { "text": "§c-2§f (Сломаная нога)" } ] }
    tellraw @s[scores={ill_anal_fissure=1..2400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }

    tellraw @s { "rawtext": [ { "text": "ИТОГО: скорость " }, { "score": {"name": "@s", "objective": "final_speed" } } ] }

tellraw @s { "rawtext": [ { "text": "§6=====§aКопание:§6=====" } ] }

    tellraw @s[scores={speed_skill=1..2}] { "rawtext": [ { "text": "§a+1§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=3..4}] { "rawtext": [ { "text": "§a+2§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=5..6}] { "rawtext": [ { "text": "§a+3§f (Базовая ловкость)" } ] }

    tellraw @s[scores={strength_skill=1..2}] { "rawtext": [ { "text": "§a+1§f (Базовая сила)" } ] }
    tellraw @s[scores={strength_skill=3..4}] { "rawtext": [ { "text": "§a+2§f (Базовая сила)" } ] }
    tellraw @s[scores={strength_skill=5..6}] { "rawtext": [ { "text": "§a+3§f (Базовая сила)" } ] }
    
    tellraw @s[scores={c_miner=1..}, tag=in_hot_deep] { "rawtext": [ { "text": "§a+1§f (Действие черты <Шахтер>)" } ] }
    tellraw @s[scores={c_miner=1..}, tag=in_safe_zone] { "rawtext": [ { "text": "§a+1§f (Действие черты <Шахтер>)" } ] }
    tellraw @s[scores={c_miner=1..}, tag=!in_safe_zone, tag=!in_hot_deep] { "rawtext": [ { "text": "§c-1§f (Действие черты <Шахтер>)" } ] }

    tellraw @s[scores={pois_cond=2}] { "rawtext": [ { "text": "§c-1§f (Отравление 2 ур.)" } ] }
    tellraw @s[scores={pois_cond=3}] { "rawtext": [ { "text": "§c-2§f (Отравление 3 ур.)" } ] }
    tellraw @s[scores={pois_cond=4}] { "rawtext": [ { "text": "§c-3§f (Отравление 4 ур.)" } ] }

    tellraw @s[hasitem={item=arx:ring_caryite_topaz, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_toliriite_topaz, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_lamenite_topaz, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+3§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:shackles, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-1§f (Действие кандалов)" } ] }
    tellraw @s[hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] { "rawtext": [ { "text": "§c-1§f (Действие медицинской шины)" } ] }

    tellraw @s[scores={jump_speed_up_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_b=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_c=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_d=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_e=1..}] { "rawtext": [ { "text": "§a+3§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_f=1..}] { "rawtext": [ { "text": "§a+5§f (Действие заклинания)" } ] }

    tellraw @s[scores={poit_mining_u=1..}] { "rawtext": [ { "text": "§a+1§f (Действие зелья)" } ] }
    tellraw @s[scores={poit_mining_d=1..}] { "rawtext": [ { "text": "§c-1§f (Действие зелья)" } ] }

    tellraw @s[scores={heavy_result=1..}] { "rawtext": [ { "text": "§c-" }, { "score": {"name": "@s", "objective": "heavy_result" } }, { "text": "§f (Перегруз)" } ] }

    tellraw @s[scores={water_delay=201..400}] { "rawtext": [ { "text": "§c-1§f (Вы немного промокли)" } ] }
    tellraw @s[scores={water_delay=401..}] { "rawtext": [ { "text": "§c-3§f (Вы сильно промокли)" } ] }

    tellraw @s[scores={freezing=1001..2400}] { "rawtext": [ { "text": "§c-3§f (Вы сильно обморозились)" } ] }
    tellraw @s[scores={freezing=-2400..-1001}] { "rawtext": [ { "text": "§c-3§f (Вы сильно перегрелись)" } ] }

    tellraw @s[scores={stress_cond=3}] { "rawtext": [ { "text": "§c-1§f (Стресс 3 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=0}] { "rawtext": [ { "text": "§c-3§f (Стресс 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=1..}] { "rawtext": [ { "text": "§c-2§f (Стресс 4 ур. при черте <сознательный>)" } ] }
    tellraw @s[scores={stress_cond=-4}] { "rawtext": [ { "text": "§a+1§f (Счастье 4 ур.)" } ] }

    tellraw @s[scores={dwarf_curse=1}] { "rawtext": [ { "text": "§a+1§f (Проклятие карлика)" } ] }


    tellraw @s[scores={ill_cancer=1..4800}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_cancer=1..1200}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_mild_cold=9001..10000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_severe_cold=12201..13400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_severe_cold=8001..13400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=16301..18000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_pneumonia=15000..16300}] { "rawtext": [ { "text": "§c-4§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_pneumonia=11200..15000}] { "rawtext": [ { "text": "§c-2§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=10000..11200}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_flu=38001..39000}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] } 
    tellraw @s[scores={ill_flu=30000..38000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_helminth=1}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_appendicitis=2401..5000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_appendicitis=1201..2400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_appendicitis=1..1200}] { "rawtext": [ { "text": "§c-5§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_broken_arm=36001..72000}] { "rawtext": [ { "text": "§c-3§f (Сломаная рука)" } ] }
    tellraw @s[scores={ill_broken_arm=1..36000}] { "rawtext": [ { "text": "§c-2§f (Сломаная рука)" } ] }

    tellraw @s { "rawtext": [ { "text": "ИТОГО: копание " }, { "score": {"name": "@s", "objective": "final_mining" } } ] }

tellraw @s { "rawtext": [ { "text": "§6=====§aПрыжок:§6=====" } ] }

    tellraw @s[scores={speed_skill=2..3}] { "rawtext": [ { "text": "§a+1§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=4..5}] { "rawtext": [ { "text": "§a+2§f (Базовая ловкость)" } ] }
    tellraw @s[scores={speed_skill=6..}] { "rawtext": [ { "text": "§a+3§f (Базовая ловкость)" } ] }

    tellraw @s[scores={poit_jump_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие зелья)" } ] }
    tellraw @s[scores={poit_jump_b=1..}] { "rawtext": [ { "text": "§a+2§f (Действие зелья)" } ] }

    tellraw @s[scores={pois_cond=2}] { "rawtext": [ { "text": "§c-1§f (Отравление 2 ур.)" } ] }
    tellraw @s[scores={pois_cond=3}] { "rawtext": [ { "text": "§c-2§f (Отравление 3 ур.)" } ] }
    tellraw @s[scores={pois_cond=4}] { "rawtext": [ { "text": "§c-3§f (Отравление 4 ур.)" } ] }

    tellraw @s[scores={heavy_result=1..}] { "rawtext": [ { "text": "§c-" }, { "score": {"name": "@s", "objective": "heavy_result" } }, { "text": "§f (Перегруз)" } ] }

    tellraw @s[scores={jump_speed_up_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_b=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_c=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_d=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_e=1..}] { "rawtext": [ { "text": "§a+3§f (Действие заклинания)" } ] }
    tellraw @s[scores={jump_speed_up_f=1..}] { "rawtext": [ { "text": "§a+5§f (Действие заклинания)" } ] }

    tellraw @s[scores={stress_cond=-4}] { "rawtext": [ { "text": "§a+1§f (Счастье 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=0}] { "rawtext": [ { "text": "§c-3§f (Стресс 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=1..}] { "rawtext": [ { "text": "§c-2§f (Стресс 4 ур. при черте <сознательный>)" } ] }

    tellraw @s[scores={religion=9}] { "rawtext": [ { "text": "§a+1§f (Ассасин Палласа)" } ] }
    tellraw @s[scores={religion=19}] { "rawtext": [ { "text": "§a+1§f (Страж леса Пиреса)" } ] }

    tellraw @s[scores={armor_conq_dmg=1..}] { "rawtext": [ { "text": "§a+1§f (Бонус доспеха Завоевателя Палласа при уроне)" } ] }

    tellraw @s[hasitem={item=arx:ring_gold_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_caryite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_toliriite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_malafiotironite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_malafiotironite_chrysolite_max, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:ring_lamenite_chrysolite, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+2§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:shackles, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-10§f (Действие кандалов)" } ] }
    tellraw @s[hasitem={item=arx:medical_leg_splint, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-10§f (Действие медицинской шины)" } ] }

    tellraw @s[scores={ill_cancer=1..4800}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_cancer=1..1200}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_mild_cold=9001..10000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_severe_cold=12201..13400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_severe_cold=8001..13400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=16301..18000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_pneumonia=15000..16300}] { "rawtext": [ { "text": "§c-4§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_pneumonia=11200..15000}] { "rawtext": [ { "text": "§c-2§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=10000..11200}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_flu=38001..39000}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] } 
    tellraw @s[scores={ill_flu=30000..38000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_helminth=1}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_appendicitis=2401..5000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_appendicitis=1201..2400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_appendicitis=1..1200}] { "rawtext": [ { "text": "§c-5§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_broken_leg=36001..72000}] { "rawtext": [ { "text": "§c-3§f (Сломаная нога)" } ] }
    tellraw @s[scores={ill_broken_leg=1..36000}] { "rawtext": [ { "text": "§c-2§f (Сломаная нога)" } ] }
    tellraw @s[scores={ill_anal_fissure=1..2400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }

    tellraw @s[scores={final_jump=0..}] { "rawtext": [ { "text": "ИТОГО: прыжок " }, { "score": {"name": "@s", "objective": "final_jump" } } ] }
    tellraw @s[scores={final_jump=..-1}] { "rawtext": [ { "text": "ИТОГО: прыжок " }, { "score": {"name": "@s", "objective": "final_jump" } }, { "text": " (округляется до 0)" } ] }

tellraw @s { "rawtext": [ { "text": "§6=====§aСила:§6=====" } ] }

    tellraw @s[scores={strength_skill=2..3}] { "rawtext": [ { "text": "§a+1§f (Базовая сила)" } ] }
    tellraw @s[scores={strength_skill=4..5}] { "rawtext": [ { "text": "§a+2§f (Базовая сила)" } ] }
    tellraw @s[scores={strength_skill=6..}] { "rawtext": [ { "text": "§a+3§f (Базовая сила)" } ] }

    tellraw @s[scores={might_skill=2..3}] { "rawtext": [ { "text": "§a+1§f (Могущество)" } ] }
    tellraw @s[scores={might_skill=4..5}] { "rawtext": [ { "text": "§a+2§f (Могущество)" } ] }
    tellraw @s[scores={might_skill=6..}] { "rawtext": [ { "text": "§a+3§f (Могущество)" } ] }

    tellraw @s[hasitem={item=arx:lamenite_plate_armor, location=slot.armor.chest}, tag=low_hp] { "rawtext": [ { "text": "§a+1§f (Бонус доспеха при низком хп)" } ] }

    tellraw @s[scores={pois_cond=2}] { "rawtext": [ { "text": "§c-1§f (Отравление 2 ур.)" } ] }
    tellraw @s[scores={pois_cond=3}] { "rawtext": [ { "text": "§c-2§f (Отравление 3 ур.)" } ] }
    tellraw @s[scores={pois_cond=4}] { "rawtext": [ { "text": "§c-3§f (Отравление 4 ур.)" } ] }

    tellraw @s[scores={c_loner=1..}, tag=alone] { "rawtext": [ { "text": "§a+1§f (Действие черты <Стеснительный>)" } ] }
    tellraw @s[scores={c_loner=1..}, tag=!alone] { "rawtext": [ { "text": "§c-1§f (Действие черты <Стеснительный>)" } ] }

    tellraw @s[scores={demon_power=1..}] { "rawtext": [ { "text": "§a+1§f (Мощь демона)" } ] }

    tellraw @s[scores={drugs_delay=301..600}] { "rawtext": [ { "text": "§a+1§f (Эффект наркозависимости)" } ] }
    tellraw @s[scores={drugs_delay=2..300}] { "rawtext": [ { "text": "§a+2§f (Эффект наркозависимости)" } ] }

    tellraw @s[hasitem={item=arx:ring_lamenite_ruby, location=slot.armor.feet}] { "rawtext": [ { "text": "§a+1§f (Действие кольца)" } ] }
    tellraw @s[hasitem={item=arx:shackles, location=slot.armor.legs}] { "rawtext": [ { "text": "§c-10§f (Действие кандалов)" } ] }
    tellraw @s[hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] { "rawtext": [ { "text": "§c-3§f (Действие медицинской шины)" } ] }

    tellraw @s[scores={backpack_volume=1..}] { "rawtext": [ { "text": "§c-" }, { "score": {"name": "@s", "objective": "backpack_volume" } }, { "text": "§f (Штраф рюкзака)" } ] }
    tellraw @s[scores={heavy_result=1..}] { "rawtext": [ { "text": "§c-" }, { "score": {"name": "@s", "objective": "heavy_result" } }, { "text": "§f (Перегруз)" } ] }

    tellraw @s[scores={resist_up_d=1..}] { "rawtext": [ { "text": "§c-1000§f (Действие заклинания)" } ] }

    tellraw @s[scores={water_delay=201..400}] { "rawtext": [ { "text": "§c-1§f (Вы немного промокли)" } ] }
    tellraw @s[scores={water_delay=401..}] { "rawtext": [ { "text": "§c-3§f (Вы сильно промокли)" } ] }

    tellraw @s[scores={freezing=1001..2400}] { "rawtext": [ { "text": "§c-3§f (Вы сильно обморозились)" } ] }
    tellraw @s[scores={freezing=-2400..-1001}] { "rawtext": [ { "text": "§c-3§f (Вы сильно перегрелись)" } ] }

    tellraw @s[scores={stress_cond=-4}] { "rawtext": [ { "text": "§a+1§f (Счастье 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=3}] { "rawtext": [ { "text": "§c-1§f (Стресс 3 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=0}] { "rawtext": [ { "text": "§c-3§f (Стресс 4 ур.)" } ] }
    tellraw @s[scores={stress_cond=4, c_conscious=1..}] { "rawtext": [ { "text": "§c-2§f (Стресс 4 ур. при черте <стестнительный>)" } ] }

    tellraw @s[scores={blocking=21..}] { "rawtext": [ { "text": "§c-1000§f (Вы блокируете)" } ] }

    tellraw @s[scores={attack_weakness=20..39}] { "rawtext": [ { "text": "§c-1§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=40..59}] { "rawtext": [ { "text": "§c-2§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=60..79}] { "rawtext": [ { "text": "§c-3§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=80..99}] { "rawtext": [ { "text": "§c-4§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=100..119}] { "rawtext": [ { "text": "§c-5§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=120..139}] { "rawtext": [ { "text": "§c-6§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=140..159}] { "rawtext": [ { "text": "§c-7§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=160..179}] { "rawtext": [ { "text": "§c-8§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=180..199}] { "rawtext": [ { "text": "§c-9§f (Откат атаки)" } ] }
    tellraw @s[scores={attack_weakness=200..}] { "rawtext": [ { "text": "§c-1000§f (Откат атаки)" } ] }

    tellraw @s[scores={dwarf_curse=1}] { "rawtext": [ { "text": "§c-2§f (Проклятие карлика)" } ] }

    tellraw @s[scores={ill_cancer=1..4800}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_cancer=1..1200}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_mild_cold=9001..10000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_severe_cold=12201..13400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_severe_cold=8001..13400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=16301..18000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_pneumonia=15000..16300}] { "rawtext": [ { "text": "§c-4§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_pneumonia=11200..15000}] { "rawtext": [ { "text": "§c-2§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_pneumonia=10000..11200}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_flu=38001..39000}] { "rawtext": [ { "text": "§c-3§f (Тяжёлая фаза болезни)" } ] } 
    tellraw @s[scores={ill_flu=30000..38000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_helminth=1}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] } 
    tellraw @s[scores={ill_appendicitis=2401..5000}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }
    tellraw @s[scores={ill_appendicitis=1201..2400}] { "rawtext": [ { "text": "§c-2§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_appendicitis=1..1200}] { "rawtext": [ { "text": "§c-5§f (Тяжёлая фаза болезни)" } ] }
    tellraw @s[scores={ill_broken_arm=36001..72000}] { "rawtext": [ { "text": "§c-3§f (Сломаная рука)" } ] }
    tellraw @s[scores={ill_broken_arm=1..36000}] { "rawtext": [ { "text": "§c-2§f (Сломаная рука)" } ] }
    tellraw @s[scores={ill_anal_fissure=1..2400}] { "rawtext": [ { "text": "§c-1§f (Вы болеете)" } ] }

    tellraw @s { "rawtext": [ { "text": "ИТОГО: сила " }, { "score": {"name": "@s", "objective": "final_strength" } } ] }

tellraw @s { "rawtext": [ { "text": "§6=====§aЗащита:§6=====" } ] }

    tellraw @s[scores={resist_up_a=1..}] { "rawtext": [ { "text": "§a+1§f (Действие заклинания)" } ] }
    tellraw @s[scores={resist_up_b=1..}] { "rawtext": [ { "text": "§a+2§f (Действие заклинания)" } ] }
    tellraw @s[scores={resist_up_c=1..}] { "rawtext": [ { "text": "§a+3§f (Действие заклинания)" } ] }
    tellraw @s[scores={resist_up_d=1..}] { "rawtext": [ { "text": "§a+5§f (Действие заклинания)" } ] }

    tellraw @s[scores={religion=17}, tag=low_hp] { "rawtext": [ { "text": "§a+1§f (Паладин Пиреса + низкое здоровье)" } ] }
    tellraw @s[scores={religion=17}, tag=very_low_hp] { "rawtext": [ { "text": "§a+1§f (Паладин Пиреса + очень низкое здоровье)" } ] }

    tellraw @s[hasitem={item=arx:amul_of_desert_shield, location=slot.armor.legs}, tag=low_hp] { "rawtext": [ { "text": "§a+1§f (Действие пустынного щита)" } ] }
    

    tellraw @s { "rawtext": [ { "text": "ИТОГО: защита " }, { "score": {"name": "@s", "objective": "final_resist" } } ] }

tellraw @s { "rawtext": [ { "text": "§6=====§aЛампадное масло:§6=====" } ] }
    tellraw @s { "rawtext": [ { "text": "Масла осталось: " }, { "score": {"name": "@s", "objective": "lamp_oil_prc" } }, { "text": "%" } ] }

tellraw @s { "rawtext": [{ "text": "§6=====§aЗагруженность§6=====" } ] } 
    tellraw @s[scores={heavy_result=1..}] { "rawtext": [{ "text": "Загруженность (§4текущая§f/§4лимит§f): §4" }, { "score": {"name": "@s", "objective": "heavy" } }, { "text": "§f/§4" }, { "score": {"name": "@s", "objective": "heavy_compens" } } ] } 
    tellraw @s[scores={heavy_result=0}] { "rawtext": [{ "text": "Загруженность (§eтекущая§f/§eлимит§f): §e" }, { "score": {"name": "@s", "objective": "heavy" } }, { "text": "§f/§e" }, { "score": {"name": "@s", "objective": "heavy_compens" } } ] } 
    tellraw @s[scores={heavy_result=..-1}] { "rawtext": [{ "text": "Загруженность (§aтекущая§f/§aлимит§f): §a" }, { "score": {"name": "@s", "objective": "heavy" } }, { "text": "§f/§a" }, { "score": {"name": "@s", "objective": "heavy_compens" } } ] } 
    tellraw @s[scores={backpack_volume=1..}] { "rawtext": [{ "text": "Объём сумок: §a" }, { "score": {"name": "@s", "objective": "backpack_volume" } } ] } 


# tellraw @s { "rawtext": [ { "text": "§6=====§bМана:§6=====" } ] }
#     tellraw @s { "rawtext": [ { "text": "" }, { "score": {"name": "@s", "objective": "mp_const" } } ] }
#     tellraw @s { "rawtext": [ { "text": "ИТОГО: мана " }, { "score": {"name": "@s", "objective": "final_resist" } } ] }

# tellraw @s { "rawtext": [ { "text": "§6=====§bРегенерация очка маны в секундах:§6=====" } ] }
#     tellraw @s { "rawtext": [ { "text": "§a+30§f (По умолчанию)" } ] }
#     tellraw @s { "rawtext": [ { "text": "ИТОГО: регенерация маны (сек) " }, { "score": {"name": "@s", "objective": "final_resist" } } ] }

tellraw @s { "rawtext": [ { "text": " " } ] }