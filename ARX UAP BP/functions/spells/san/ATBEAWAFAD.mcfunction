#Анализ доступности
    scoreboard players set @p mp_req 30

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @p[r=15] pois_block 120
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @a[r=15] ~ ~ ~ particle arx:shumi_b ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @p[tag=!self, r=15] pois_block 120
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=!self, r=15] ~ ~ ~ particle arx:shumi_b ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players add @e[r=15, type=!player, type=!item] pois_block 120
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!player, type=!item] ~ ~ ~ particle arx:shumi_b ~ ~1 ~

    function spells/operations/withdraw_mp