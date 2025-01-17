#Дебаг двух игроков на одной позиции (ИМЕЕТ СМЫСЛ, ПОКА ОСТАЛСЯ ПОЗ. КОД)
    scoreboard players set @a check_one_point 0
    execute @a ~ ~ ~ scoreboard players add @a[r=0.0001] check_one_point 1
    execute @a[scores={check_one_point=2..}] ~ ~ ~ function core_parts/debugtp

#Обнаружение мёртвых
    tag @a remove is_dead
    event entity @a arx:test_is_dead

#Просчёт тактов от лица хостера со счётом verify = 2
    execute @a[scores={verify=2}] ~ ~ ~ scoreboard players add @s tick 1
    execute @a[scores={verify=2, tick=21}] ~ ~ ~ scoreboard players set @s tick 1
    execute @a[tag=test, scores={tick=20}] ~ ~ ~ tellraw @s { "rawtext": [ { "score": {"name": "@s", "objective": "sec" } } ] }

#Просчёт секунд, минут и часов, базируясь на тактах
    execute @a[scores={verify=2, tick=20}] ~ ~ ~ scoreboard players add @s sec 1
    execute @a[scores={verify=2, tick=20, sec=61..}] ~ ~ ~ scoreboard players set @s sec 1

#Рандом
    scoreboard players random @a custom_random 0 1000
    scoreboard players random @a custom_random_b 0 1000
    scoreboard players random @a custom_random_c 0 1000

#Определение состояний игрока
    #Игрок один
        tag @a add alone
        execute @a ~ ~ ~ tag @a[r=20, rm=0.0001] remove alone 
    #День?
        scoreboard players set @a is_day 0
        event entity @a arx:test_is_day
    #В аду?
        tag @a remove in_nether
        event entity @a arx:test_in_nether

    #ОБНАРУЖЕНИЕ МЕСТОНАХОЖДЕНИЯ ПО ВЫСОТЕ
        tag @a remove in_hot_deep
        execute @a ~ ~ ~ tag @s[y=-60, dy=49, tag=!in_nether] add in_hot_deep

        tag @a remove in_safe_zone
        execute @a ~ ~ ~ tag @s[y=-10, dy=20, tag=!in_nether] add in_safe_zone

        tag @a remove in_mines
        execute @a ~ ~ ~ tag @s[y=11, dy=42, tag=!in_nether] add in_mines

        tag @a remove in_surface
        execute @a ~ ~ ~ tag @s[y=54, dy=65, tag=!in_nether] add in_surface

        tag @a remove in_sky
        execute @a ~ ~ ~ tag @s[y=120, dy=199, tag=!in_nether] add in_sky

        tag @a remove in_space
        execute @a ~ ~ ~ tag @s[y=320, dy=100000] add in_space

    #Уровень освещения
        tag @a remove low_bright
        event entity @a arx:test_brightness_low

        tag @a remove high_bright
        event entity @a arx:test_brightness_high

    #Уровень хп
        tag @a remove low_hp
        event entity @a arx:test_hp_low
        tag @a remove very_low_hp
        event entity @a arx:test_very_hp_low

    #Шифтится?
        tag @a remove is_sneaking
        event entity @a arx:test_sneaking


#Призрак - механики
    tag @a remove above_liquid_high
    tag @a remove above_liquid_low

    scoreboard players set @a[scores={class=1}] saturation 2

    execute @a[tag=in_water, tag=!in_rain, scores={class=1}] ~ ~ ~ tag @s add above_liquid_low

    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ water 0 tag @s add above_liquid_high
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ flowing_water 0 tag @s add above_liquid_high

    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ water 0 tag @s add above_liquid_low
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ flowing_water 0 tag @s add above_liquid_low
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-1 ~ water 0 tag @s add above_liquid_low
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-1 ~ flowing_water 0 tag @s add above_liquid_low

    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ lava 0 tag @s add above_liquid_high
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-2 ~ flowing_lava 0 tag @s add above_liquid_high

    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-1 ~ lava 0 tag @s add above_liquid_low
    execute @a[scores={class=1}] ~ ~ ~ detect ~ ~-1 ~ flowing_lava 0 tag @s add above_liquid_low

    effect @a[scores={class=1}, tag=above_liquid_high] slow_falling 2 0 true
    effect @a[scores={class=1}, tag=above_liquid_low] levitation 1 0 true
    #Ещё часть в 20ticks


#МАНА
    function core_parts_NAP/mana

#Телепортация мага
    execute @a[tag=!is_dead, scores={teleport_def=20}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_def=16}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_def=12}] ~ ~ ~ tp @p ~ ~ ~-10
    execute @a[tag=!is_dead, scores={teleport_def=8}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_def=4}] ~ ~ ~ tp @p ~-5 ~ ~

    execute @a[tag=!is_dead, scores={teleport_dmg=20}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_dmg=16}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_dmg=12}] ~ ~ ~ tp @p ~ ~ ~-10
    execute @a[tag=!is_dead, scores={teleport_dmg=8}] ~ ~ ~ tp @p ~5 ~ ~5
    execute @a[tag=!is_dead, scores={teleport_dmg=4}] ~ ~ ~ tp @p ~-5 ~ ~
    execute @a[tag=!is_dead, scores={teleport_dmg=20}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=16}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=12}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=8}] ~ ~ ~ damage @e[r=15] 4
    execute @a[tag=!is_dead, scores={teleport_dmg=4}] ~ ~ ~ damage @e[r=15] 4

    #Откат очков телепортации мага
        execute @a[tag=!is_dead, scores={teleport_def=1..}] ~ ~ ~ scoreboard players add @p teleport_def -1
        execute @a[tag=!is_dead, scores={teleport_dmg=1..}] ~ ~ ~ scoreboard players add @p teleport_dmg -1

#телепортация на маяк
    execute @a[scores={tp_backpoint=2}] ~ ~ ~ camera @s fade time 0 0 1 color 200 0 150
    execute @a[scores={tp_backpoint=2}] ~ ~ ~ tp @s @e[type=armor_stand, tag=tp_backpoint]
    execute @a[scores={tp_backpoint=1}] ~ ~ ~ playsound pallada_beacon @a ~ ~ ~
    execute @a[scores={tp_backpoint=1}] ~ ~ ~ kill @e[type=armor_stand, tag=tp_backpoint, r = 0.1]
    execute @a[scores={tp_backpoint=1..}] ~ ~ ~ scoreboard players add @s tp_backpoint -1

#Устойчивость лука
    scoreboard players set @a[scores={speed_skill=0}] bow_result 0
    scoreboard players set @a[scores={speed_skill=2..3}] bow_result 1
    scoreboard players set @a[scores={speed_skill=4..5}] bow_result 2
    scoreboard players set @a[scores={speed_skill=6}] bow_result 3
    execute @a[hasitem={item=arx:ring_lamenite_diamond, location=slot.armor.feet}] ~ ~ ~ scoreboard players add @p bow_result 1
    scoreboard players add @a[scores={bow_spell_a=1..}] bow_result 1
    scoreboard players add @a[scores={bow_spell_b=1..}] bow_result 2
    scoreboard players add @a[scores={bow_spell_c=1..}] bow_result -1
    scoreboard players add @a[scores={bow_spell_d=1..}] bow_result -2

    #Проброс отсчёта времени
        execute @a[hasitem={item=minecraft:bow, location=slot.weapon.mainhand}, scores={bow_tick=21..}] ~ ~ ~ scoreboard players set @p bow_tick 1
        execute @a[hasitem={item=minecraft:crossbow, location=slot.weapon.mainhand}, scores={bow_tick=21..}] ~ ~ ~ scoreboard players set @p bow_tick 1
        execute @a[hasitem={item=minecraft:trident, location=slot.weapon.mainhand}, scores={bow_tick=21..}] ~ ~ ~ scoreboard players set @p bow_tick 1
        execute @a[tag=!is_dead] ~ ~ ~ scoreboard players add @p bow_tick 1

    #Исполнение
        execute @a[m=!spectator, hasitem={item=minecraft:bow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=..0}] ~ ~ ~ camerashake add @s 3 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:bow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=1}] ~ ~ ~ camerashake add @s 0.8 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:bow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=2}] ~ ~ ~ camerashake add @s 0.2 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:crossbow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=..0}] ~ ~ ~ camerashake add @s 3 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:crossbow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=1}] ~ ~ ~ camerashake add @s 0.8 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:crossbow, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=2}] ~ ~ ~ camerashake add @s 0.2 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:trident, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=..0}] ~ ~ ~ camerashake add @s 3 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:trident, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=1}] ~ ~ ~ camerashake add @s 0.8 1.00 rotational
        execute @a[m=!spectator, hasitem={item=minecraft:trident, location=slot.weapon.mainhand}, scores={bow_tick=2, bow_result=2}] ~ ~ ~ camerashake add @s 0.2 1.00 rotational


