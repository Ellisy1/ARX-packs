#Анализ доступности
    scoreboard players set @p mp_req 1

    tag @p[tag=self, tag=staff_sin] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=0}] ~ ~ ~ w @p У меня 0 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=1}] ~ ~ ~ w @p У меня 1 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=2}] ~ ~ ~ w @p У меня 2 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=3}] ~ ~ ~ w @p У меня 3 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=4}] ~ ~ ~ w @p У меня 4 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=5}] ~ ~ ~ w @p У меня 5 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=6}] ~ ~ ~ w @p У меня 6 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={bow_spell_a=1..}] ~ ~ ~ w @p На меня действует заклинание улучшение навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={bow_spell_b=1..}] ~ ~ ~ w @p На меня действует мощное заклинание улучшение навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={bow_spell_c=1..}] ~ ~ ~ w @p На меня действует заклинание ухудшения навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={bow_spell_d=1..}] ~ ~ ~ w @p На меня действует мощное заклинание ухудшения навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_a=1..}] ~ ~ ~ w @p На меня действует заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_b=1..}] ~ ~ ~ w @p На меня действует пассивное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_c=1..}] ~ ~ ~ w @p На меня действует усиленное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_d=1..}] ~ ~ ~ w @p На меня действует пассивное усиленное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_e=1..}] ~ ~ ~ w @p На меня действует мощное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={jump_speed_up_f=1..}] ~ ~ ~ w @p На меня действует очень мощное заклинание ускорения

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=0}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 0 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=1}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 1 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=2}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 2 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=3}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 3 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=4}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 4 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=5}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 5 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=6}] ~ ~ ~ w @p[tag=self] У @p[tag=self2] 6 ур. ловкости
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={bow_spell_a=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует заклинание улучшение навыка лучника 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={bow_spell_b=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует мощное заклинание улучшение навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={bow_spell_c=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует заклинание ухудшения навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={bow_spell_d=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует мощное заклинание ухудшения навыка лучника
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_a=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_b=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует пассивное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_c=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует усиленное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_d=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует пассивное усиленное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_e=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует мощное заклинание ускорения
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={jump_speed_up_f=1..}] ~ ~ ~ w @p[tag=self] На @p[tag=self2] действует очень мощное заклинание ускорения

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp