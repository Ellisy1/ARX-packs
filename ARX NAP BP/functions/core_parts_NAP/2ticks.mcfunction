# Эта функция вызывается раз в 2 такта (1/10 сек) и использует синтаксис NAP
effect @a[hasitem={item=arx:lamenite_plate_armor, location=slot.armor.chest}, tag=low_hp, scores={freezing=!..-1001}] fire_resistance 2 0 true

# Сообщения при держании посохов
    # Чистка тегов с предыдущей итерации
        tag @a remove holds_staff_sexto
        tag @a remove holds_staff_quintu
        tag @a remove holds_staff_quadro
        tag @a remove holds_staff_trio
        tag @a remove holds_staff_duo
        tag @a remove holds_staff_mono

    # Определяем что мы держим   tag @a[hasitem={item=arx:sample, location=slot.weapon.mainhand}] add holds_staff_channel_id
        # sexto
            tag @a[hasitem={item=arx:staff_san, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_din, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_sin, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_kon, location=slot.weapon.mainhand}] add holds_staff_sexto
            tag @a[hasitem={item=arx:staff_dragon, location=slot.weapon.mainhand}] add holds_staff_sexto

        # quintu
            tag @a[hasitem={item=arx:staff_battle, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_battle_custom_magik, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_fulminant, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_caryite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_chloronite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dark_netherite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dorionite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_dorionite_with_caryite, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_netherite_with_ruby, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_snowlands, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_twilight, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:vicious_staff_refined, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_hell, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_shaman, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_angel, location=slot.weapon.mainhand}] add holds_staff_quintu
            tag @a[hasitem={item=arx:staff_of_heaven, location=slot.weapon.mainhand}] add holds_staff_quintu

        # quadro
            tag @a[hasitem={item=arx:staff_naginitis, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:vicious_staff, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:staff_with_skull, location=slot.weapon.mainhand}] add holds_staff_quadro
            tag @a[hasitem={item=arx:staff_golden_cross, location=slot.weapon.mainhand}] add holds_staff_quadro

        # trio
            tag @a[hasitem={item=arx:staff_cast_iron_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_golden_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_golden_with_sapphire, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_of_forest, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_of_phoenix, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_precious, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_with_ruby, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_steel_with_topaz, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_with_beryl, location=slot.weapon.mainhand}] add holds_staff_trio
            tag @a[hasitem={item=arx:staff_simple_with_ruby, location=slot.weapon.mainhand}] add holds_staff_trio
            
        # duo
            tag @a[hasitem={item=arx:staff_gold, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_tin_with_gold, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_wooden_with_chrysolite, location=slot.weapon.mainhand}] add holds_staff_duo
            tag @a[hasitem={item=arx:staff_wooden_with_olivine, location=slot.weapon.mainhand}] add holds_staff_duo

        # mono
            tag @a[hasitem={item=arx:staff_wooden, location=slot.weapon.mainhand}] add holds_staff_mono
            tag @a[hasitem={item=arx:staff_golden_with_violet_handle, location=slot.weapon.mainhand}] add holds_staff_mono
            tag @a[hasitem={item=arx:staff_of_scarlet_moon, location=slot.weapon.mainhand}] add holds_staff_mono

    # Вывод о канале и цели
        execute if entity @a[tag=holds_staff_sexto] run function core_parts_NAP/display_staff_channels/sexto
        execute if entity @a[tag=holds_staff_quintu] run function core_parts_NAP/display_staff_channels/quintu
        execute if entity @a[tag=holds_staff_quadro] run function core_parts_NAP/display_staff_channels/quadro
        execute if entity @a[tag=holds_staff_trio] run function core_parts_NAP/display_staff_channels/trio
        execute if entity @a[tag=holds_staff_duo] run function core_parts_NAP/display_staff_channels/duo
        execute if entity @a[tag=holds_staff_mono] run function core_parts_NAP/display_staff_channels/mono

# Партиклы от блуждающих огоньков
    execute at @e[type=arx:wandering_flame_of_tsaskhin] run particle arx:wandering_flame_of_tsaskhin ~ ~ ~
    execute unless entity @a[tag=scarlet_night] at @e[type=arx:wandering_flame_of_night] run particle arx:wandering_flame_of_night ~ ~ ~
    execute at @e[type=arx:wandering_flame_of_mines] run particle arx:wandering_flame_of_mines ~ ~ ~

# Анализ держания рун
    function core_parts_NAP/rune_titles
    
    title @a[tag=holds_rune, m=!spectator, rx=-60] actionbar §bI Канал
    title @a[tag=holds_rune, m=!spectator, rxm=-60, rx=-30] actionbar §bII Канал
    title @a[tag=holds_rune, m=!spectator, rxm=-30, rx=0] actionbar §bIII Канал
    title @a[tag=holds_rune, m=!spectator, rxm=0.001, rx=30] actionbar §bIV Канал
    title @a[tag=holds_rune, m=!spectator, rxm=30, rx=60] actionbar §bV Канал
    title @a[tag=holds_rune, m=!spectator, rxm=60] actionbar §bVI Канал

# Титлы универсального ключа
    execute if entity @a[m=!spectator, hasitem={item=arx:universal_radio_key, location=slot.weapon.mainhand}, tag=!urk_remote_controller_mode] run function core_parts_NAP/display_universal_radio_key

# Снятие тега is_emoting_via_arx_command
    tag @a[tag=is_moving] remove is_emoting_via_arx_command