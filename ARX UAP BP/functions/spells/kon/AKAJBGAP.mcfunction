#Анализ доступности
    scoreboard players set @p mp_req 30

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_painit, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    tag @p[tag=self, tag=spell_available, scores={target=1}] add cant_be_casted_cus_of_target

    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:cave_rat] -10000 -70 -10000
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:rat_ghost] -10000 -70 -10000
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:rat_monstr] -10000 -70 -10000
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:rat_monstr_white] -10000 -70 -10000
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:small_rat_black] -10000 -70 -10000
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ tp @e[r=15, type=arx:small_rat_white] -10000 -70 -10000

    function spells/operations/withdraw_mp