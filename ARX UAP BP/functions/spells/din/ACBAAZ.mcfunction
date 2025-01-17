#Анализ доступности
    scoreboard players set @p mp_req 15

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p ~ ~ ~ summon lightning_bolt
    
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ summon lightning_bolt

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!item, type=!player] ~ ~ ~ summon lightning_bolt

    function spells/operations/withdraw_mp