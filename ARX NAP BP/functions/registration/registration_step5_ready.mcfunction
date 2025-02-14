function registration/separation_line

# Подготавливаем игрока к первому погружению
    scoreboard players set @s spawn_location 1

    clear @s arx:registration_step5_ready
    tellraw @s { "rawtext": [ { "text": "Вы в игре! Используйте §aгид§f (зеленая книжка у вас в инвентаре), он всегда подскажет что делать!" } ] }
    function registration/set_all_scoreboards
    give @s arx:united_player_data 1 0 {"keep_on_death": {}}
    give @s arx:guide 1 0 {"keep_on_death": {}}
    give @s arx:pose_tuning 1 0 {"keep_on_death": {}}
    scoreboard players random @s UID 0 1000000000
    function runes/_autoreg
    function tp/1_spawn

tellraw @s { "rawtext": [ { "text": " " } ] }


# Выдем веши, соответствующие выбранному старту
    # __chose_hunter_start__
        give @s[tag=__chose_hunter_start__] minecraft:bow 1 300
        give @s[tag=__chose_hunter_start__] minecraft:arrow 10
        give @s[tag=__chose_hunter_start__] arx:mushroom_soup
        give @s[tag=__chose_hunter_start__] arx:stew
        give @s[tag=__chose_hunter_start__] arx:baked_apple
        give @s[tag=__chose_hunter_start__, scores={cusom_random=..499}] arx:ring_aluminum_cornelian 1 50
        give @s[tag=__chose_hunter_start__, scores={cusom_random=500..}] arx:ring_aluminum_cornelian 1 50
        give @s[tag=__chose_hunter_start__] arx:ring_aluminum_riolik 1 50
    
    # __chose_warrior_start__
        give @s[tag=__chose_warrior_start__, scores={cusom_random=0..99}] arx:aluminium_simple_sword 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=100..199}] arx:cast_iron_tooth 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=200..299}] arx:simple_iron_sword 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=300..399}] arx:simple_iron_dagger 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=400..499}] arx:fish_knife 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=500..599}] arx:plumbum_small_hammer 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=600..699}] arx:copper_sword_hook 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=700..799}] arx:cast_iron_longsword 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=800..899}] arx:simple_iron_longsword 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=900..999}] arx:plumbum_heighted_longsword 1 200

        give @s[tag=__chose_warrior_start__] arx:rounded_bottle_water_golden_hay_kavra 2

    # __chose_mage_start__
        give @s[tag=__chose_warrior_start__, scores={cusom_random=..249}] arx:staff_gold 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=250..499}] arx:staff_tin_with_gold 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=500..749}] arx:staff_wooden_with_chrysolite 1 200
        give @s[tag=__chose_warrior_start__, scores={cusom_random=750..}] arx:staff_wooden_with_riolik 1 200

        give @s[tag=__chose_warrior_start__] arx:wand_iron 1 100
        give @s[tag=__chose_warrior_start__] arx:book_mage_notes

        give @s[tag=__chose_warrior_start__] arx:rune_din_a 1 200
        give @s[tag=__chose_warrior_start__] arx:rune_san_a 1 200
        give @s[tag=__chose_warrior_start__] arx:rune_yanamo_a 1 200
        give @s[tag=__chose_warrior_start__] arx:rune_hijo_a 1 200
        give @s[tag=__chose_warrior_start__] arx:rune_laffaeti_a 1 200
        give @s[tag=__chose_warrior_start__] arx:rune_horo_a 1 200

tag @s remove __chose_hunter_start__
tag @s remove __chose_mage_start__
tag @s remove __chose_warrior_start__