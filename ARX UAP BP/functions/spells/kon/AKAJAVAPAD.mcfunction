#Анализ доступности
    scoreboard players set @p mp_req 60

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=5}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available] ~ ~ ~ playsound dissecting_fog @a ~ ~ ~

    
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @a[r=15] ~ ~ ~ particle arx:sempra_a ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @a[r=15, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 20 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @a[r=15, scores={tick_nosempra_a=!0}] 15 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @a[r=15, scores={tick_nosempra_b=!0}] 10 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ damage @a[r=15, scores={tick_nosempra_c=!0}] 0 entity_attack entity @p

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @a[tag=!self, r=15] ~ ~ ~ particle arx:sempra_a ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @a[tag=!self, r=15, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 20 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @a[tag=!self, r=15, scores={tick_nosempra_a=!0}] 15 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @a[tag=!self, r=15, scores={tick_nosempra_b=!0}] 10 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ damage @a[tag=!self, r=15, scores={tick_nosempra_c=!0}] 0 entity_attack entity @p

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ particle arx:sempra_a ~ ~1 ~
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 20 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_a=!0}] 15 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_b=!0}] 10 entity_attack entity @p
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ damage @e[r=0.0001, scores={tick_nosempra_c=!0}] 0 entity_attack entity @p
    
    function spells/operations/withdraw_mp