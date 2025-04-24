#Анализ доступности
    scoreboard players set @s mp_req 45

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}, tag=!disable_magic_of_modified_moving] run effect @s levitation 1 20 true 
    execute as @s[tag=spell_available, scores={target=1}, tag=disable_magic_of_modified_moving] run tag @s add block_mp_withdraw

    execute at @s[tag=spell_available, scores={target=2}] run effect @p[tag=self2, tag=!disable_magic_of_modified_moving] levitation 1 20 true 

    execute at @s[tag=spell_available, scores={target=3}, tag=!disable_magic_of_modified_moving] run effect @e[r=15, type=!player] levitation 1 20 true 

    function spells/operations/withdraw_mp