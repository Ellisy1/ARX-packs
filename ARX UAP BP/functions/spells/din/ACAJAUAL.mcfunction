#Анализ доступности
    scoreboard players set @p mp_req 30

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p[tag=self, scores={blind_block=0}] darkness 20 0 true

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @p[tag=self2, scores={blind_block=0}] darkness 20 0 true

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp