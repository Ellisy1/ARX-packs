#Анализ доступности
    scoreboard players set @s mp_req 60

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] run scoreboard players set @s spell_of_small_head 60

    execute as @s[tag=spell_available, scores={target=2}] run scoreboard players set @p[tag=self2] spell_of_small_head 60

    tag @p[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp