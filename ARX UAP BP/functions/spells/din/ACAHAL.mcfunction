#Анализ доступности
    scoreboard players set @p mp_req 1

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=0}] ~ ~ ~ w @p Магия не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=1}] ~ ~ ~ w @p Магия повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=2}] ~ ~ ~ w @p Магия повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=3}] ~ ~ ~ w @p Магия повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=4}] ~ ~ ~ w @p Магия повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=5}] ~ ~ ~ w @p Магия повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=6}] ~ ~ ~ w @p Магия повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=7..}] ~ ~ ~ w @p Магия повышена до 7 или более уровня.

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=0}] ~ ~ ~ w @p[tag=self] Магия @p не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=1}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=2}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=3}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=4}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=5}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=6}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=7..}] ~ ~ ~ w @p[tag=self] Магия @p повышена до 7 или более уровня.

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target
    
    function spells/operations/withdraw_mp