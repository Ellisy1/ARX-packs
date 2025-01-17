#Анализ доступности
    scoreboard players set @p mp_req 40

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p teleport_dmg 20

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ w @p кажется, это заклинание так не работает
    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p кажется, это заклинание так не работает
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp