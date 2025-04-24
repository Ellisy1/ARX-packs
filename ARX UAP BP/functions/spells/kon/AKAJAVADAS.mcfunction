#Анализ доступности
    scoreboard players set @p mp_req 50

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_painit, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available] ~ ~ ~ playsound dissecting_fog @a ~ ~ ~

    
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @a[r=15] tick_sempra_dps 4

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @a[tag=!self, r=15] tick_sempra_dps 4
    
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[type=!player, type=!item, type=!arx:grave, r=15] ~ ~ ~ scoreboard players add @e[r=0.0001] tick_sempra_dps 4
    
    function spells/operations/withdraw_mp