#ДЕЙСТВИЕ АМУЛЕТОВ
    execute @a[hasitem={item=arx:amul_antighost, location=slot.armor.legs}] ~ ~ ~ scoreboard players add @a[scores={class=1}, r=10] stress 15
    execute @a[hasitem={item=arx:amul_antighost, location=slot.armor.legs}] ~ ~ ~ title @a[scores={class=1}, r=10] actionbar §4Вас накрывает ужас

    effect @a[tag=high_bright, hasitem={item=arx:amul_photoresonance, location=slot.armor.legs}] night_vision 11 0 true

    effect @a[hasitem={item=arx:amul_ruby, location=slot.armor.legs}, scores={freezing=!..-1001}] fire_resistance 1 0 true


#Движок боёвки
    title @a[scores={attack_weakness=1, blocking = 0}] actionbar Ĥ 0
    title @a[scores={attack_weakness=2..20, blocking = 0}] actionbar Ĥ 1
    title @a[scores={attack_weakness=21..40, blocking = 0}] actionbar Ĥ 2
    title @a[scores={attack_weakness=41..60, blocking = 0}] actionbar Ĥ 3
    title @a[scores={attack_weakness=61..80, blocking = 0}] actionbar Ĥ 4
    title @a[scores={attack_weakness=81..100, blocking = 0}] actionbar Ĥ 5
    title @a[scores={attack_weakness=101..120, blocking = 0}] actionbar Ĥ 6
    title @a[scores={attack_weakness=121..140, blocking = 0}] actionbar Ĥ 7
    title @a[scores={attack_weakness=141..160, blocking = 0}] actionbar Ĥ 8
    title @a[scores={attack_weakness=161..180, blocking = 0}] actionbar Ĥ 9
    title @a[scores={attack_weakness=181.., blocking = 0}] actionbar Ĥ MAX

    title @a[scores={attack_weakness=1, blocking = 1..}] actionbar ĥ Ĥ 0
    title @a[scores={attack_weakness=2..20, blocking = 1..}] actionbar ĥ Ĥ 1
    title @a[scores={attack_weakness=21..40, blocking = 1..}] actionbar ĥ Ĥ 2
    title @a[scores={attack_weakness=41..60, blocking = 1..}] actionbar ĥ Ĥ 3
    title @a[scores={attack_weakness=61..80, blocking = 1..}] actionbar ĥ Ĥ 4
    title @a[scores={attack_weakness=81..100, blocking = 1..}] actionbar ĥ Ĥ 5
    title @a[scores={attack_weakness=101..120, blocking = 1..}] actionbar ĥ Ĥ 6
    title @a[scores={attack_weakness=121..140, blocking = 1..}] actionbar ĥ Ĥ 7
    title @a[scores={attack_weakness=141..160, blocking = 1..}] actionbar ĥ Ĥ 8
    title @a[scores={attack_weakness=161..180, blocking = 1..}] actionbar ĥ Ĥ 9
    title @a[scores={attack_weakness=181.., blocking = 1..}] actionbar ĥ Ĥ MAX

    scoreboard players add @a[scores={attack_weakness=1..}] attack_weakness -1
    scoreboard players add @a[scores={attack_weakness=4.., sk_d_3=1, tick=1}] attack_weakness -3
    scoreboard players add @a[scores={blocking=1..}] blocking -1
    scoreboard players add @a[scores={allow_block_buff=1..}] allow_block_buff -1

#ОБНАРУЖЕНИЕ БЕЗДЕЙСТВИЯ
    tag @a remove is_moving
    event entity @a arx:test_standing 

#Вычитание очков удара
    scoreboard players add @a[scores={on_hurt_delay=1..}] on_hurt_delay -1

#Комментарии при взятии предметов
    title @a[m=!spectator, rx=-70, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↓ §cОбщие данные о персонаже
    title @a[m=!spectator, rx=-50, rxm=-70, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §6Навыки
    title @a[m=!spectator, rx=-30, rxm=-50, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §eЧерты характера
    title @a[m=!spectator, rx=-10, rxm=-30, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §aВкусы
    title @a[m=!spectator, rx=10, rxm=-10, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §bПолные характеристики
    title @a[m=!spectator, rx=30, rxm=10, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §1Помощь по иконкам
    title @a[m=!spectator, rx=50, rxm=30, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §dСтатистика
    title @a[m=!spectator, rx=70, rxm=50, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑↓ §cДостижения
    title @a[m=!spectator, rxm=70, hasitem={item=arx:united_player_data, location=slot.weapon.mainhand}] actionbar ↑ §6Авторы и разработчики

#Снятие особых фич брони
    scoreboard players add @a[scores={armor_assas_dmg=1..}] armor_assas_dmg -1
    scoreboard players add @a[scores={armor_conq_dmg=1..}] armor_conq_dmg -1
    scoreboard players add @a[scores={armor_ranger_dmg=1..}] armor_ranger_dmg -1

#Обнаружение ошибок
    execute @a[tag=self] ~ ~ ~ w @a[scores={verify=2}] §4Обнаружена ошибка у @p core>>tags>>self
    tag @a remove self
    execute @a[tag=staffself] ~ ~ ~ w @a[scores={verify=2}] §4Обнаружена ошибка у @p core>>tags>>staffself
    tag @a remove staffself
    execute @a[tag=success] ~ ~ ~ w @a[scores={verify=2}] §4Обнаружена ошибка у @p core>>tags>>success 
    tag @a remove success
    tp @e[type=pillager] -10000 -100 -10000
    tp @e[type=villager] -10000 -100 -10000
    tp @e[type=wandering_trader] -10000 -100 -10000
    tp @e[type=zombie] -10000 -100 -10000
    tp @e[type=skeleton] -10000 -100 -10000
    tp @e[type=skeleton_horse] -10000 -100 -10000
    tp @e[type=zombie_villager] -10000 -100 -10000
    tp @e[type=spider] -10000 -100 -10000

#Комната попущения
    spawnpoint @a 10000 -36 10000

    tag @a remove at_respawn_room
    tag @e[x=9990, y=-43, z=9990, dx=20, dy=20, dz=20] add at_respawn_room
    tp @e[tag=at_respawn_room, type=!armor_stand, type=!player, type=!arx:adona_spawn, type=!arx:rat_monstr_spawn] -10000 -100 -10000

#Определение взгляда вниз
    scoreboard players add @a[rxm=89, tag=is_sneaking] dtct_look_down 1
    scoreboard players set @a[rx=89] dtct_look_down 0
    scoreboard players set @a[tag=!is_sneaking] dtct_look_down 0
    execute @a[scores={dtct_look_down=1}] ~ ~ ~ function core_parts/inspect_item

# Партиклы
    execute @a ~ ~ ~ execute @s[m=!spectator, tag=BIOME_forest, y=55, dy=200, scores={custom_random=0..600}] ~ ~ ~ particle arx:forest_ambient_leaf
    execute @a ~ ~ ~ execute @s[m=!spectator, tag=BIOME_jungle, y=55, dy=200, scores={custom_random=0..600}] ~ ~ ~ particle arx:forest_ambient_leaf
    execute @a ~ ~ ~ execute @s[m=!spectator, tag=BIOME_desert, y=30, dy=200, scores={custom_random=0..600}] ~ ~ ~ particle arx:ambient_desert_sand

# Медленное падение в храме черепа
    effect @a[x=-191, y=48, z=336, dy=5] slow_falling 1 0 true


#Вызов функции 20ticks
    execute @a[scores={verify=2, tick=20}] ~ ~ ~ function core_parts/20ticks

#Вызов функции 10ticks
    execute @a[scores={verify=2, tick=1}] ~ ~ ~ function core_parts_NAP/10ticks
    execute @a[scores={verify=2, tick=11}] ~ ~ ~ function core_parts_NAP/10ticks

#Вызов функции 5ticks
    execute @a[scores={verify=2, tick=1}] ~ ~ ~ function core_parts/5ticks
    execute @a[scores={verify=2, tick=6}] ~ ~ ~ function core_parts/5ticks
    execute @a[scores={verify=2, tick=11}] ~ ~ ~ function core_parts/5ticks
    execute @a[scores={verify=2, tick=16}] ~ ~ ~ function core_parts/5ticks

# Вызов функции 2ticks
    execute @a[scores={verify=2, tick=1}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=3}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=5}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=7}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=9}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=11}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=13}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=15}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=17}] ~ ~ ~ function core_parts_NAP/2ticks
    execute @a[scores={verify=2, tick=19}] ~ ~ ~ function core_parts_NAP/2ticks