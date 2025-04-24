#Анализ доступности
    scoreboard players set @s mp_req 210

    tag @s[tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] run effect @s fire_resistance 300 0 false

    execute at @s[tag=spell_available, scores={target=2}] run effect @p[tag=self2] fire_resistance 300 0 false

    execute at @s[tag=spell_available, scores={target=3}] run effect @e[type=!player] fire_resistance 300 0 false

    function spells/operations/withdraw_mp