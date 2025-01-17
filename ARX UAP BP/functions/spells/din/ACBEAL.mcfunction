#Анализ доступности
    scoreboard players set @p mp_req 30

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=15}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1..}] speed_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1..}] strength_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1..}] magic_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1..}] might_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1..}] trailblazer_skill 0 

    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=1..2}] skill_point 1 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=3..4}] skill_point 2 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=5..6}] skill_point 3 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=7..8}] skill_point 4 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=9}] skill_point 5 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., xp_stage=10..}] skill_point 6 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., custom_random=0..166, ill_cancer=!1..}] ill_cancer 200000 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., custom_random=167..333, ill_pneumonia=!1..}] ill_pneumonia 19200 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., custom_random=334..500, ill_broken_leg=!1..}] ill_broken_leg 72000 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., custom_random=501..666, ill_broken_arm=!1..}] ill_broken_arm 72000 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={mark=1.., custom_random=667..833, ill_appendicitis=!1..}] ill_appendicitis 20000 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={mark=!1..}] ~ ~ ~ w @p кажется, чего-то не хватает для заклинания 




    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1..}] speed_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1..}] strength_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1..}] magic_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1..}] might_skill 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1..}] trailblazer_skill 0 

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=1..2}] skill_point 1 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=3..4}] skill_point 2 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=5..6}] skill_point 3 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=7..8}] skill_point 4 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=9}] skill_point 5 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., xp_stage=10..}] skill_point 6 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., custom_random=0..166, ill_cancer=!1..}] ill_cancer 200000 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., custom_random=167..333, ill_pneumonia=!1..}] ill_pneumonia 19200 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., custom_random=334..500, ill_broken_leg=!1..}] ill_broken_leg 72000 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., custom_random=501..666, ill_broken_arm=!1..}] ill_broken_arm 72000 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={mark=1.., custom_random=667..833, ill_appendicitis=!1..}] ill_appendicitis 20000 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={mark=!1..}] ~ ~ ~ w @p[tag=self] кажется, чего-то не хватает для заклинания 

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp