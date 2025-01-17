#Анализ доступности
    scoreboard players set @p mp_req 60

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @a[r=15, scores={blind_block=0}] darkness 40 0 true

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @a[r=15, tag=!self, scores={blind_block=0}] darkness 40 0 true

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p кажется, это заклинание так не работает
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp