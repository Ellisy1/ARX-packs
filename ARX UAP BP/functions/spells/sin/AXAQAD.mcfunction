#Анализ доступности
    scoreboard players set @p mp_req 20

    tag @p[tag=self, tag=staff_sin] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] bow_spell_a 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] bow_spell_b 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] bow_spell_c 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] bow_spell_d 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_a 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_b 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_c 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_d 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_e 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @a[r=15] jump_speed_up_f 0

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] bow_spell_a 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] bow_spell_b 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] bow_spell_c 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] bow_spell_d 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_a 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_b 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_c 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_d 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_e 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @a[r=15, tag=!self] jump_speed_up_f 0

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_a 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_b 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_c 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_d 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_e 0
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players set @e[r=15, type=!player, type=!item] jump_speed_up_f 0

    function spells/operations/withdraw_mp