#Анализ доступности
    scoreboard players set @p mp_req 10

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[r=15] tick_sempra_dps 0

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=!self, r=15] tick_sempra_dps 0

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, r=15] ~ ~ ~ scoreboard players set @e[r=0.0001] tick_sempra_dps 0
    
    function spells/operations/withdraw_mp