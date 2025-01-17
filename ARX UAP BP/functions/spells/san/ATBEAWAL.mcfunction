#Анализ доступности
    scoreboard players set @p mp_req 15

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @p tick_nosempra_a 60
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @p[tag=self2] tick_nosempra_a 60
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players add @e[r=15, type=!player, type=!item] tick_nosempra_a 60
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!player, type=!item] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~1 ~
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!player, type=!item] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    function spells/operations/withdraw_mp