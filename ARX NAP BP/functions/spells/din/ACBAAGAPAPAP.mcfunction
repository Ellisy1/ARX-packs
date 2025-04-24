#Анализ доступности
    scoreboard players set @s mp_req 40

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] if entity @s[scores={allow_archlight=0}] run give @s arx:archilight
    execute as @s[tag=spell_available, scores={target=1}] run scoreboard players set @s[scores={allow_archlight=..180}] allow_archlight 180

    execute as @s[tag=spell_available, scores={target=2}] if entity @p[tag=self2, scores={allow_archlight=0}] run give @p[tag=self2] arx:archilight
    execute as @s[tag=spell_available, scores={target=2}] run scoreboard players set @p[tag=self2, scores={allow_archlight=..180}] allow_archlight 180

    tag @s[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp