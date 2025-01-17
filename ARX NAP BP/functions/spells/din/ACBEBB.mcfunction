#Анализ доступности
    scoreboard players set @s mp_req 30

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] at @s run function portal

    execute as @s[tag=spell_available, scores={target=2}] as @p[tag=self2] at @s run function portal

    tag @p[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp