execute as @s[tag=spell_available, tag=!cant_be_casted_cus_of_target, tag=!block_mp_withdraw] run scoreboard players operation @s mp -= @s mp_req
# Статистика
    execute as @s[tag=spell_available, tag=!cant_be_casted_cus_of_target, tag=!block_mp_withdraw] run scoreboard players operation @s count_spent_mp += @s mp_req
    execute as @s[tag=spell_available, tag=!cant_be_casted_cus_of_target, tag=!block_mp_withdraw] run scoreboard players add @s count_spells 1