#Анализ доступности
    scoreboard players set @p mp_req 20

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_painit, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ particle arx:vicious_flame ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @p[tag=self] vicious_flame 3

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2] ~ ~ ~ particle arx:vicious_flame ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @p[tag=self2] vicious_flame 3

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ particle arx:vicious_flame ~ ~1 ~
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ scoreboard players add @s vicious_flame 3
    
    function spells/operations/withdraw_mp