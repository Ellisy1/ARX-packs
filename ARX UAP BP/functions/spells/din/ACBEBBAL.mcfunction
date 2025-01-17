#Анализ доступности
    scoreboard players set @p mp_req 40

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ tellraw @s { "rawtext": [ { "text": "§dМаяк установлен" } ] }
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p tp_backpoint 200
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ summon armor_stand
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ tag @e[type=armor_stand, r = 0.1] add tp_backpoint
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @e[type=armor_stand, r = 0.1] invisibility 999999 255 true

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на ближайшего
    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp