#Анализ доступности
    scoreboard players set @p mp_req 60

    tag @p[tag=self, tag=staff_sin] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @a[r=15] jump_speed_up_c 30
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @a[r=15] ~ ~ ~ particle arx:sofiso_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @a[tag=!self, r=15] jump_speed_up_c 30
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @a[tag=!self, r=15] ~ ~ ~ particle arx:sofiso_a ~ ~2 ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players add @e[r=15, type=!item, type=!player] jump_speed_up_c 30
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!item, type=!player] ~ ~ ~ particle arx:sofiso_a ~ ~1 ~

    function spells/operations/withdraw_mp