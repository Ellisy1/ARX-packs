# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ АВТОМАТИЧЕСКИ КАЖДЫЕ 20 тактов (= 1 секунда)


# Вычисление доступности батарей 
    tag @a[hasitem={item=arx:battery_large}, scores={battery_avail=0}] add battery_avail
    tag @a[hasitem={item=arx:battery_small}, scores={battery_avail=0}] add battery_avail
    tag @a[hasitem={item=arx:battery_ultra}, scores={battery_avail=0}] add battery_avail
    tag @a[hasitem={item=arx:battery_homemade}, scores={battery_avail=0}] add battery_avail
    tellraw @a[tag=battery_avail] { "rawtext": [ { "text": "§aВы открыли особый навык: §bТеория аккумуляторов!" } ] }
    tellraw @a[tag=battery_avail] { "rawtext": [ { "text": "Доступны новые сведения в <§cОбщие данные о персонаже§f>!" } ] }
    tellraw @a[tag=battery_avail] { "rawtext": [ { "text": "Доступны новые иконки в <§1Помощь по иконкам§f>!" } ] }
    scoreboard players set @a[tag=battery_avail] battery_avail 1
    tag @a remove battery_avail

# ЗАПУСК ФУНКЦИИ БАТАРЕЙ
    execute as @a[scores={battery_avail=1}] at @s run function core_parts_NAP/battery_logic

# Ломаем лодки мобами
    execute at @e[family=boat_destroyer] run damage @e[family=boat, r=1] 1000

# Горим порочным пламенем
    scoreboard players set @a[hasitem={item=arx:amul_essence_of_vicious_demon, location=slot.armor.legs}] vicious_flame 0
    execute at @e[scores={vicious_flame=1..}] run particle arx:vicious_flame ~ ~1.2 ~
    title @a[scores={vicious_flame=1..}] title §aВы горите!
    execute at @e[scores={vicious_flame=1..}] run playsound vicious_flame @a ~ ~ ~ 
    damage @e[scores={vicious_flame=1..}] 1 suicide
    camera @a[scores={vicious_flame=1..}] fade time 0.5 0 0.5 color 0 150 0
    scoreboard players add @e[scores={vicious_flame=1..}] vicious_flame -1

# Звуки от Газгольдера Истрибитора
    execute as @e[type=arx:gasgolder_istribitor] at @s run playsound gasgolder_istribitor_saw @a ~ ~ ~ 

# Если я (админ) в выживании, отключаем показ координат
    execute if entity @a[scores={verify=2}, m=survival] run gamerule showcoordinates false

# Урон от заклинаний пассивного урона
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 2
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_a=!0}] 1
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_b=!0}] 0
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_c=!0}] 0
    execute at @e[scores={tick_sempra_dps=1..}, type=player] run particle arx:sempra_a ~ ~2 ~
    execute at @e[scores={tick_sempra_dps=1..}, type=!player] run particle arx:sempra_a ~ ~1 ~
    scoreboard players add @e[scores={tick_sempra_dps=1..}] tick_sempra_dps -1

# Заклинание метки
    execute at @a[scores={mark=1..}] run particle minecraft:endrod ~ ~1 ~ 
    scoreboard players add @a[scores={mark=1..}] mark -1

# Снятие тегов, которые выдаются блоками по радиусу
    # Запретители магии измененного движения
        # Контроль выпадающего такта
            tag @a remove disable_magic_of_modified_moving_control
            tag @a[tag=disable_magic_of_modified_moving_activate] add disable_magic_of_modified_moving_control

        tag @a remove disable_magic_of_modified_moving
        tag @a[tag=disable_magic_of_modified_moving_activate] add disable_magic_of_modified_moving
        tag @a[tag=disable_magic_of_modified_moving_control] add disable_magic_of_modified_moving

        tag @a remove disable_magic_of_modified_moving_activate
    
    # Нагреватели
        tag @a[tag=!heating_by_heater_block_control] remove heating_by_heater_block_activate
        tag @a remove heating_by_heater_block_control
        
# Анализ алых ночей
    tag @a remove scarlet_night
    execute as @a if entity @s[scores={is_day=0}] run event entity @a arx:test_moon_phase

# Одежда
    effect @a[tag=electrical_engineering_available, hasitem={item=arx:night_vision_device, location=slot.armor.head}] night_vision 12 0 true

# Маленькая голова (закл)
    scoreboard players add @a[scores={spell_of_small_head=1..}] spell_of_small_head -1 
    playanimation @a[scores={spell_of_small_head=1..}] animation.player.invisible_head

    # effect @a[hasitem={item=arx:amul_photoresonance, location=slot.armor.legs}, tag=high_bright] night_vision 11 0 true

    effect @a[hasitem={item=arx:amul_ruby, location=slot.armor.legs}, scores={freezing=!..-1001}] fire_resistance 1 0 true

# Обнаружение и автофикс некоторых ошибок
    execute as @a[tag=self] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§4Обнаружена ошибка у @s core>>tags>>self" } ] }
    tag @a remove self
    execute as @a[tag=staffself] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§4Обнаружена ошибка у @s core>>tags>>staffself" } ] }
    tag @a remove staffself
    execute as @a[tag=success] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§4Обнаружена ошибка у @s core>>tags>>success" } ] }
    tag @a remove success

# Обжигание об горячие предметы
    # Теги кузнечных клещей (tongs - обычные клещи, tongs_super - усиленные)
        # Левая рука
            tag @a[hasitem={item=arx:blacksmith_tongs, location=slot.weapon.offhand}] add tongs
            tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.offhand}] add tongs
            tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.offhand}] add tongs_super

        # Правая рука 
            tag @a[hasitem={item=arx:blacksmith_tongs, location=slot.weapon.mainhand}] add tongs
            tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.mainhand}] add tongs
            tag @a[hasitem={item=arx:blacksmith_tongs_super, location=slot.weapon.mainhand}] add tongs_super

    # Обжигаем
        function core_parts_NAP/damage_by_hot_item

    # Чистка
        tag @a remove tongs
        tag @a remove tongs_super

# Снятие масла при активных лампах
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:belt_lamp, location=slot.armor.legs}] lamp_oil -150
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:brightmouse, location=slot.armor.legs}] lamp_oil -67
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:magilight, location=slot.armor.legs}] lamp_oil -65
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:archilight, location=slot.armor.legs}] lamp_oil -43
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:firefly_belt_lamp, location=slot.armor.legs}] lamp_oil -30
    scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:mechanic_belt_lamp, location=slot.armor.legs}] lamp_oil -85

# Деспавним крыс днём
    execute if entity @a[scores={verify=2, is_day=1}] at @e[family=despawn_as_ghost] run particle arx:rat_ghost_despawn ~ ~1.5 ~
    execute if entity @a[scores={verify=2, is_day=1}] at @e[family=despawn_as_ghost] run particle arx:rat_ghost_despawn ~ ~1.5 ~
    execute if entity @a[scores={verify=2, is_day=1}] at @e[family=despawn_as_ghost] run particle arx:rat_ghost_despawn ~ ~1.5 ~

    execute if entity @a[scores={verify=2, is_day=1}] at @e[family=despawn_as_ghost] run playsound undemon @a ~ ~ ~

    execute if entity @a[scores={verify=2, is_day=1}] run event entity @e[family=despawn_as_ghost] arx:despawn_as_ghost

# Эффекты брони
    camera @a[hasitem={item=arx:blindness_bandage, location=slot.armor.head}] fade time 0 2 0 color 30 30 30 

# Анализ биомов
    tag @a remove BIOME_birch
    event entity @a arx:test_biome_birch
    tag @a remove BIOME_jungle
    event entity @a arx:test_biome_jungle
    tag @a remove BIOME_ocean
    event entity @a arx:test_biome_ocean
    event entity @a arx:test_biome_river
    tag @a remove BIOME_forest
    event entity @a arx:test_biome_forest
    event entity @a arx:test_biome_flower_forest
    tag @a remove BIOME_desert
    event entity @a arx:test_biome_desert
    tag @a remove BIOME_mesa
    event entity @a arx:test_biome_mesa
    tag @a remove BIOME_plains
    event entity @a arx:test_biome_plains
    tag @a remove BIOME_savanna
    event entity @a arx:test_biome_savanna
    tag @a remove BIOME_swamp
    event entity @a arx:test_biome_swamp
    tag @a remove BIOME_mangrove_swamp
    event entity @a arx:test_biome_mangrove_swamp
    tag @a remove BIOME_beach
    event entity @a arx:test_biome_beach
    tag @a remove BIOME_mountain
    event entity @a arx:test_biome_mountain
    tag @a remove BIOME_ice
    event entity @a arx:test_biome_ice
    event entity @a arx:test_biome_cold
    tag @a remove BIOME_roofed
    event entity @a arx:test_biome_roofed
    tag @a remove BIOME_taiga
    event entity @a arx:test_biome_taiga

    #Удаление лишних тегов
        tag @a[tag=BIOME_birch, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_roofed, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_taiga, tag=BIOME_forest] remove BIOME_forest
        tag @a[tag=BIOME_beach] add BIOME_ocean
        tag @a[tag=BIOME_ocean] remove BIOME_beach