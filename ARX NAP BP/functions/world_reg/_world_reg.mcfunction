#Ручная регистрация scores в мире

function world_reg/magic
function world_reg/achievements

#GAMERULE
    gamerule mobgriefing false
    gamerule naturalregeneration false
    gamerule tntexplodes false
    gamerule spawnradius 0

#ТАБЛИЦЫ

# Просчет стабильности
    scoreboard objectives add stability_core dummy stability_core
    scoreboard objectives add stability_const dummy stability_const
    scoreboard players set @s stability_const 1200

# Просчет кармы
    scoreboard objectives add karma_pallas dummy Карма_пл
    scoreboard objectives add karma_pires dummy Карма_пр

scoreboard objectives add attack_anim_rand dummy Аним_атаки
scoreboard objectives add case_counter_pl dummy Счёт_мол_палл
scoreboard objectives add case_counter_pr dummy Счёт_мол_пир
scoreboard objectives add case_random dummy Ранд_кейсов 

scoreboard objectives add custom_random dummy Спец_ранд 
scoreboard objectives add custom_random_b dummy Спец_ранд_b
scoreboard objectives add custom_random_c dummy Спец_ранд_c

scoreboard objectives add drugs_delay dummy Наркозавис.

scoreboard objectives add gender dummy Пол_перс.
scoreboard objectives add respawn_delay dummy Отк_респ.
scoreboard objectives add time_h dummy "Часы игры"
scoreboard objectives add time_m dummy Минуты-игры.
scoreboard objectives add water_delay dummy Намокание
scoreboard objectives add water_block dummy Намокание
scoreboard objectives add class dummy Класс
scoreboard objectives add religion dummy Религия
scoreboard objectives add no_religion dummy отказ_религии
scoreboard objectives add target dummy цель_мага
scoreboard objectives add verify dummy Верификация
scoreboard players set @p verify 2

scoreboard objectives add mp dummy Мана
scoreboard objectives add mp_max dummy Макс_мана
scoreboard objectives add mp_regeneration_amplification dummy Увеличение_получаемых_очков_мп
scoreboard objectives add mp_delay dummy Откат_маны
scoreboard objectives add mp_tray dummy Накоп_маны
scoreboard objectives add mp_req dummy Треб_маны

scoreboard objectives add poisoning dummy poisoning
scoreboard objectives add pois_cond_delta dummy pois_cond_delta
scoreboard objectives add pois_cond dummy pois_cond
scoreboard objectives add pois_cond_log dummy pois_cond_log
scoreboard objectives add pois_dec dummy Pois_dec
scoreboard objectives add pois_block dummy Pois_block
scoreboard objectives add freezing_hold dummy freezing_hold
scoreboard objectives add hot_hold dummy hot_hold
scoreboard objectives add mark dummy Метка
scoreboard objectives add regen_hp dummy Регенерация
scoreboard objectives add regen_mp dummy Восст_маны
scoreboard objectives add heavy dummy Загруж.
scoreboard objectives add heavy_la dummy Загруж.лег
scoreboard objectives add heavy_ha dummy Загруж.тяж
scoreboard objectives add heavy_delta dummy Загруж_разн
scoreboard objectives add heavy_log dummy Загруж_ист
scoreboard objectives add heavy_compens dummy Загруж_компенс
scoreboard objectives add heavy_result dummy Загруж_конечная

scoreboard objectives add final_mining dummy final_mining

scoreboard objectives add sneese_prob dummy sneese_prob
scoreboard objectives add cough_prob dummy cough_prob

scoreboard objectives add no_hard_ill dummy no_hard_ill

scoreboard objectives add no_dark_fog dummy no_dark_fog

scoreboard objectives add poit_mp_reg dummy poit_mp_reg

scoreboard objectives add blocking dummy Блокировка
scoreboard objectives add allow_block_buff dummy allow_block_buff

scoreboard objectives add poit_speed_a dummy poit_speed_a
scoreboard objectives add poit_speed_b dummy poit_speed_b
scoreboard objectives add poit_jump_a dummy poit_jump_a
scoreboard objectives add poit_jump_b dummy poit_jump_b
scoreboard objectives add poit_heigth_a dummy poit_heigth_a
scoreboard objectives add poit_heigth_b dummy poit_heigth_b
scoreboard objectives add poit_mining_u dummy poit_mining_u
scoreboard objectives add poit_mining_d dummy poit_mining_d
scoreboard objectives add poit_pois_dec_a dummy poit_pois_dec_a
scoreboard objectives add poit_pois_dec_b dummy poit_pois_dec_b
scoreboard objectives add poit_pois_dec_c dummy poit_pois_dec_c
scoreboard objectives add poit_pois_dec_d dummy poit_pois_dec_d

scoreboard objectives add mp_const dummy mp_const


scoreboard objectives add speed_skill dummy Навык_вора
scoreboard objectives add magic_skill dummy Навык_мага
scoreboard objectives add strength_skill dummy Навык_воина
scoreboard objectives add trailblazer_skill dummy trailblazer_skill
scoreboard objectives add might_skill dummy might_skill

scoreboard objectives add bow_result dummy Тряска_лука
scoreboard objectives add bow_spell_a dummy Компен_лука_а
scoreboard objectives add bow_spell_b dummy Компен_лука_б
scoreboard objectives add bow_spell_c dummy Компен_лука_с
scoreboard objectives add bow_spell_d dummy Компен_лука_д
scoreboard objectives add bow_tick dummy Контр_тряс_л

scoreboard objectives add jump_speed_up_a dummy Буст_ловк_а
scoreboard objectives add jump_speed_up_b dummy Буст_ловк_б
scoreboard objectives add jump_speed_up_c dummy Буст_ловк_с
scoreboard objectives add jump_speed_up_d dummy Буст_ловк_д
scoreboard objectives add jump_speed_up_e dummy Буст_ловк_е
scoreboard objectives add jump_speed_up_f dummy Буст_ловк_ф

scoreboard objectives add resist_up_a dummy Защ_а
scoreboard objectives add resist_up_b dummy Защ_б
scoreboard objectives add resist_up_c dummy Защ_с
scoreboard objectives add resist_up_d dummy Защ_д


scoreboard objectives add final_speed dummy Конеч_скор.
scoreboard objectives add final_jump dummy Конеч_прыж.
scoreboard objectives add final_strength dummy Конеч_сил.
scoreboard objectives add final_weak dummy Конеч_слаб.
scoreboard objectives add final_resist dummy Конеч_защ.
scoreboard objectives add final_slow dummy Конеч_медл.

scoreboard objectives add regen_speed dummy Задерж_автреген
scoreboard objectives add regen_effect dummy Степень_автреген
scoreboard objectives add regen_delay dummy Счёт_автреген


scoreboard objectives add move_delay dummy move_delay
            
scoreboard objectives add freezing dummy freezing

scoreboard objectives add stress dummy stress
scoreboard objectives add stress_cond dummy stress_cond
scoreboard objectives add stress_co_delta dummy stress_co_delta
scoreboard objectives add stress_co_hist dummy stress_co_hist
scoreboard objectives add stress_normalize dummy stress_normalize

scoreboard objectives add on_hurt_delay dummy on_hurt_delay

scoreboard objectives add water_block_saki dummy water_block_saki

scoreboard objectives add sin_host_block dummy sin_host_block
scoreboard objectives add sin_host_saki dummy sin_host_saki

scoreboard objectives add blind_block dummy blind_block
scoreboard objectives add blind_block_saki dummy blind_block_saki

scoreboard objectives add check_one_point dummy Дебаг_позиции

scoreboard objectives add demon_power dummy сила_демона

scoreboard objectives add weather dummy Погода
scoreboard objectives add weather_cond dummy Тип_погоды
scoreboard players set @p weather_cond 0

scoreboard objectives add is_day dummy День 
scoreboard objectives add day_history dummy Лог_дня
scoreboard objectives add day_delta dummy Дельта_дня

scoreboard objectives add in_battle dummy В_бою

scoreboard objectives add regen_saki_a dummy regen_saki_a
scoreboard objectives add regen_saki_b dummy regen_saki_b
scoreboard objectives add regen_saki_c dummy regen_saki_c

scoreboard objectives add invisible dummy Невидимость
scoreboard objectives add invis_saki dummy Невид_саки

scoreboard objectives add teleport_def dummy Обычн_тп
scoreboard objectives add teleport_dmg dummy Тп_с_уроном

scoreboard objectives add in_portal dummy in_portal

scoreboard objectives add tp_backpoint dummy tp_backpoint

scoreboard objectives add no_fog dummy no_fog

scoreboard objectives add nightvis_saki dummy nightvis_saki

scoreboard objectives add item_control dummy item_control

scoreboard objectives add online dummy online
scoreboard objectives add online_log dummy online_log

#СИСТЕМА НАВЫКОВ
scoreboard objectives add sk_a_1 dummy sk_a_1
scoreboard objectives add sk_a_2 dummy sk_a_2
scoreboard objectives add sk_a_3 dummy sk_a_3
scoreboard objectives add sk_a_4 dummy sk_a_4
scoreboard objectives add sk_a_5 dummy sk_a_5
scoreboard objectives add sk_a_6 dummy sk_a_6
scoreboard objectives add sk_a_7 dummy sk_a_7
scoreboard objectives add sk_a_8 dummy sk_a_8
scoreboard objectives add sk_a_9 dummy sk_a_9
scoreboard objectives add sk_a_10 dummy sk_a_11
scoreboard objectives add sk_a_11 dummy sk_a_11
scoreboard objectives add sk_a_12 dummy sk_a_12
scoreboard objectives add sk_a_13 dummy sk_a_13
scoreboard objectives add sk_a_14 dummy sk_a_14
scoreboard objectives add sk_a_15 dummy sk_a_15
scoreboard objectives add sk_a_16 dummy sk_a_16
scoreboard objectives add sk_a_17 dummy sk_a_17
scoreboard objectives add sk_a_18 dummy sk_a_18
scoreboard objectives add sk_a_19 dummy sk_a_19
scoreboard objectives add sk_a_20 dummy sk_a_20
scoreboard objectives add sk_a_21 dummy sk_a_21
scoreboard objectives add sk_a_22 dummy sk_a_22
scoreboard objectives add sk_a_23 dummy sk_a_23
scoreboard objectives add sk_a_24 dummy sk_a_24
scoreboard objectives add sk_a_25 dummy sk_a_25
scoreboard objectives add sk_a_26 dummy sk_a_26
scoreboard objectives add sk_a_27 dummy sk_a_27
scoreboard objectives add sk_a_28 dummy sk_a_28
scoreboard objectives add sk_a_29 dummy sk_a_29

scoreboard objectives add sk_b_1 dummy sk_b_1
scoreboard objectives add sk_b_2 dummy sk_b_2
scoreboard objectives add sk_b_3 dummy sk_b_3
scoreboard objectives add sk_b_4 dummy sk_b_4
scoreboard objectives add sk_b_5 dummy sk_b_5
scoreboard objectives add sk_b_6 dummy sk_b_6
scoreboard objectives add sk_b_7 dummy sk_b_7
scoreboard objectives add sk_b_8 dummy sk_b_8
scoreboard objectives add sk_b_9 dummy sk_b_9
scoreboard objectives add sk_b_10 dummy sk_b_11
scoreboard objectives add sk_b_11 dummy sk_b_11
scoreboard objectives add sk_b_12 dummy sk_b_12
scoreboard objectives add sk_b_13 dummy sk_b_13
scoreboard objectives add sk_b_14 dummy sk_b_14

scoreboard objectives add sk_c_1 dummy sk_c_1
scoreboard objectives add sk_c_2 dummy sk_c_2
scoreboard objectives add sk_c_3 dummy sk_c_3
scoreboard objectives add sk_c_4 dummy sk_c_4
scoreboard objectives add sk_c_5 dummy sk_c_5
scoreboard objectives add sk_c_6 dummy sk_c_6
scoreboard objectives add sk_c_7 dummy sk_c_7
scoreboard objectives add sk_c_8 dummy sk_c_8
scoreboard objectives add sk_c_9 dummy sk_c_9
scoreboard objectives add sk_c_10 dummy sk_c_11
scoreboard objectives add sk_c_11 dummy sk_c_11
scoreboard objectives add sk_c_12 dummy sk_c_12
scoreboard objectives add sk_c_13 dummy sk_c_13
scoreboard objectives add sk_c_14 dummy sk_c_14
scoreboard objectives add sk_c_15 dummy sk_c_15

scoreboard objectives add sk_d_1 dummy sk_d_1
scoreboard objectives add sk_d_2 dummy sk_d_2
scoreboard objectives add sk_d_3 dummy sk_d_3
scoreboard objectives add sk_d_4 dummy sk_d_4

#СИСТЕМА ОПЫТА
scoreboard objectives add xp_tray dummy Трей_опыта

scoreboard objectives add const_-1 dummy Константа_-1
scoreboard players set @p const_-1 -1
scoreboard objectives add const_0 dummy Константа_0
scoreboard players set @p const_0 0
scoreboard objectives add const_2 dummy Константа_2
scoreboard players set @p const_2 2
scoreboard objectives add const_3 dummy Константа_3
scoreboard players set @p const_3 3
scoreboard objectives add const_4 dummy Константа_4
scoreboard players set @p const_4 4
scoreboard objectives add const_5 dummy Константа_5
scoreboard players set @p const_5 5
scoreboard objectives add const_10 dummy Константа_10
scoreboard players set @p const_10 10
scoreboard objectives add const_19 dummy Константа_19
scoreboard players set @p const_19 19
scoreboard objectives add const_20 dummy Константа_20
scoreboard players set @p const_20 20
scoreboard objectives add const_25 dummy Константа_25
scoreboard players set @p const_25 25
scoreboard objectives add const_50 dummy Константа_50
scoreboard players set @p const_50 50
scoreboard objectives add const_80 dummy Константа_80
scoreboard players set @p const_80 80
scoreboard objectives add const_75 dummy Константа_75
scoreboard players set @p const_75 75
scoreboard objectives add const_100 dummy Константа_100
scoreboard players set @p const_100 100
scoreboard objectives add const_300 dummy Константа_300
scoreboard players set @p const_300 300
scoreboard objectives add const_850 dummy Константа_850
scoreboard players set @p const_850 850
scoreboard objectives add const_1000 dummy Константа_1к
scoreboard players set @p const_1000 1000
scoreboard objectives add const_1030 dummy Константа_1.03к
scoreboard players set @p const_1030 1030
scoreboard objectives add const_1050 dummy Константа_1.05к
scoreboard players set @p const_1050 1050
scoreboard objectives add const_1100 dummy Константа_1.1к
scoreboard players set @p const_1100 1100
scoreboard objectives add const_1150 dummy Константа_1.15к
scoreboard players set @p const_1150 1150
scoreboard objectives add const_1200 dummy Константа_1.2к
scoreboard players set @p const_1200 1200
scoreboard objectives add const_1250 dummy Константа_1.25к
scoreboard players set @p const_1250 1250
scoreboard objectives add const_1300 dummy Константа_1.3к
scoreboard players set @p const_1300 1300
scoreboard objectives add const_1500 dummy Константа_1.5к
scoreboard players set @p const_1500 1500

scoreboard objectives add xp dummy Факт_ОП
scoreboard objectives add xp_lim_delta dummy До_след_ур
scoreboard objectives add xp_stage dummy Ур_ОП
scoreboard objectives add xp_lim dummy Ур_лимита_ОП
scoreboard objectives add skill_point dummy Очки_навыка
scoreboard objectives add xp_х1_5 dummy Буст_ОП_х1_5

#БОЛЕЗНИ
scoreboard objectives add ill_cancer dummy ill_cancer
scoreboard objectives add ill_mild_cold dummy ill_mild_cold
scoreboard objectives add ill_severe_cold dummy ill_severe_cold
scoreboard objectives add ill_pneumonia dummy ill_pneumonia
scoreboard objectives add ill_broken_leg dummy ill_broken_leg
scoreboard objectives add ill_broken_arm dummy ill_broken_arm
scoreboard objectives add ill_flu dummy ill_flu
scoreboard objectives add ill_helminth dummy ill_helminth
scoreboard objectives add ill_appendicitis dummy ill_appendicitis
scoreboard objectives add ill_anal_fissure dummy ill_anal_fissure

#Случайные боли
scoreboard objectives add ill_r_head dummy ill_r_head
scoreboard objectives add ill_r_stomach dummy ill_r_stomach

#ТИКИ
scoreboard objectives add tick_nosempra_a dummy sempra-25
scoreboard objectives add tick_nosempra_b dummy sempra-50
scoreboard objectives add tick_nosempra_c dummy sempra-100
scoreboard objectives add tick_sempra_dps dummy маг.ур.в.сек
scoreboard objectives add tick dummy такт
scoreboard objectives add sec dummy секунда

scoreboard players set @p tick 0
scoreboard players set @p sec 0

scoreboard objectives setdisplay list time_h

scoreboard objectives add attack_weakness dummy attack_weakness


#ЧЕРТЫ ХАРАКТЕРА
    #Служебные
        scoreboard objectives add trait_random dummy trait_random
    #ПОЛОЖИТЕЛЬНЫЕ
        scoreboard objectives add c_inflexible dummy c_inflexible
        scoreboard objectives add c_powerful dummy c_powerful
        scoreboard objectives add c_indeclinable dummy c_indeclinable
        scoreboard objectives add c_enlightened dummy c_enlightened
        scoreboard objectives add c_bright_look dummy c_bright_look
        scoreboard objectives add c_wise dummy c_wise
        scoreboard objectives add c_persistent dummy c_persistent
        scoreboard objectives add c_tenacious dummy c_tenacious
        scoreboard objectives add c_conscious dummy c_conscious
        scoreboard objectives add c_genious dummy c_genious
        scoreboard objectives add c_water_lover dummy c_water_lover

    #НЕЙТРАЛЬНЫЕ
        scoreboard objectives add c_indifference dummy c_indifference
        scoreboard objectives add c_angry dummy c_angry
        scoreboard objectives add c_loner dummy c_loner
        scoreboard objectives add c_rude dummy c_rude
        scoreboard objectives add c_warmy dummy c_warmy
        scoreboard objectives add c_coldy dummy c_coldy
        scoreboard objectives add c_manipulator dummy c_manipulator
        scoreboard objectives add c_charismatic dummy c_charismatic
        scoreboard objectives add c_communicative dummy c_communicative
        scoreboard objectives add c_unstable dummy c_unstable
        scoreboard objectives add c_miner dummy c_miner

    #ОТРИЦАТЕЛЬНЫЕ
        scoreboard objectives add c_cowardly dummy c_cowardly
        scoreboard objectives add c_schizophrenic dummy c_schizophrenic
        scoreboard objectives add c_stupid dummy c_stupid
        scoreboard objectives add c_paranoid dummy c_paranoid
        scoreboard objectives add c_nospider dummy c_nospider
        scoreboard objectives add c_nonecro dummy c_nonecro
        scoreboard objectives add c_nosocio dummy c_nosocio
        scoreboard objectives add c_notecno dummy c_notecno
        scoreboard objectives add c_nodarkness dummy c_nodarkness
        scoreboard objectives add c_nomines dummy c_nomines
        scoreboard objectives add c_religious dummy c_religious
        scoreboard objectives add c_nolight dummy c_nolight
        scoreboard objectives add c_nocold dummy c_nocold
        scoreboard objectives add c_nowarm dummy c_nowarm
        scoreboard objectives add c_lazy dummy c_lazy
        scoreboard objectives add c_impulsive_par dummy c_impulsive_par
        scoreboard objectives add c_paranoid_mas dummy c_paranoid_mas
        scoreboard objectives add c_fastidious dummy c_fastidious
        scoreboard objectives add c_aquaphobe dummy c_aquaphobe

    #ИНЫЕ
        scoreboard objectives add c_demon dummy c_demon
        scoreboard objectives add c_seen_death dummy c_seen_death

#ЕДА
#Вкусы еды
scoreboard objectives add t_f_spicy dummy t_f_spicy
scoreboard objectives add t_f_salty dummy t_f_salty
scoreboard objectives add t_f_sweet dummy t_f_sweet
scoreboard objectives add t_f_sour dummy t_f_sour
scoreboard objectives add t_f_exotic dummy t_f_exotic

#Общая вкусность
scoreboard objectives add t_f_deliciousness dummy t_f_deliciousness

#Отравляющий эффект еды
scoreboard objectives add t_f_poisoning dummy t_f_poisoning

#Вкусы персонажа
scoreboard objectives add t_spicy dummy t_spicy 
scoreboard objectives add t_salty dummy t_salty
scoreboard objectives add t_sweet dummy t_sweet
scoreboard objectives add t_sour dummy t_sour
scoreboard objectives add t_exotic dummy t_exotic
scoreboard objectives add t_herbal dummy t_herbal
scoreboard objectives add t_meat dummy t_meat
scoreboard objectives add t_fish dummy t_fish
scoreboard objectives add t_bread dummy t_bread
scoreboard objectives add t_lactic dummy t_lactic

#Служебные
scoreboard objectives add food_tray_stress dummy food_tray_stress
scoreboard objectives add food_tray_prime dummy food_tray_prime
scoreboard objectives add food_count_taste_types dummy food_count_taste_types

tellraw @p { "rawtext": [ { "text": "§aПеременные успешно зарегистрированы в мире" } ] }

#Книги

scoreboard objectives add book_asar_i dummy book_asar_i
scoreboard objectives add book_asar_ii dummy book_asar_ii
scoreboard objectives add book_asar_iii dummy book_asar_iii
scoreboard objectives add book_asar_iv dummy book_asar_iv
scoreboard objectives add book_asar_v dummy book_asar_v
scoreboard objectives add book_asar_vi dummy book_asar_vi
scoreboard objectives add book_asar_vii dummy book_asar_vii
scoreboard objectives add book_asar_viii dummy book_asar_viii
scoreboard objectives add book_asar_ix dummy book_asar_ix
scoreboard objectives add book_asar_x dummy book_asar_x
scoreboard objectives add book_th_ab_gods dummy book_th_ab_gods
scoreboard objectives add book_golfari dummy book_golfari
scoreboard objectives add book_namel_pal dummy book_namel_pal
scoreboard objectives add book_holy_sakura dummy book_holy_sakura
scoreboard objectives add book_wand_puppet dummy book_wand_puppet
scoreboard objectives add book_dragon_arti dummy book_dragon_arti
scoreboard objectives add book_dext dummy book_dext
scoreboard objectives add book_philosophy dummy book_philosophy
scoreboard objectives add book_imm_eagle dummy book_imm_eagle
scoreboard objectives add book_fallen_god dummy book_fallen_god
scoreboard objectives add book_about_ancients dummy book_about_ancients
scoreboard objectives add book_about_tsaskhin dummy book_about_tsaskhin
scoreboard objectives add book_about_march dummy book_about_march
scoreboard objectives add book_oculus_primae_maledictionis dummy book_oculus_primae_maledictionis


#Броня
scoreboard objectives add armor_assas_dmg dummy armor_assas_dmg
scoreboard objectives add armor_conq_dmg dummy armor_conq_dmg
scoreboard objectives add armor_ranger_dmg dummy armor_ranger_dmg

scoreboard objectives add debugtp_drct dummy debugtp_drct
scoreboard players set @p debugtp_drct 0

scoreboard objectives add taste_summary dummy taste_summary

scoreboard objectives add backpack_volume dummy backpack_volume

#Музыка
scoreboard objectives add music_delay dummy music_delay
scoreboard objectives add music_volume dummy music_volume
scoreboard objectives add music_location dummy music_location
scoreboard objectives add music_loc_log dummy music_loc_log

#Дебаг скиллпоинтов
scoreboard objectives add skill_points_dbg dummy skill_points_dbg

#Достижения
scoreboard objectives add ach_space dummy ach_space
scoreboard objectives add ach_hot_mines dummy ach_hot_mines

#Взгляд вниз
scoreboard objectives add dtct_look_down dummy ach_hot_mines

#Электро
scoreboard objectives add battery_avail dummy battery_avail
scoreboard objectives add battery_charge dummy battery_charge
scoreboard objectives add battery_charg_lg dummy battery_charg_lg
scoreboard objectives add battery_max dummy battery_max
scoreboard objectives add battery_max_log dummy battery_max_log


scoreboard objectives add saturation dummy saturation

#Статистика
    scoreboard objectives add count_death dummy count_death
    # Мобы
        scoreboard objectives add count_mob_kills dummy count_mob_kills
    # Минибоссы
        scoreboard objectives add count_mbs_kills dummy count_mbs_kills
    # Боссы
        scoreboard objectives add count_bss_kills dummy count_bss_kills
    scoreboard objectives add count_hits dummy count_hits
    scoreboard objectives add count_distance dummy count_distance
    scoreboard objectives add count_dist_x100 dummy count_dist_x100

    # Заклинания
        scoreboard objectives add count_spells dummy count_spells
        scoreboard objectives add count_spent_mp dummy count_mp

# Дебаг верификаций
    scoreboard objectives add debug_verify dummy debug_verify

scoreboard objectives add portal7_delay dummy portal7_delay

scoreboard objectives add vicious_flame dummy vicious_flame

# Порочный демон и его механики
    scoreboard objectives add vicious_demon dummy vicious_demon
    scoreboard objectives add vic_dem_hit_cnt dummy vic_dem_hit_cnt
    scoreboard objectives add vic_dem_defeated dummy vic_dem_defeated
    scoreboard objectives add vic_dem_rest dummy vic_dem_rest

# Бонус урона порочного кинжала
    scoreboard objectives add vic_dag_bonus dummy vic_dag_bonus

scoreboard objectives add dwarf_cam_cd dummy dwarf_cam_cd
scoreboard objectives add dwarf_curse dummy dwarf_curse

scoreboard objectives add dummy_damage dummy dummy_damage

scoreboard objectives add uni_cool_down dummy uni_cool_down

scoreboard objectives add block_power dummy block_power

scoreboard objectives add aoe_dmg dummy aoe_dmg

# Кристаллы возрождения
    scoreboard objectives add crys_dur dummy crys_dur
    scoreboard objectives add crys_mob_calm dummy crys_mob_calm
    scoreboard objectives add crys_return dummy crys_return
    scoreboard objectives add crys_sw_respawn dummy crys_sw_respawn

scoreboard objectives add heal_scrl_durt dummy heal_scrl_durt

scoreboard objectives add lamp_oil dummy lamp_oil
scoreboard objectives add lamp_oil_prc dummy lamp_oil_prc
scoreboard objectives add max_light_range dummy max_light_range
# Магические светильники
    scoreboard objectives add allow_magilight dummy allow_magilight
    scoreboard objectives add allow_archlight dummy allow_archlight

# Уникальный идентефикатор
    scoreboard objectives add UID dummy UID

# Магический рывок
    scoreboard objectives add tp_cd dummy tp_cd
    scoreboard objectives add tp_cd_ghost dummy tp_cd_ghost

# Отслеживание режима игры игроков (gamemode)
    scoreboard objectives add gamemode_data dummy gamemode_data
    scoreboard objectives add gamemode_data_log dummy gamemode_data_log

# Фракции
    scoreboard objectives add faction dummy faction

scoreboard objectives add restrict_block_interact dummy restrict_block_interact

scoreboard objectives add mp_boost_by_amul_of_starpower dummy mp_boost_by_amul_of_starpower

# Аппаратура в МЭ
    scoreboard objectives add generator_in_electronics_shop_cd dummy generator_in_electronics_shop_cd
    scoreboard objectives add printer_in_electrinics_shop_cycle dummy printer_in_electrinics_shop_cycle

# Универсальный радиоключ
    # Просто тестовый ключ для теста алгоритма. Не используется функционально в игре.
        scoreboard objectives add urk_12343 dummy urk_12343
    # Используемые ключи в игре
        scoreboard objectives add urk_19D837AB277 dummy urk_19D837AB277
        scoreboard objectives add urk_D0782133229 dummy urk_D0782133229
        scoreboard objectives add urk_ABC12345F dummy urk_ABC12345F
        scoreboard objectives add urk_98221DA8124 dummy urk_98221DA8124
        scoreboard objectives add urk_0001 dummy urk_0001
        scoreboard objectives add urkm_AFB7125BF065 dummy urkm_AFB7125BF065
        scoreboard objectives add urk_1398AACBC8 dummy urk_1398AACBC8
        scoreboard objectives add urkm_5F8E7D827D2C10A1 dummy urkm_5F8E7D827D2C10A1
        scoreboard objectives add urk_F48DC3DBC dummy urk_F48DC3DBC

scoreboard objectives add e19_generator_enabled dummy e19_generator_enabled

# Состояние монитора, траиирующего электричество из Э-19
    scoreboard objectives add e19_tracer_condition dummy e19_tracer_condition 
    # 0 - Отключен
    # 1 - Включен, не залогинен
    # 2 - Включен + залогинен
    # 10 и далее - состояния активной трассировки 
        # 10 - МЭ
        # 11 - Оклик 6

scoreboard objectives add hail6_enabled dummy hail6_enabled
scoreboard objectives add hail6_second_moon_power dummy hail6_second_moon_power

# Бой с Мартом
    # Был ли хоть раз побежден?
        scoreboard objectives add march_defeated dummy march_defeated
    # Сколько секунд прошло с начала боя 
        scoreboard objectives add march_battle_time dummy march_battle_time
    # Сколько игроков за чертой (триггер начала боя)
        scoreboard objectives add march_crossed_line_players_counter dummy march_crossed_line_players_counter

    # КД
        # Кд при стрельбе. Контроллирует саму стрельбу и то, чтобы она не повторялась слишком часто
            scoreboard objectives add march_shoot_cd dummy march_shoot_cd

scoreboard objectives add spell_of_small_head dummy spell_of_small_head