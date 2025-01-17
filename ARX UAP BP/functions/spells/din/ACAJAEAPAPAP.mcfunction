#Анализ доступности
    scoreboard players set @p mp_req 160

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=1..100, ill_pneumonia=0}] ill_pneumonia 19200
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=101..150, ill_cancer=0}] ill_cancer 200000
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={custom_random=151..200, ill_appendicitis=0}] ill_appendicitis 20000
    
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=1..100, ill_pneumonia=0}] ill_pneumonia 19200
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=101..150, ill_cancer=0}] ill_cancer 200000
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={custom_random=151..200, ill_appendicitis=0}] ill_appendicitis 20000

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p кажется, это заклинание так не работает
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp