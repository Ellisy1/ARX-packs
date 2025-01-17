#Анализ доступности
    scoreboard players set @p mp_req 180

    tag @p[tag=self, tag=staff_sin] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @p[tag=self] jump_speed_up_c 170
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ particle arx:sofiso_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @p[tag=self2] jump_speed_up_c 170
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ particle arx:sofiso_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players add @e[r=15, type=!item, type=!player] jump_speed_up_c 170
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!item, type=!player] ~ ~ ~ particle arx:sofiso_a ~ ~1 ~

    function spells/operations/withdraw_mp