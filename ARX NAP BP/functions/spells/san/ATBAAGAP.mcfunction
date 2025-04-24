#Анализ доступности
    scoreboard players set @s mp_req 90

    tag @s[tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1}] run scoreboard players add @s lamp_oil 33000
    execute as @s[tag=spell_available, scores={target=1}] run tellraw @s { "rawtext": [ { "text": "§dВаша лампа заполняется маслом!" } ] }

    execute at @s[tag=spell_available, scores={target=2}] run scoreboard players add @p[tag=self2] lamp_oil 33000
    execute as @s[tag=spell_available, scores={target=2}] run tellraw @p[tag=self2] { "rawtext": [ { "text": "§dВаша лампа заполняется маслом!" } ] }

    tag @s[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp