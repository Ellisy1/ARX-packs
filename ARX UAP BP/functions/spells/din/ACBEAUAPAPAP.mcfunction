#Анализ доступности
    scoreboard players set @p mp_req 180

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p night_vision 900 0 true

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @p[tag=self2] night_vision 900 0 true

    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp