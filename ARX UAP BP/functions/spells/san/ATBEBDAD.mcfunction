#Анализ доступности
    scoreboard players set @p mp_req 20

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] water_block 60
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] water_delay 0

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] water_block 60
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] water_delay 0

    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp