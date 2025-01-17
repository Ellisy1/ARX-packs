#Анализ доступности
    scoreboard players set @p mp_req 20

    tag @p[tag=self, tag=staff_san] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={regen_saki_a=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={regen_saki_b=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={regen_saki_c=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={water_block_saki=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p[tag=self, scores={sin_host_saki=1..}] mp_delay 1 
                
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p resist_up_a 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p resist_up_b 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p resist_up_c 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p resist_up_d 0 
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p mark 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p regen_saki_a 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p regen_saki_b 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p regen_saki_c 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p water_block_saki 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p water_block 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p sin_host_block 0
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @p sin_host_saki 0
                
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={regen_saki_a=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={regen_saki_b=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={regen_saki_c=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={water_block_saki=1..}] mp_delay 1 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2, scores={sin_host_saki=1..}] mp_delay 1 
                
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] resist_up_a 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] resist_up_b 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] resist_up_c 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] resist_up_d 0 
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] mark 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] regen_saki_a 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] regen_saki_b 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] regen_saki_c 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] water_block_saki 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] water_block 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] sin_host_block 0
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ scoreboard players set @p[tag=self2] sin_host_saki 0
                
    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target
                
    function spells/operations/withdraw_mp