#Анализ доступности
    scoreboard players set @p mp_req 5

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p regeneration 10 0 

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @p[tag=self2] regeneration 10 0

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ effect @e[r=15, type=!player, type=!item] regeneration 10 0

    function spells/operations/withdraw_mp