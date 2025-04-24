#Анализ доступности
    scoreboard players set @p mp_req 15

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @s[hasitem={item=arx:amul_magic_zoisite, location=slot.armor.legs}] add drop_cost_with_amulet

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=0}] ~ ~ ~ w @p §1Мана§f не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=1}] ~ ~ ~ w @p §1Мана§f повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=2}] ~ ~ ~ w @p §1Мана§f повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=3}] ~ ~ ~ w @p §1Мана§f повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=4}] ~ ~ ~ w @p §1Мана§f повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=5}] ~ ~ ~ w @p §1Мана§f повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=6}] ~ ~ ~ w @p §1Мана§f повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={magic_skill=7..}] ~ ~ ~ w @p §1Мана§f повышена до 7 или более уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=0}] ~ ~ ~ w @p §aЛовкость§f не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=1}] ~ ~ ~ w @p §aЛовкость§f повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=2}] ~ ~ ~ w @p §aЛовкость§f повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=3}] ~ ~ ~ w @p §aЛовкость§f повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=4}] ~ ~ ~ w @p §aЛовкость§f повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=5}] ~ ~ ~ w @p §aЛовкость§f повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=6}] ~ ~ ~ w @p §aЛовкость§f повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={speed_skill=7..}] ~ ~ ~ w @p §aЛовкость§f повышена до 7 или более уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=0}] ~ ~ ~ w @p §cСила§f не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=1}] ~ ~ ~ w @p §cСила§f повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=2}] ~ ~ ~ w @p §cСила§f повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=3}] ~ ~ ~ w @p §cСила§f повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=4}] ~ ~ ~ w @p §cСила§f повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=5}] ~ ~ ~ w @p §cСила§f повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=6}] ~ ~ ~ w @p §cСила§f повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @p[tag=self, scores={strength_skill=7..}] ~ ~ ~ w @p §cСила§f повышена до 7 или более уровня.

    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=0}] ~ ~ ~ w @p[tag=self] §1Мана§f @s не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=1}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=2}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=3}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=4}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=5}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=6}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={magic_skill=7..}] ~ ~ ~ w @p[tag=self] §1Мана§f @s повышена до 7 или более уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=0}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=1}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=2}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=3}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=4}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=5}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=6}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={speed_skill=7..}] ~ ~ ~ w @p[tag=self] §aЛовкость§f @s повышена до 7 или более уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=0}] ~ ~ ~ w @p[tag=self] §cСила§f @s не повышена.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=1}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 1 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=2}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 2 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=3}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 3 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=4}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 4 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=5}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 5 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=6}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 6 уровня.
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ execute @p[tag=self2, scores={strength_skill=7..}] ~ ~ ~ w @p[tag=self] §cСила§f @s повышена до 7 или более уровня.

    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp
