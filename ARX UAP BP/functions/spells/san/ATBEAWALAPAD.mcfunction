#Анализ доступности
    scoreboard players set @p mp_req 60

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_titanite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players add @a[r=15] tick_nosempra_b 60
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @a[r=15] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @a[r=15] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players add @p[tag=self2] tick_nosempra_b 60
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @a[r=15, tag=!self] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~2 ~
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @a[r=15, tag=!self] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ scoreboard players add @e[r=15, type=!player, type=!item] tick_nosempra_b 60
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!player, type=!item] ~ ~ ~ particle arx:block_kon_inoffo_sempra ~ ~1 ~
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ execute @e[r=15, type=!player, type=!item] ~ ~ ~ playsound block_kon_inoffo_sempra @a ~ ~ ~

    function spells/operations/withdraw_mp