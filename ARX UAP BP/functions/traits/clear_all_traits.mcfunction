tag @p add self

#нормальная камера
tellraw @p[tag=self, rxm=-89] { "rawtext": [ { "text": "§fЯ могу сбросить все черты характера, кроме ė: черты характера, полученные сторонним путём. \n§8§oЧтобы сбросить черты, используйте этот предмет, смотря вертикально вверх." } ] }

#поднятая камера
execute @s[rx=-89] ~ ~ ~ playsound undemon @a ~ ~ ~ 
title @p[tag=self, rx=-89] title §gЧерты успешно сброшены

execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_inflexible 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_powerful 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_indeclinable 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_enlightened 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_bright_look 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_wise 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_persistent 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_tenacious 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_conscious 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_genious 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_water_lover 0

execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_indifference 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_angry 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_loner 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_rude 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_warmy 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_coldy 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_manipulator 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_charismatic 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_communicative 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_unstable 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_miner 0

execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_cowardly 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_schizophrenic 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_stupid 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_paranoid 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nospider 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nonecro 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nosocio 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_notecno 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nodarkness 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nomines 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_religious 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nolight 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nocold 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_nowarm 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_lazy 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_impulsive_par 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_paranoid_mas 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_fastidious 0
execute @p[tag=self, rx=-89] ~ ~ ~ scoreboard players set @p c_aquaphobe 0

clear @p[tag=self, rx=-89] arx:wipe_traits 0 1

scoreboard players add @p[tag=self, rx=-89] xp_tray 1000 

tag @p remove self