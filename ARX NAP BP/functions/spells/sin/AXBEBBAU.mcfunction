#Анализ доступности
    scoreboard players set @s mp_req 16

    tag @s[tag=staff_sin] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] run scoreboard players set @s[scores={weighLoading=..6}] tp_cd 7
    execute as @s[tag=spell_available, scores={target=1}] run scoreboard players set @s[scores={weighLoading=..6}] tp_cd_ghost 7
    execute as @s[tag=spell_available, scores={target=1}] at @s[scores={weighLoading=..6}] run particle arx:magic_dash ~ ~1.3 ~ 
    execute as @s[tag=spell_available, scores={target=1}] run tellraw @s[scores={weighLoading=7..}] { "rawtext": [ { "text": "§cЭто заклинание невозможно использовать, если вы загружены на 7 или более единиц веса." } ] }
    execute as @s[tag=spell_available, scores={target=1}] run tag @s[scores={weighLoading=7..}] add block_mp_withdraw
    

    tag @s[tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    tag @s[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp