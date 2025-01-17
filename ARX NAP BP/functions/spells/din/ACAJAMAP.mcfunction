#Анализ доступности
    scoreboard players set @s mp_req 15

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}, tag=!disable_magic_of_modified_moving] run effect @s levitation 1 8 true 
    execute as @s[tag=spell_available, scores={target=1}, tag=disable_magic_of_modified_moving] run tag @s add block_mp_withdraw

    execute at @s[tag=spell_available, scores={target=2}] run effect @p[tag=self2, tag=!disable_magic_of_modified_moving] levitation 1 8 true 

    execute at @s[tag=spell_available, scores={target=3}, tag=!disable_magic_of_modified_moving] run effect @e[r=15, type=!player] levitation 1 8 true 

    function spells/operations/withdraw_mp