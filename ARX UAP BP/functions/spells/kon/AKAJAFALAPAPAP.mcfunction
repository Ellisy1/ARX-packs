#Анализ доступности
    scoreboard players set @p mp_req 120

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_painit, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p[tag=self, scores={pois_block=0}] fatal_poison 60 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ particle arx:poison_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @p[tag=self2, scores={pois_block=0}] fatal_poison 60 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ particle arx:poison_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ effect @e[type=!player, type=!item, r=15, scores={pois_block=0}] fatal_poison 60 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ particle arx:poison_a ~ ~1 ~

    function spells/operations/withdraw_mp