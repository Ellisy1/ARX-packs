#Анализ доступности
    scoreboard players set @p mp_req 15

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @a[r=15] regeneration 10 0 

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @a[tag=!self, r=15] regeneration 10 0

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ effect @e[r=15, type=!player, type=!item] regeneration 10 0

    function spells/operations/withdraw_mp