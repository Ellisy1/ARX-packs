playsound click @a ~ ~ ~ 

execute if entity @s[tag=!urk_remote_controller_mode] run function high_tec/urk/default_mode
execute if entity @s[tag=urk_remote_controller_mode] run function high_tec/urk/remote_controller_mode