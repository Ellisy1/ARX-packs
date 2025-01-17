#Анализ доступности
    scoreboard players set @p mp_req 1

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ w @p[tag=self] Запрос на активные заклинания солнца и особую защиту на§a @p
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={mark=1..}] ~ ~ ~ w @p[tag=self] §eЗаклинание метки
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={regen_saki_a=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 1 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={regen_saki_b=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 2 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={regen_saki_c=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 3 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={resist_up_a=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 1 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={resist_up_b=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 2 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={resist_up_c=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 3 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={resist_up_d=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 4 уровня
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=0}] ~ ~ ~ w @p[tag=self] §eНет бонуса защиты
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=1}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 1
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=2}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 2
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=3}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 3
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=4}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 4
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={final_resist=5}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты слишком высокий
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={water_block_saki=1..}] ~ ~ ~ w @p[tag=self] §aПассивная защита от намокания
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={water_block=1..}] ~ ~ ~ w @p[tag=self] §aВременная защита от намокания
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={sin_host_block=1..}] ~ ~ ~ w @p[tag=self] §aВременная защита от магического понижения скорости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={sin_host_saki=1..}] ~ ~ ~ w @p[tag=self] §aПассивная защита от магического понижения скорости

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ w @p[tag=self] Запрос на активные заклинания солнца и особую защиту на§a @p[tag=self2]
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={mark=1..}] ~ ~ ~ w @p[tag=self] §eЗаклинание метки
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={regen_saki_a=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 1 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={regen_saki_b=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 2 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={regen_saki_c=1..}] ~ ~ ~ w @p[tag=self] §aМагическая регенерация 3 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={resist_up_a=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 1 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={resist_up_b=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 2 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={resist_up_c=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 3 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={resist_up_d=1..}] ~ ~ ~ w @p[tag=self] §aМагическая защита 4 уровня
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=0}] ~ ~ ~ w @p[tag=self] §eНет бонуса защиты
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=1}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 1
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=2}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 2
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=3}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 3
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=4}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты: 4
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={final_resist=5}] ~ ~ ~ w @p[tag=self] §aСуммарный показатель защиты слишком высокий
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={water_block_saki=1..}] ~ ~ ~ w @p[tag=self] §aПассивная защита от намокания
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={water_block=1..}] ~ ~ ~ w @p[tag=self] §aВременная защита от намокания
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={sin_host_block=1..}] ~ ~ ~ w @p[tag=self] §aВременная защита от магического понижения скорости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={sin_host_saki=1..}] ~ ~ ~ w @p[tag=self] §aПассивная защита от магического понижения скорости

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp