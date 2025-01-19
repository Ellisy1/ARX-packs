# Запускаем функцию 20tcs на движке NAP
    function core_parts_NAP/20ticks_NAP

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

#Помощь богов
    execute @a[scores={custom_random=500..505, religion=1..9}, tag=low_hp] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aПаллас помогает вам!" } ] }
    execute @a[scores={custom_random=500..505, religion=1..9}, tag=low_hp] ~ ~ ~ effect @s regeneration 10 1
    execute @a[scores={custom_random=500..520, religion=1..9}, tag=very_low_hp] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aПаллас помогает вам!" } ] }
    execute @a[scores={custom_random=500..520, religion=1..9}, tag=very_low_hp] ~ ~ ~ effect @s regeneration 10 1

    execute @a[scores={custom_random=500..505, religion=11..19}, tag=low_hp] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aПирес помогает вам!" } ] }
    execute @a[scores={custom_random=500..505, religion=11..19}, tag=low_hp] ~ ~ ~ effect @s regeneration 10 1
    execute @a[scores={custom_random=500..520, religion=11..19}, tag=very_low_hp] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§aПирес помогает вам!" } ] }
    execute @a[scores={custom_random=500..520, religion=11..19}, tag=very_low_hp] ~ ~ ~ effect @s regeneration 10 1
    
#Урон по призраку
    damage @a[m=!spectator, scores={class=1}, tag=in_water, tag=!in_rain] 3
    damage @a[m=!spectator, scores={class=1}, tag=in_rain, tag=!holding_umbrella, tag=!amul_sapphire] 1
    damage @a[m=!spectator, scores={class=1, is_day=1}, tag=!underground, tag=!holding_umbrella] 1

#Наркотики
    scoreboard players add @a[m=!spectator, scores={drugs_delay=1..}] drugs_delay -1
    tellraw @a[scores={drugs_delay=1200}] { "rawtext": [{ "text": "§l§6Хочется фиоликса!" } ] } 
    tellraw @a[scores={drugs_delay=600}] { "rawtext": [{ "text": "§l§4Очень хочется фиоликса!" } ] } 
    title @a[scores={drugs_delay=1..300}] title §l§4ФИОЛИКС

    scoreboard players add @a[m=!spectator, scores={drugs_delay=601..1200}] stress 2
    scoreboard players add @a[m=!spectator, scores={drugs_delay=301..600}] stress 6
    scoreboard players add @a[m=!spectator, scores={drugs_delay=2..300}] stress 16

    camerashake add @a[m=!spectator, scores={drugs_delay=601..1200}] 0.03 1 rotational
    camerashake add @a[m=!spectator, scores={drugs_delay=301..600}] 0.30 1 rotational
    camerashake add @a[m=!spectator, scores={drugs_delay=2..300}] 1.0 1 rotational

    execute @a[scores={drugs_delay=1}] ~ ~ ~ w @a[scores={verify=2}] @s умер по рп от упортебления наркотиков
    tellraw @a[scores={drugs_delay=1}] { "rawtext": [ { "text": "§4Вы погибли по РП от невыносимой ломки" } ] }
    kill @a[scores={drugs_delay=1}]

#Болезни
    #чих и кашель
        #Случайный чих
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, custom_random=100, custom_random_b=0..250}] ~ ~ ~ function actions/sneeze

        #Болезнь
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, sneeze_prob=1, custom_random=100..105}] ~ ~ ~ function actions/sneeze
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, sneeze_prob=2, custom_random=100..110}] ~ ~ ~ function actions/sneeze
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, sneeze_prob=3, custom_random=100..115}] ~ ~ ~ function actions/sneeze
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, sneeze_prob=4, custom_random=100..120}] ~ ~ ~ function actions/sneeze
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, sneeze_prob=5.., custom_random=100..130}] ~ ~ ~ function actions/sneeze
            scoreboard players set @a sneeze_prob 0

            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, cough_prob=1, custom_random=400..405}] ~ ~ ~ function actions/cough
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, cough_prob=2, custom_random=400..410}] ~ ~ ~ function actions/cough
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, cough_prob=3, custom_random=400..415}] ~ ~ ~ function actions/cough
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, cough_prob=4, custom_random=400..420}] ~ ~ ~ function actions/cough
            execute @a[m=!spectator, tag=!at_respawn_room, scores={class=0, cough_prob=5.., custom_random=400..430}] ~ ~ ~ function actions/cough
            scoreboard players set @a cough_prob 0

    #рак
        #эффекты
            execute @a[tag=!at_respawn_room, scores={ill_cancer=1..1200}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_cancer=1..1200}] ~ ~ ~ scoreboard players add @s stress 1000
            execute @a[scores={ill_cancer=1..1200}] ~ ~ ~ effect @s blindness 10 0
            execute @a[tag=!at_respawn_room, scores={ill_cancer=1201..4800, custom_random=1..10}] ~ ~ ~ damage @s 1 suicide
            execute @a[tag=!at_respawn_room, scores={ill_cancer=4800}] ~ ~ ~ damage @s 1 suicide
            execute @a[tag=!at_respawn_room, scores={ill_cancer=4801..13200, custom_random=1}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_cancer=1..4800}] ~ ~ ~ scoreboard players add @s cough_prob 100
        #сообщения
            execute @a[scores={ill_cancer=1200}] ~ ~ ~ w @s Опухоли ужасно болят. Это невозможно терпеть.
            execute @a[scores={ill_cancer=1200}] ~ ~ ~ scoreboard players add @s stress 5000
            execute @a[scores={ill_cancer=4800}] ~ ~ ~ w @s Опухоли начали более ощутимо болеть.
            execute @a[scores={ill_cancer=4800}] ~ ~ ~ scoreboard players add @s stress 3000
            execute @a[scores={ill_cancer=13200}] ~ ~ ~ w @s Опухоли на теле стали слегка болеть. Да и их стало куда больше.
            execute @a[scores={ill_cancer=13200}] ~ ~ ~ scoreboard players add @s stress 3000
            execute @a[scores={ill_cancer=100000}] ~ ~ ~ w @s Вы замечаете у себя на теле пару твёрдых припухлостей. Они не болят.
            execute @a[scores={ill_cancer=100000}] ~ ~ ~ scoreboard players add @s stress 4000

    #лёгкая простуда
        #получение
            execute @a[scores={custom_random=200..250, ill_mild_cold=!1.., freezing=400..}] ~ ~ ~ scoreboard players set @s ill_mild_cold 14600
        #эффекты
            execute @a[tag=!at_respawn_room, scores={ill_mild_cold=9001..10000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_mild_cold=9001..10000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_mild_cold=9001..13400}] ~ ~ ~ scoreboard players add @s sneeze_prob 1
        #сообщения
            execute @a[scores={ill_mild_cold=9000, gender = 1}] ~ ~ ~ w @s §aЯ выздоровел!
            execute @a[scores={ill_mild_cold=9000, gender = 2}] ~ ~ ~ w @s §aЯ выздоровела!
            execute @a[scores={ill_mild_cold=9000}] ~ ~ ~ scoreboard players add @s stress -1500
            
            execute @a[scores={ill_mild_cold=10000, gender=1}] ~ ~ ~ w @s Мне стало хуже. Кажется, я простудился.
            execute @a[scores={ill_mild_cold=10000, gender=2}] ~ ~ ~ w @s Мне стало хуже. Кажется, я простудилась.
            execute @a[scores={ill_mild_cold=10000}] ~ ~ ~ scoreboard players add @s stress 1500

            execute @a[scores={ill_mild_cold=13400}] ~ ~ ~ w @s Я чувствую себя немного устало.
            execute @a[scores={ill_mild_cold=13400}] ~ ~ ~ scoreboard players add @s stress 500

    #тяжёлая простуда
        #получение
            execute @a[scores={custom_random=300..350, ill_severe_cold=!1.., freezing=1000.., xp_stage=2..}] ~ ~ ~ scoreboard players set @s ill_severe_cold 14600
        #эффекты
            execute @a[scores={ill_severe_cold=1..}] ~ ~ ~ scoreboard players set @s ill_mild_cold 0
            execute @a[tag=!at_respawn_room, scores={ill_severe_cold=12201..13400, custom_random=1..45, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_severe_cold=12201..13400, custom_random=1..45, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_severe_cold=12201..13400, custom_random=50..100, no_hard_ill=0}] ~ ~ ~ camerashake add @s 0.800 1 positional
            execute @a[scores={ill_severe_cold=8001..13400}] ~ ~ ~ scoreboard players add @s sneeze_prob 3
            execute @a[scores={ill_severe_cold=8001..13400}] ~ ~ ~ scoreboard players add @s cough_prob 3
        #сообщения
            execute @a[scores={ill_severe_cold=8000, gender = 1}] ~ ~ ~ w @s §aЯ выздоровел!
            execute @a[scores={ill_severe_cold=8000, gender = 2}] ~ ~ ~ w @s §aЯ выздоровела!
            execute @a[scores={ill_severe_cold=8000}] ~ ~ ~ scoreboard players add @s stress -3000

            execute @a[scores={ill_severe_cold=12200}] ~ ~ ~ w @s Мне стало немного лучше.
            execute @a[scores={ill_severe_cold=12200}] ~ ~ ~ scoreboard players add @s stress -1500

            execute @a[scores={ill_severe_cold=13400}] ~ ~ ~ w @s Мне ужасно плохо.
            execute @a[scores={ill_severe_cold=13400}] ~ ~ ~ scoreboard players add @s stress 2500

    #пневмония
        #получение
            execute @a[scores={custom_random=400..450, ill_pneumonia=!1.., freezing=2000.., xp_stage=4..}] ~ ~ ~ scoreboard players set @s ill_pneumonia 19200
        #эффекты
            execute @a[scores={ill_pneumonia=10000..}] ~ ~ ~ scoreboard players set @s ill_severe_cold 0
            execute @a[scores={ill_pneumonia=10000..}] ~ ~ ~ scoreboard players set @s ill_mild_cold 0
            execute @a[tag=!at_respawn_room, scores={ill_pneumonia=10000..11200, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_pneumonia=10000..11200, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_pneumonia=11200..15000, custom_random=1..10, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_pneumonia=11200..15000, custom_random=1..10, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_pneumonia=15000..16300, custom_random=1..120, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_pneumonia=15000..16300, custom_random=1..150, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_pneumonia=15000..16300, custom_random=200..250, no_hard_ill=0}] ~ ~ ~ effect @s darkness 5 0 true
            execute @a[scores={ill_pneumonia=15000..16300, custom_random=151..300, no_hard_ill=0}] ~ ~ ~ camerashake add @s 0.5 1 rotational
            execute @a[tag=!at_respawn_room, scores={ill_pneumonia=16301..18000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_pneumonia=16301..18000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_pneumonia=10000..18000}] ~ ~ ~ scoreboard players add @s sneeze_prob 1
            execute @a[scores={ill_pneumonia=10000..18000}] ~ ~ ~ scoreboard players add @s cough_prob 3
        #сообщения
            execute @a[scores={ill_pneumonia=10000, gender = 1}] ~ ~ ~ w @s §aМне стало гораздо лучше. Кажется, я выздоровел!
            execute @a[scores={ill_pneumonia=10000, gender = 2}] ~ ~ ~ w @s §aМне стало гораздо лучше. Кажется, я выздоровела!
            execute @a[scores={ill_pneumonia=10000}] ~ ~ ~ scoreboard players add @s stress -7000

            execute @a[scores={ill_pneumonia=11200}] ~ ~ ~ w @s Мне стало лучше, но всё ещё чувствуется слабость.
            execute @a[scores={ill_pneumonia=11200}] ~ ~ ~ scoreboard players add @s stress -2000

            execute @a[scores={ill_pneumonia=15000}] ~ ~ ~ w @s Мне чуть-чуть лучше.
            execute @a[scores={ill_pneumonia=15000}] ~ ~ ~ scoreboard players add @s stress -2000

            execute @a[scores={ill_pneumonia=16300}] ~ ~ ~ w @s Я очень плохо себя чувствую. Я слегка задыхаюсь. Наверное, стоит задуматься над тёплой одеждой.
            execute @a[scores={ill_pneumonia=16300}] ~ ~ ~ scoreboard players add @s stress 10000

            execute @a[scores={ill_pneumonia=18000}] ~ ~ ~ w @s Я чувствую себя устало. Голову немного мутит.
            execute @a[scores={ill_pneumonia=18000}] ~ ~ ~ scoreboard players add @s stress 500

    #грипп
        #эффекты
            execute @a[tag=!at_respawn_room, scores={ill_flu=30000..38000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_flu=30000..38000, custom_random=1..5, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_flu=38001..39000, custom_random=1..100, no_hard_ill=0}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_flu=38001..39000, custom_random=1..100, no_hard_ill=0}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_flu=30001..39000}] ~ ~ ~ scoreboard players add @s sneeze_prob 1
            execute @a[scores={ill_flu=30001..39000}] ~ ~ ~ scoreboard players add @s cough_prob 100
        #сообщения
            execute @a[scores={ill_flu=30000, gender = 1}] ~ ~ ~ w @s Мне стало гораздо лучше. Кажется, я выздоровел!
            execute @a[scores={ill_flu=30000, gender = 2}] ~ ~ ~ w @s Мне стало гораздо лучше. Кажется, я выздоровела!
            execute @a[scores={ill_flu=30000}] ~ ~ ~ scoreboard players add @s stress -2000
            execute @a[scores={ill_flu=38000}] ~ ~ ~ w @s Мне стало лучше.
            execute @a[scores={ill_flu=38000}] ~ ~ ~ scoreboard players add @s stress -2000
            execute @a[scores={ill_flu=39000}] ~ ~ ~ w @s Мне ужасно плохо. Я теряю сознание.
            execute @a[scores={ill_flu=39000}] ~ ~ ~ scoreboard players add @s stress 5000

    #глисты
        #эффекты
            execute @a[tag=!at_respawn_room, scores={ill_helminth=1, custom_random=1..5}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_helminth=1, custom_random=1..10}] ~ ~ ~ scoreboard players add @s stress 100
            execute @a[scores={ill_helminth=1, custom_random=1..25, saturation=20..}] ~ ~ ~ scoreboard players add @s saturation -20
        #сообщения
            execute @a[scores={ill_helminth=1200}] ~ ~ ~ w @s §cЯ странновато себя чувствую. Ничего не болит, но чаще хочется есть.
            execute @a[scores={ill_helminth=2}] ~ ~ ~ w @s §cЯ плохо себя чувствую. Болит живот. Часто хочется есть.
            execute @a[scores={ill_helminth=2}] ~ ~ ~ scoreboard players add @s stress 1000
        #лечение
            execute @a[scores={ill_helminth=1.., pois_cond=2..}] ~ ~ ~ scoreboard players set @s ill_helminth 0

    #аппендицит
        #эффекты
            execute @a[tag=!at_respawn_room, scores={ill_appendicitis=1..1200, custom_random=1..250}] ~ ~ ~ damage @s 5 suicide
            execute @a[scores={ill_appendicitis=1..1200}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_appendicitis=1201..2400, custom_random=1..50}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_appendicitis=1201..2400, custom_random=1..50}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_appendicitis=2401..5000, custom_random=1..15}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_appendicitis=2401..5000, custom_random=1..15}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[tag=!at_respawn_room, scores={ill_appendicitis=5001..10000, custom_random=1..5}] ~ ~ ~ damage @s 1 suicide
            execute @a[scores={ill_appendicitis=5001..10000, custom_random=1..5}] ~ ~ ~ scoreboard players add @s stress 200
        #сообщения
            execute @a[scores={ill_appendicitis=1200}] ~ ~ ~ w @s Ужасные боли в животе. Это невозможно терпеть.
            execute @a[scores={ill_appendicitis=1200}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_appendicitis=2400}] ~ ~ ~ w @s Очень сильно болит живот внизу.
            execute @a[scores={ill_appendicitis=2400}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_appendicitis=5000}] ~ ~ ~ w @s Ощутимо болит живот внизу.
            execute @a[scores={ill_appendicitis=5000}] ~ ~ ~ scoreboard players add @s stress 200
            execute @a[scores={ill_appendicitis=10000}] ~ ~ ~ w @s Немного болит живот.
            execute @a[scores={ill_appendicitis=10000}] ~ ~ ~ scoreboard players add @s stress 200

    #Сломаная нога
        #сообщения
            execute @a[scores={ill_broken_leg=72000}] ~ ~ ~ w @s §cОчень больно в ноге! Кажется, она сломалась. Пройдёт немало времени, пока она заживёт.

    #Сломаная рука
        #сообщения
            execute @a[scores={ill_broken_arm=72000}] ~ ~ ~ w @s §cОчень больно в руке! Кажется, она сломалась. Пройдёт немало времени, пока она заживёт.

    #фейк боль головы
        #получение
            execute @a[tag=!at_respawn_room, scores={custom_random=300, custom_random_b=1..100, ill_r_head=!1..}] ~ ~ ~ scoreboard players set @s ill_r_head 400
        #сообщения
            execute @a[scores={ill_r_head=400}] ~ ~ ~ w @s Немного болит голова.
            execute @a[scores={ill_r_head=1}] ~ ~ ~ w @s Голова больше не болит.

    #фейк боль живота
        #получение
            execute @a[tag=!at_respawn_room, scores={custom_random=301, custom_random_b=1..100, ill_r_stomach=!1..}] ~ ~ ~ scoreboard players set @s ill_r_stomach 400
        #сообщения
            execute @a[scores={ill_r_stomach=400}] ~ ~ ~ w @s Немного болит живот.
            execute @a[scores={ill_r_stomach=1}] ~ ~ ~ w @s Живот больше не болит.

    #вычитание поинтов болезней
        execute @a[scores={ill_cancer=2..}] ~ ~ ~ scoreboard players add @s ill_cancer -1
        execute @a[scores={ill_mild_cold=1..}] ~ ~ ~ scoreboard players add @s ill_mild_cold -1
        execute @a[scores={ill_severe_cold=1..}] ~ ~ ~ scoreboard players add @s ill_severe_cold -1
        execute @a[scores={ill_pneumonia=1..}] ~ ~ ~ scoreboard players add @s ill_pneumonia -1
        # Сломаные конечности
            # Обычная регенерация
                execute @a[scores={ill_broken_leg=1..}] ~ ~ ~ scoreboard players add @s ill_broken_leg -1
                execute @a[scores={ill_broken_arm=1..}] ~ ~ ~ scoreboard players add @s ill_broken_arm -1
            # Регенерация при медицинских шинах
                execute @a[scores={ill_broken_leg=1..}, hasitem={item=arx:medical_leg_splint, location=slot.armor.legs}] ~ ~ ~ scoreboard players add @s ill_broken_leg -29
                execute @a[scores={ill_broken_arm=1..}, hasitem={item=arx:medical_arm_splint, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @s ill_broken_arm -29
        execute @a[scores={ill_flu=1..}] ~ ~ ~ scoreboard players add @s ill_flu -1
        execute @a[scores={ill_helminth=2..}] ~ ~ ~ scoreboard players add @s ill_helminth -1
        execute @a[scores={ill_appendicitis=2..}] ~ ~ ~ scoreboard players add @s ill_appendicitis -1
        execute @a[scores={ill_anal_fissure=1..}] ~ ~ ~ scoreboard players add @s ill_anal_fissure -1
        execute @a[scores={ill_r_head=1..}] ~ ~ ~ scoreboard players add @s ill_r_head -1
        execute @a[scores={ill_r_stomach=1..}] ~ ~ ~ scoreboard players add @s ill_r_stomach -1

    #дебаг отрицательных значений поинтов болезней
        execute @a[scores={ill_cancer=..-1}] ~ ~ ~ scoreboard players set @s ill_cancer 0
        execute @a[scores={ill_mild_cold=..-1}] ~ ~ ~ scoreboard players set @s ill_mild_cold 0
        execute @a[scores={ill_severe_cold=..-1}] ~ ~ ~ scoreboard players set @s ill_severe_cold 0
        execute @a[scores={ill_pneumonia=..-1}] ~ ~ ~ scoreboard players set @s ill_pneumonia 0
        execute @a[scores={ill_broken_leg=..-1}] ~ ~ ~ scoreboard players set @s ill_broken_leg 0
        execute @a[scores={ill_broken_arm=..-1}] ~ ~ ~ scoreboard players set @s ill_broken_arm 0
        execute @a[scores={ill_flu=..-1}] ~ ~ ~ scoreboard players set @s ill_flu 0
        execute @a[scores={ill_helminth=..-1}] ~ ~ ~ scoreboard players set @s ill_helminth 0
        execute @a[scores={ill_appendicitis=..-1}] ~ ~ ~ scoreboard players set @s ill_appendicitis 0
        execute @a[scores={ill_anal_fissure=..-1}] ~ ~ ~ scoreboard players set @s ill_anal_fissure 0
        execute @a[scores={ill_r_head=..-1}] ~ ~ ~ scoreboard players set @s ill_r_head 0
        execute @a[scores={ill_r_stomach=..-1}] ~ ~ ~ scoreboard players set @s ill_r_stomach 0
  
    #Вычитание поинтов зелья блока тяжёлой фазы
        execute @a[scores={no_hard_ill=1..}] ~ ~ ~ scoreboard players add @s no_hard_ill -1

#Отравление
    #Вычисление эффективности снятия отравления
        scoreboard players set @a pois_dec 1
        scoreboard players add @a[scores={poit_pois_dec_a=1..}] pois_dec 1
        scoreboard players add @a[scores={poit_pois_dec_b=1..}] pois_dec 2
        scoreboard players add @a[scores={poit_pois_dec_c=1..}] pois_dec 4
        scoreboard players add @a[scores={poit_pois_dec_d=1..}] pois_dec 8
        scoreboard players add @a[hasitem={item=arx:ring_caryite_aquamarine, location=slot.armor.feet}] pois_dec 1
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_aquamarine, location=slot.armor.feet}] pois_dec 3
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_aquamarine, location=slot.armor.feet}] pois_dec 5
        scoreboard players add @a[hasitem={item=arx:ring_of_immortal_eagle, location=slot.armor.feet}] pois_dec 5

        scoreboard players add @a[scores={trailblazer_skill=1..2}] pois_dec 1
        scoreboard players add @a[scores={trailblazer_skill=3..4}] pois_dec 2
        scoreboard players add @a[scores={trailblazer_skill=5..6}] pois_dec 3

    #Вычитание отравления
        execute @a[scores={poisoning=1..}] ~ ~ ~ scoreboard players operation @s poisoning -= @s pois_dec

    #Определяем уровень отравления
        execute @a[scores={poisoning=0}] ~ ~ ~ scoreboard players set @s pois_cond 0
        execute @a[scores={poisoning=260..1000}] ~ ~ ~ scoreboard players set @s pois_cond 1
        execute @a[scores={poisoning=1000..2000}] ~ ~ ~ scoreboard players set @s pois_cond 2
        execute @a[scores={poisoning=2000..3000}] ~ ~ ~ scoreboard players set @s pois_cond 3
        execute @a[scores={poisoning=3000..}] ~ ~ ~ scoreboard players set @s pois_cond 4

    #Определяем дельту состояния отравления
        execute @a ~ ~ ~ scoreboard players operation @s pois_cond_delta = @s pois_cond
        execute @a ~ ~ ~ scoreboard players operation @s pois_cond_delta -= @s pois_cond_log

    #Выводим сообщения
        execute @a[scores={pois_cond_delta=1.., pois_cond=1}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало хуже §4(1 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=1.., pois_cond=2}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало хуже §4(2 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=1.., pois_cond=3}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало хуже §4(3 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=1.., pois_cond=4}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало хуже §4(4 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=..-1, pois_cond=0}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало лучше §a(Отравление прошло)" } ] } 
        execute @a[scores={pois_cond_delta=..-1, pois_cond=1}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало лучше §a(1 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=..-1, pois_cond=2}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало лучше §a(2 ур. отравления)" } ] } 
        execute @a[scores={pois_cond_delta=..-1, pois_cond=3}] ~ ~ ~ tellraw @s { "rawtext": [  { "text": "Мне стало лучше §a(3 ур. отравления)" } ] } 

    #Воздействие на стресс
        execute @a[scores={pois_cond=1.., c_persistent=0}] ~ ~ ~ scoreboard players add @s stress 1
        execute @a[scores={pois_cond=2.., c_persistent=0}] ~ ~ ~ scoreboard players add @s stress 2
        execute @a[scores={pois_cond=3.., c_persistent=0}] ~ ~ ~ scoreboard players add @s stress 4
        execute @a[scores={pois_cond=4, c_persistent=0}] ~ ~ ~ scoreboard players add @s stress 8
    #Непосредственные дебаффы
        #Отравление 2 ур
            effect @a[scores={pois_cond=2, custom_random=0..50}] nausea 20 0

        #Отравление 3 ур
            effect @a[scores={pois_cond=3, custom_random=1..50}] darkness 20 0
            effect @a[scores={pois_cond=3, custom_random=51..100}] fatal_poison 10 0
            effect @a[scores={pois_cond=3..4}] nausea 20 0
            #Отравление 3.. ур блокирует регенерацию (см. Авторегенерация хп)
            #scoreboard players set @a[scores={pois_cond=3..4}] regen_mp 0

        #Отравление 4 ур
            effect @a[scores={pois_cond=4}] blindness 20 0
            effect @a[scores={pois_cond=4}] fatal_poison 5 0

    #Обновляем перменную-историю уровня отравления
        execute @a ~ ~ ~ scoreboard players operation @s pois_cond_log = @s pois_cond

    #Вычитание поинта блокировки отравления (ванильного, но надо проверить)
        execute @e[scores={pois_block=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] pois_block -1

    # Дебаг
        scoreboard players set @a[scores={poisoning=..-1}] poisoning 0

#Невидимость 
    scoreboard players add @a[scores={invisible=1..}] invisible -1
    effect @a[scores={invisible=1..}] invisibility 2 0 true
    effect @a[tag=alone, scores={invis_saki=1..}] invisibility 2 0 true

#Авторегенерация хп
    #Вычисление скорости регенерации ХП
        scoreboard players set @a regen_speed 120
        scoreboard players add @a[scores={religion=3..9}] regen_speed -30
        scoreboard players add @a[scores={religion=13..29}] regen_speed -30
        scoreboard players add @a[scores={religion=8..9}] regen_speed -30
        scoreboard players add @a[scores={religion=18..19}] regen_speed -30
        scoreboard players add @a[scores={stress_cond=4, c_conscious=0}] regen_speed 80
        scoreboard players add @a[scores={stress_cond=4, c_conscious=1..}] regen_speed 40
        scoreboard players add @a[scores={stress_cond=2..4}] regen_speed 30
        scoreboard players add @a[scores={stress_cond=-4}] regen_speed -30
        scoreboard players add @a[scores={stress_cond=-4..-2}] regen_speed -20
        scoreboard players add @a[scores={speed_skill=1..2}] regen_speed -30
        scoreboard players add @a[scores={speed_skill=3..4}] regen_speed -60
        scoreboard players add @a[scores={speed_skill=5..6}] regen_speed -90
        scoreboard players add @a[scores={c_tenacious=1..}] regen_speed -15
        scoreboard players add @a[scores={sk_a_3=1}] regen_speed -15
        scoreboard players add @a[hasitem={item=arx:ring_aluminum_riolik, location=slot.armor.feet}] regen_speed -10
        scoreboard players add @a[hasitem={item=arx:ring_gold_riolik, location=slot.armor.feet}] regen_speed -20
        scoreboard players add @a[hasitem={item=arx:ring_durasteel_riolik, location=slot.armor.feet}] regen_speed -30
        scoreboard players add @a[hasitem={item=arx:ring_caryite_riolik, location=slot.armor.feet}] regen_speed -40
        scoreboard players add @a[hasitem={item=arx:ring_toliriite_riolik, location=slot.armor.feet}] regen_speed -60
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_riolik, location=slot.armor.feet}] regen_speed -80
        #Если откат слишком короткий
            scoreboard players set @a[scores={regen_speed=..14}] regen_speed 15

    #Вычисление уровня регенерации ХП
        scoreboard players set @a regen_effect 1
        scoreboard players add @a[scores={religion=3..9}] regen_effect 1
        scoreboard players add @a[scores={religion=13..29}] regen_effect 1
        scoreboard players add @a[hasitem={item=arx:ring_caryite_bronze, location=slot.armor.feet}] regen_effect 1
        scoreboard players add @a[hasitem={item=arx:ring_toliriite_bronze, location=slot.armor.feet}] regen_effect 2
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_bronze, location=slot.armor.feet}] regen_effect 3

    #Снятие поинта задержки регенерации
        scoreboard players add @a regen_delay -1

    #Исполнение (при regen_delay=1)
        effect @a[scores={regen_delay=1, regen_effect=1, pois_cond=!3..}] regeneration 5 0 true
        effect @a[scores={regen_delay=1, regen_effect=2, pois_cond=!3..}] regeneration 5 1 true 
        effect @a[scores={regen_delay=1, regen_effect=3, pois_cond=!3..}] regeneration 5 2 true 
        effect @a[scores={regen_delay=1, regen_effect=4, pois_cond=!3..}] regeneration 5 3 true
        effect @a[scores={regen_delay=1, regen_effect=5, pois_cond=!3..}] regeneration 5 4 true

    #Перезапуск, когда regen_delay дойдет до 0
        execute @a[scores={regen_delay=..0}] ~ ~ ~ scoreboard players operation @p regen_delay = @p regen_speed

#Вычитание поинтов
    # Карма
        execute @a[scores={verify=2, sec=60..}] ~ ~ ~ execute @a[scores={karma_pallas=1}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§l§6<<<§aПаллас больше не зол на меня§6>>>" } ] }
        execute @a[scores={verify=2, sec=60..}] ~ ~ ~ execute @a[scores={karma_pires=1}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§l§6<<<§aПирес больше не зол на меня§6>>>" } ] }
        execute @a[scores={verify=2, sec=60..}] ~ ~ ~ scoreboard players add @a[scores={karma_pallas=1..}] karma_pallas -1
        execute @a[scores={verify=2, sec=60..}] ~ ~ ~ scoreboard players add @a[scores={karma_pires=1..}] karma_pires -1

    #Откат переменной боя (получается при ударах чего-л)
        scoreboard players add @a[scores={in_battle=1..}] in_battle -1

        scoreboard players add @a[scores={vic_dag_bonus=1..}] vic_dag_bonus -1

    #Вычитание поинтов магической скорости
        execute @e[scores={jump_speed_up_a=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] jump_speed_up_a -1
        execute @e[scores={jump_speed_up_c=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] jump_speed_up_c -1
        execute @e[scores={jump_speed_up_e=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] jump_speed_up_e -1
        execute @e[scores={jump_speed_up_f=1..}] ~ ~ ~ scoreboard players add @e[r=0.0001] jump_speed_up_f -1

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

    #Снятие поинтов зелий
        scoreboard players add @a[scores={poit_speed_a=1..}] poit_speed_a -1
        scoreboard players add @a[scores={poit_speed_b=1..}] poit_speed_b -1
        scoreboard players set @a[scores={poit_speed_b=1..}] poit_speed_a 0

        scoreboard players add @a[scores={poit_jump_a=1..}] poit_jump_a -1
        scoreboard players add @a[scores={poit_jump_b=1..}] poit_jump_b -1
        scoreboard players set @a[scores={poit_jump_b=1..}] poit_jump_a 0

        scoreboard players add @a[scores={poit_heigth_a=1..}] poit_heigth_a -1
        scoreboard players add @a[scores={poit_heigth_b=1..}] poit_heigth_b -1
        scoreboard players set @a[scores={poit_heigth_b=1..}] poit_heigth_a 0

        scoreboard players add @a[scores={poit_mp_reg=1..}] poit_mp_reg -1

        scoreboard players add @a[scores={poit_mining_u=1..}] poit_mining_u -1
        scoreboard players add @a[scores={poit_mining_d=1..}] poit_mining_d -1

        scoreboard players add @a[scores={poit_pois_dec_a=1..}] poit_pois_dec_a -1
        scoreboard players add @a[scores={poit_pois_dec_b=1..}] poit_pois_dec_b -1
        scoreboard players add @a[scores={poit_pois_dec_c=1..}] poit_pois_dec_c -1
        scoreboard players add @a[scores={poit_pois_dec_d=1..}] poit_pois_dec_d -1

        scoreboard players add @a[scores={no_fog=1..}] no_fog -1
        scoreboard players add @a[scores={no_dark_fog=1..}] no_dark_fog -1

        scoreboard players add @a[scores={hot_hold=1..}] hot_hold -1
        scoreboard players add @a[scores={freezing_hold=1..}] freezing_hold -1
    

# Демон
    # Откат бонуса демона
        scoreboard players add @a[scores={demon_power=1..}] demon_power -1

    # Фиксация бонуса демона при паразитировании
        scoreboard players set @a[scores={c_demon=1}] demon_power 1
    
    # Надета ли цепь демона?
        tag @a remove demon_chain_equipped
        tag @a[hasitem={location=slot.armor.legs, item=arx:demon_chain}] add demon_chain_equipped

    # Бонус демона
        effect @a[scores={demon_power=1..}] night_vision 12 0 true
        camerashake add @a[scores={demon_power=1..}, tag=!demon_chain_equipped] 0.1 1 rotational
        scoreboard players add @a[scores={demon_power=1.., stress_cond=..1}, tag=!demon_chain_equipped] stress 10

    # Урон от демона при паразитировании
        damage @a[scores={c_demon=1}, hasitem={item=arx:salt}] 5 entity_attack
        damage @a[scores={c_demon=1}, hasitem={item=arx:undemon_book}] 12 entity_attack
        execute @a[scores={c_demon=1}, hasitem={item=arx:salt}] ~ ~ ~ playsound demon.agressive @a ~ ~ ~
        execute @a[scores={c_demon=1}, hasitem={item=arx:undemon_book}] ~ ~ ~ playsound demon.agressive @a ~ ~ ~


#Шизофреник
    execute @r[scores={c_schizophrenic=1.., custom_random=1..10}] ~ ~ ~ function core_parts/schizophrenic

#Верификация
    #Эффекты, если не верифицирован (verify=0)
        effect @a[scores={verify=0}] slowness 1 255 true
        effect @a[scores={verify=0}] invisibility 2 0 true
        effect @a[scores={verify=0}] blindness 2 0 true
        title @a[scores={verify=0}] subtitle §a§lверификации
        title @a[scores={verify=0}] title §a§lДождитесь
        camera @a[scores={verify=0}] fade time 0 2 0 color 0 0 0 

#Комната попущения
    #Если выдан тег knock - отключен автореспавн
        execute @a[tag=knock, scores={respawn_delay=1..}] ~ ~ ~ function core_parts/timeless_knockout

    #Титлы экшнбары
        title @a[scores={respawn_delay=1..}] actionbar §aВы скоро возродитесь!
        title @a[scores={respawn_delay=-1}] actionbar §cОжидайте, пока вас решат возродить!

    # Основной анализ
        #Дебаг
            tellraw @a[tag=!at_respawn_room, scores={respawn_delay=1..}] { "rawtext": [ { "text": "§6Вас телепортировали из комнаты до естественного отката." } ] }
            scoreboard players set @a[tag=!at_respawn_room] respawn_delay 0
            
        #Телепортация при respawn_delay=1
            clear @a[scores={respawn_delay=1}] arx:respawn_time_checker
            execute @a[scores={respawn_delay=1}] ~ ~ ~ function tp/1_spawn

        # Вычитание
            scoreboard players add @a[scores={respawn_delay=1..}] respawn_delay -1

    #Эффекты в комнате
        effect @a[tag=at_respawn_room] saturation 1 0 true
        effect @a[tag=at_respawn_room] regeneration 1 255 true
        effect @a[tag=at_respawn_room] weakness 1 255 true

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
    #Идёт ли дождь?
        tag @a remove is_raining
        event entity @a arx:test_weather

    #Вычитаем поинты погоды
        execute @a[scores={verify=2, weather=1..}] ~ ~ ~ scoreboard players add @s weather -1

    #Сменяем погоду
        #Ставим погоду по прохождению отката
            execute @a[scores={verify=2, weather=1}] ~ ~ ~ weather clear
        #Дождь
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=0..250}] ~ ~ ~ weather rain
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=0..50}] ~ ~ ~ scoreboard players random @s weather 200 800
            execute @a[scores={verify=2, weather=0, custom_random=310, custom_random_b=51..250}] ~ ~ ~ scoreboard players random @s weather 10 200

#Дебаг очков обучения (проверка на соответствие с уровнем) 
    #Сбрасываем старые данные
        scoreboard players set @a skill_points_dbg 0

    #Высчитываем ожидаемые очки обучения
        scoreboard players add @a[scores={xp_stage=1..}] skill_points_dbg 1
        scoreboard players add @a[scores={xp_stage=3..}] skill_points_dbg 1
        scoreboard players add @a[scores={xp_stage=5..}] skill_points_dbg 1
        scoreboard players add @a[scores={xp_stage=7..}] skill_points_dbg 1
        scoreboard players add @a[scores={xp_stage=9..}] skill_points_dbg 1
        scoreboard players add @a[scores={xp_stage=10..}] skill_points_dbg 1
        
    #Вычитаем вкач
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s strength_skill
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s speed_skill
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s magic_skill
        
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s trailblazer_skill
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s might_skill

    #Вычитаем невкачанные очки обучения
        execute @a ~ ~ ~ scoreboard players operation @s skill_points_dbg -= @s skill_point

    #Отчитываемся
        execute @a[scores={skill_points_dbg=!0}] ~ ~ ~ w @a[scores={verify=2}] §4Обнаружена ошибка у @s core20tcs>>scores>>skill_points_does_not_fit_arx_level

#Деспавним крыс днём
    execute @a[scores={verify=2, is_day=1}] ~ ~ ~ event entity @e[family=despawn_as_ghost] arx:despawn_as_ghost

# Партиклы опыта (когда бонус 1.5)
    execute @a[scores={xp_х1_5=1..}] ~ ~ ~ particle arx:xp_upgrade ~ ~2 ~ 

# Снимаем переменную буста опыта
    execute @a[scores={xp_х1_5=1..}] ~ ~ ~ scoreboard players add @s xp_х1_5 -1

# Снимаем переменную невидимости от магии
    execute @a[scores={invis_saki=1..}] ~ ~ ~ scoreboard players add @s invis_saki -1
