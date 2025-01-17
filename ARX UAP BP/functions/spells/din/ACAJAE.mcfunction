#Анализ доступности
    scoreboard players set @p mp_req 60

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=1..100, ill_mild_cold=0}] ill_mild_cold 14600
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=101..200, ill_anal_fissure=0}] ill_anal_fissure 2400
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=201..300, ill_helminth=0}] ill_helminth 2400
    
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=1..100, ill_mild_cold=0}] ill_mild_cold 14600
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=101..200, ill_anal_fissure=0}] ill_anal_fissure 2400
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=201..300, ill_helminth=0}] ill_helminth 2400

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp