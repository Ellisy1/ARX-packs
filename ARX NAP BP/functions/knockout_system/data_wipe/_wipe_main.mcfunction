function knockout_system/data_wipe/wipe_achievements
function knockout_system/data_wipe/wipe_ready_spells

# Экспа
    scoreboard players set @s xp 0
    scoreboard players set @s xp_stage 0
    scoreboard players set @s skill_point 0
    scoreboard players set @s speed_skill 0
    scoreboard players set @s strength_skill 0
    scoreboard players set @s magic_skill 0

# Религия
    scoreboard players set @s religion 0

# Болезни
    scoreboard players set @s ill_cancer 0
    scoreboard players set @s ill_mild_cold 0
    scoreboard players set @s ill_severe_cold 0
    scoreboard players set @s ill_pneumonia 0
    scoreboard players set @s ill_broken_leg 0
    scoreboard players set @s ill_broken_arm 0
    scoreboard players set @s ill_flu 0
    scoreboard players set @s ill_helminth 0
    scoreboard players set @s ill_appendicitis 0
    scoreboard players set @s ill_anal_fissure 0
    scoreboard players set @s ill_r_head 0
    scoreboard players set @s ill_r_stomach 0

#Статистика
    scoreboard players set @s count_death 0

    scoreboard players set @s count_mbs_kills 0
    scoreboard players set @s count_mob_kills 0
    scoreboard players set @s count_bss_kills 0

    scoreboard players set @s count_death 0
    scoreboard players set @s count_hits 0
    scoreboard players set @s count_dist_x100 0

    scoreboard players set @s count_spells 0
    scoreboard players set @s count_spent_mp 0

#Возвращаем family в нормальное состояние
    event entity @s arx:return_default_family_data

#Класс
    scoreboard players set @s class 0

#Временные статы
    scoreboard players set @s freezing 0
    scoreboard players set @s stress 0
    scoreboard players set @s poisoning 0

# Черты
    scoreboard players set @s c_inflexible 0
    scoreboard players set @s c_powerful 0
    scoreboard players set @s c_indeclinable 0
    scoreboard players set @s c_enlightened 0
    scoreboard players set @s c_bright_look 0
    scoreboard players set @s c_wise 0
    scoreboard players set @s c_persistent 0
    scoreboard players set @s c_tenacious 0
    scoreboard players set @s c_conscious 0
    scoreboard players set @s c_genious 0
    scoreboard players set @s c_water_lover 0

    scoreboard players set @s c_indifference 0
    scoreboard players set @s c_angry 0
    scoreboard players set @s c_loner 0
    scoreboard players set @s c_rude 0
    scoreboard players set @s c_warmy 0
    scoreboard players set @s c_coldy 0
    scoreboard players set @s c_manipulator 0
    scoreboard players set @s c_charismatic 0
    scoreboard players set @s c_communicative 0
    scoreboard players set @s c_unstable 0
    scoreboard players set @s c_miner 0

    scoreboard players set @s c_cowardly 0
    scoreboard players set @s c_schizophrenic 0
    scoreboard players set @s c_stupid 0
    scoreboard players set @s c_paranoid 0
    scoreboard players set @s c_nospider 0
    scoreboard players set @s c_nonecro 0
    scoreboard players set @s c_nosocio 0
    scoreboard players set @s c_notecno 0
    scoreboard players set @s c_nodarkness 0
    scoreboard players set @s c_nomines 0
    scoreboard players set @s c_religious 0
    scoreboard players set @s c_nolight 0
    scoreboard players set @s c_nocold 0
    scoreboard players set @s c_nowarm 0
    scoreboard players set @s c_lazy 0
    scoreboard players set @s c_impulsive_par 0
    scoreboard players set @s c_paranoid_mas 0
    scoreboard players set @s c_fastidious 0
    scoreboard players set @s c_aquaphobe 0

    scoreboard players set @s c_seen_death 0
    scoreboard players set @s c_demon 0