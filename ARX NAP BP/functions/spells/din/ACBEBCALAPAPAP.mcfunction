#Анализ доступности
    scoreboard players set @s mp_req 160

    tag @s[tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute as @s[tag=spell_available, scores={target=1, mark=1..}] run tellraw @s { "rawtext": [ { "text": "§aУ вас появляется огромная грудь..." } ] }
    execute as @s[tag=spell_available, scores={target=1, mark=1..}] run event entity @s arx:property_bust_size_set_3
    execute as @s[tag=spell_available, scores={target=1, mark=0}] run tellraw @s { "rawtext": [ { "text": "§cКажется, без заклинания метки это бесполезно..." } ] }
    execute as @s[tag=spell_available, scores={target=1, mark=0}] run tag @s add block_mp_withdraw

    execute as @s[tag=spell_available, scores={target=2}] as @p[tag=self2, scores={mark=1..}] run tellraw @s { "rawtext": [ { "text": "§aУ вас появляется огромная грудь..." } ] }
    execute as @s[tag=spell_available, scores={target=2}] as @p[tag=self2, scores={mark=1..}] run event entity @s arx:property_bust_size_set_3
    execute as @s[tag=spell_available, scores={target=2}] as @p[tag=self2, scores={mark=0}] run tellraw @p[tag=self] { "rawtext": [ { "text": "§cКажется, без заклинания метки это бесполезно..." } ] }
    execute as @s[tag=spell_available, scores={target=2}] as @p[tag=self2, scores={mark=0}] run tag @p[tag=self] add block_mp_withdraw

    tag @s[tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp