#Анализ доступности
    scoreboard players set @p mp_req 1

    tag @p[tag=self, tag=staff_kon] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=0}] ~ ~ ~ w @p У меня 0 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=1}] ~ ~ ~ w @p У меня 1 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=2}] ~ ~ ~ w @p У меня 2 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=3}] ~ ~ ~ w @p У меня 3 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=4}] ~ ~ ~ w @p У меня 4 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=5}] ~ ~ ~ w @p У меня 5 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=6}] ~ ~ ~ w @p У меня 6 ур. прокачки в силу

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=0}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 0 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=1}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 1 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=2}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 2 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=3}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 3 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=4}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 4 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=5}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 5 ур. прокачки в силу
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=6}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 6 ур. прокачки в силу

    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp