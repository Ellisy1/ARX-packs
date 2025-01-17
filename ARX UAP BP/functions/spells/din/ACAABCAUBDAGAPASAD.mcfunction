#Анализ доступности
    scoreboard players set @p mp_req 120

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ w @s Кажется, это заклинание невозможно применить на себя
    tag @p[tag=self, tag=spell_available, scores={target=1}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ w @s Кажется, это заклинание невозможно применить на ближайшего
    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=armor_stand] ~ ~ ~ summon arx:resurrected_armor_stand
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ kill @e[r=15, type=armor_stand]

    function spells/operations/withdraw_mp