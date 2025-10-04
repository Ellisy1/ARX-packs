# Автоматическая регистрация scores в мире

# Установка некоторых важных gamerule
    gamerule mobgriefing false
    gamerule naturalregeneration false
    gamerule tntexplodes false
    gamerule spawnradius 0
    gamerule doimmediaterespawn true
    gamerule doweathercycle false 
    gamerule showdeathmessages false

# Просчет стабильности
    scoreboard objectives add stability_core dummy stability_core
    scoreboard objectives add stability_const dummy stability_const
    scoreboard players set @s stability_const 1200

# Просчет кармы
    scoreboard objectives add karma_pallas dummy Карма_пл
    scoreboard objectives add karma_pires dummy Карма_пр

# Переменная верификации и её настройка
    scoreboard objectives add verify dummy Верификация
    scoreboard players set @s verify 2

# Различные переменные рандома
    scoreboard objectives add attack_anim_rand dummy Аним_атаки
    scoreboard objectives add custom_random dummy Спец_ранд 
    scoreboard objectives add custom_random_b dummy Спец_ранд_b
    scoreboard objectives add custom_random_c dummy Спец_ранд_c

scoreboard objectives add drugs_delay dummy Наркозавис.

scoreboard objectives add gender dummy Пол_перс.
scoreboard objectives add time_h dummy "Часы игры"
scoreboard objectives add time_m dummy Минуты-игры.
scoreboard objectives add water_delay dummy Намокание
scoreboard objectives add water_block dummy Намокание
scoreboard objectives add class dummy is_ghost
scoreboard objectives add target dummy цель_мага

scoreboard objectives add mp_current dummy Текущая_мана
scoreboard objectives add mp_req dummy Треб_маны_для_закл
scoreboard objectives add mp dummy Мана

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
scoreboard objectives add weighLoading dummy Загруж.

scoreboard objectives add final_mining dummy final_mining

scoreboard objectives add sneese_prob dummy sneese_prob
scoreboard objectives add cough_prob dummy cough_prob

scoreboard objectives add no_hard_ill dummy no_hard_ill

scoreboard objectives add no_dark_fog dummy no_dark_fog

scoreboard objectives add poit_mp_reg dummy poit_mp_reg

scoreboard objectives add blocking dummy Блокировка

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


scoreboard objectives add move_delay dummy задержка_аним_бездействия
            
scoreboard objectives add freezing dummy freezing

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
scoreboard players set @s weather_cond 0

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

scoreboard objectives add no_fog dummy no_fog

scoreboard objectives add nightvis_saki dummy nightvis_saki

scoreboard objectives add item_control dummy item_control



# Константы (для команд scoreboard players operation...)
    scoreboard objectives add const_-1 dummy Константа_-1
    scoreboard players set @s const_-1 -1
    scoreboard objectives add const_0 dummy Константа_0
    scoreboard players set @s const_0 0
    scoreboard objectives add const_2 dummy Константа_2
    scoreboard players set @s const_2 2
    scoreboard objectives add const_3 dummy Константа_3
    scoreboard players set @s const_3 3
    scoreboard objectives add const_4 dummy Константа_4
    scoreboard players set @s const_4 4
    scoreboard objectives add const_5 dummy Константа_5
    scoreboard players set @s const_5 5
    scoreboard objectives add const_10 dummy Константа_10
    scoreboard players set @s const_10 10
    scoreboard objectives add const_19 dummy Константа_19
    scoreboard players set @s const_19 19
    scoreboard objectives add const_20 dummy Константа_20
    scoreboard players set @s const_20 20
    scoreboard objectives add const_25 dummy Константа_25
    scoreboard players set @s const_25 25
    scoreboard objectives add const_50 dummy Константа_50
    scoreboard players set @s const_50 50
    scoreboard objectives add const_80 dummy Константа_80
    scoreboard players set @s const_80 80
    scoreboard objectives add const_75 dummy Константа_75
    scoreboard players set @s const_75 75
    scoreboard objectives add const_100 dummy Константа_100
    scoreboard players set @s const_100 100
    scoreboard objectives add const_300 dummy Константа_300
    scoreboard players set @s const_300 300
    scoreboard objectives add const_850 dummy Константа_850
    scoreboard players set @s const_850 850
    scoreboard objectives add const_1000 dummy Константа_1к
    scoreboard players set @s const_1000 1000
    scoreboard objectives add const_1030 dummy Константа_1.03к
    scoreboard players set @s const_1030 1030
    scoreboard objectives add const_1050 dummy Константа_1.05к
    scoreboard players set @s const_1050 1050
    scoreboard objectives add const_1100 dummy Константа_1.1к
    scoreboard players set @s const_1100 1100
    scoreboard objectives add const_1150 dummy Константа_1.15к
    scoreboard players set @s const_1150 1150
    scoreboard objectives add const_1200 dummy Константа_1.2к
    scoreboard players set @s const_1200 1200
    scoreboard objectives add const_1250 dummy Константа_1.25к
    scoreboard players set @s const_1250 1250
    scoreboard objectives add const_1300 dummy Константа_1.3к
    scoreboard players set @s const_1300 1300
    scoreboard objectives add const_1500 dummy Константа_1.5к
    scoreboard players set @s const_1500 1500

#ТИКИ
scoreboard objectives add tick_nosempra_a dummy sempra-25
scoreboard objectives add tick_nosempra_b dummy sempra-50
scoreboard objectives add tick_nosempra_c dummy sempra-100
scoreboard objectives add tick_sempra_dps dummy маг.ур.в.сек
scoreboard objectives add tick dummy такт
scoreboard objectives add sec dummy секунда

scoreboard players set @s tick 0
scoreboard players set @s sec 0

scoreboard objectives setdisplay list time_h

scoreboard objectives add attack_weakness dummy attack_weakness

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


# Броня
    scoreboard objectives add armor_assas_dmg dummy armor_assas_dmg
    scoreboard objectives add armor_conq_dmg dummy armor_conq_dmg
    scoreboard objectives add armor_ranger_dmg dummy armor_ranger_dmg

    scoreboard objectives add debugtp_drct dummy debugtp_drct
    scoreboard players set @s debugtp_drct 0

    scoreboard objectives add taste_summary dummy taste_summary

    scoreboard objectives add backpack_volume dummy backpack_volume

# Дебаг скиллпоинтов
    scoreboard objectives add skill_points_dbg dummy skill_points_dbg

# Высокотехнологичное
    scoreboard objectives add battery_avail dummy battery_avail
    scoreboard objectives add battery_charge dummy battery_charge
    scoreboard objectives add battery_charg_lg dummy battery_charg_lg
    scoreboard objectives add battery_max dummy battery_max
    scoreboard objectives add battery_max_log dummy battery_max_log


scoreboard objectives add saturation dummy saturation

# Статистика
    scoreboard objectives add count_death dummy count_death
    # Мобы
        scoreboard objectives add count_mob_kills dummy count_mob_kills

    # Минибоссы
        scoreboard objectives add count_mbs_kills dummy count_mbs_kills

    # Боссы
        scoreboard objectives add count_bss_kills dummy count_bss_kills

    # Удары (полученные)
        scoreboard objectives add count_hits dummy count_hits

    # Заклинания
        scoreboard objectives add count_spells dummy count_spells
        scoreboard objectives add count_spent_mp dummy count_mp
    
    # Блоки
        scoreboard objectives add count_broken_blocks dummy count_broken_blocks
        scoreboard objectives add count_placed_blocks dummy count_placed_blocks

# Дебаг верификаций
    scoreboard objectives add debug_verify dummy debug_verify

# Порочный демон и связанные с ним механики
    scoreboard objectives add vicious_demon dummy vicious_demon
    scoreboard objectives add vic_dem_hit_cnt dummy vic_dem_hit_cnt
    scoreboard objectives add vic_dem_defeated dummy vic_dem_defeated
    scoreboard objectives add vic_dem_rest dummy vic_dem_rest
    scoreboard objectives add vicious_flame dummy vicious_flame
    scoreboard objectives add vic_dag_bonus dummy vic_dag_bonus

scoreboard objectives add dwarf_cam_cd dummy dwarf_cam_cd
scoreboard objectives add dwarf_curse dummy dwarf_curse

scoreboard objectives add uni_cool_down dummy uni_cool_down


# Кристаллы возрождения
    scoreboard objectives add crys_dur dummy crys_dur
    scoreboard objectives add crys_mob_calm dummy crys_mob_calm
    scoreboard objectives add crys_return dummy crys_return
    scoreboard objectives add crys_sw_respawn dummy crys_sw_respawn

scoreboard objectives add heal_scrl_durt dummy heal_scrl_durt

# Магические светильники
    scoreboard objectives add allow_magilight dummy allow_magilight
    scoreboard objectives add allow_archlight dummy allow_archlight

# Уникальный идентефикатор
    scoreboard objectives add UID dummy UID

# Магический рывок
    scoreboard objectives add tp_cd dummy tp_cd
    scoreboard objectives add tp_cd_ghost dummy tp_cd_ghost

scoreboard objectives add mp_boost_by_amul_of_starpower dummy mp_boost_by_amul_of_starpower

# Универсальный радиоключ
    # Просто тестовый ключ для теста алгоритма. Не используется функционально в игре.
        scoreboard objectives add urk_12343 dummy urk_12343
    # Используемые ключи в игре

scoreboard objectives add e19_generator_enabled dummy e19_generator_enabled

scoreboard objectives add spell_of_small_head dummy spell_of_small_head

# Нокаут
    scoreboard objectives add knockout_row_sounter dummy Счетчик_последовательности_ноков

# Обучение
    scoreboard objectives add learning dummy Этап_обучения

# Данные для отката в до-смертельное состояние
    scoreboard objectives add xp_roll_back dummy xp_roll_back
    scoreboard objectives add xp_stage_roll_back dummy xp_stage_roll_back

# Динамический свет
    scoreboard objectives add dynamic_light_power dummy dynamic_light_power