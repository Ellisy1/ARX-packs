#Анализ доступности
    scoreboard players set @p mp_req 30

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ effect @p clear

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ effect @p[tag=self2] clear

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ effect @e[r=15, tag=!player] clear

    function spells/operations/withdraw_mp