#Анализ доступности
    scoreboard players set @p mp_req 18

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_painit, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    tag @p[tag=self, tag=spell_available, scores={target=1}] add cant_be_casted_cus_of_target

    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ event entity @e[r=15, type=arx:small_rat_black] become_calm
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ event entity @e[r=15, type=arx:small_rat_white] become_calm
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ event entity @e[r=15, type=arx:rat_monstr] become_calm
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ event entity @e[r=15, type=arx:rat_monstr_white] become_calm

    function spells/operations/withdraw_mp