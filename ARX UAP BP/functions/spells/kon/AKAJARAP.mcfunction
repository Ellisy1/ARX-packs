#Анализ доступности
    scoreboard players set @p mp_req 40

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available] ~ ~ ~ playsound dissecting_fog @a ~ ~ ~


    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ particle arx:sempra_a ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p regeneration 20 1
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @p[tag=self, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 4 suicide
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @p[tag=self, scores={tick_nosempra_a=!0}] 3 suicide
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @p[tag=self, scores={tick_nosempra_b=!0}] 1 suicide
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @p[tag=self, scores={tick_nosempra_c=!0}] 0 suicide

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ particle arx:sempra_a ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ effect @p[tag=self] regeneration 20 1
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @p[tag=self2, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 4 suicide
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @p[tag=self2, scores={tick_nosempra_a=!0}] 3 suicide
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @p[tag=self2, scores={tick_nosempra_b=!0}] 1 suicide
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @p[tag=self2, scores={tick_nosempra_c=!0}] 0 suicide

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ particle arx:sempra_a ~ ~1 ~
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ effect @p[tag=self] regeneration 20 1
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 4 suicide
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_a=!0}] 3 suicide
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_b=!0}] 1 suicide
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_c=!0}] 0 suicide

    function spells/operations/withdraw_mp