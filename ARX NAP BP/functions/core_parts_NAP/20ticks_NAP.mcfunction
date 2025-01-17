# ЭТА ФУНКЦИЯ ЗАПУСКАЕТСЯ АВТОМАТИЧЕСКИ КАЖДЫЕ 20 тактов (= 1 секунда)


#Проброс значений (авторегистрация значений переменных)
    function core_parts_NAP/autoreg
    
#Вычисление доступности батарей 
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

# Запуск функции анализа сна
    function core_parts_NAP/sleeping_core

# ВОЗДЕЙСТВИЕ ЧЕРТ
    #Манипулятор
        execute at @a[scores={c_manipulator=1.., custom_random=0..50}, m=!spectator] as @a[r=8, m=!spectator] run scoreboard players add @s stress 100
        execute at @a[scores={c_manipulator=1.., custom_random=0..50}, m=!spectator] as @a[r=8, m=!spectator] run scoreboard players add @p[scores={c_manipulator=1..}] stress -100

    #Харизматик
        execute at @a[scores={c_charismatic=1.., custom_random=0..25}, m=!spectator] run scoreboard players add @a[r=8, rm=0.1, m=!spectator] stress -100

    #Общительный
        scoreboard players add @a[tag=alone, scores={c_communicative=1..}, m=!spectator] stress 2
        title @a[tag=alone, scores={c_communicative=1..}, m=!spectator] actionbar Вам грустно одному
        scoreboard players add @a[tag=!alone, scores={c_communicative=1..}, m=!spectator] stress -2

    #Импульсивный параноик
        execute at @a[scores={c_impulsive_par=1.., custom_random=1..10}, m=!spectator] run damage @a[r=4, rm=0.1] 2 entity_attack
        execute as @a[scores={c_impulsive_par=1.., custom_random=1..10}, m=!spectator] run camerashake add @s 1 2 rotational
        execute as @a[scores={c_impulsive_par=1.., custom_random=1..10}, m=!spectator] run tellraw @s { "rawtext": [ { "text": "§cВы непроизвольно пытаетесь ударить всё вокруг!" } ] } 
        execute at @a[scores={c_impulsive_par=1.., custom_random=1..10, gender=1}, m=!spectator] run tellraw @a[r=4, rm=0.1] { "rawtext": [{ "selector": "@p[scores={c_impulsive_par=1..}]" }, { "text": "§c просто так меня ударил!" } ] } 
        execute at @a[scores={c_impulsive_par=1.., custom_random=1..10, gender=2}, m=!spectator] run tellraw @a[r=4, rm=0.1] { "rawtext": [{ "selector": "@p[scores={c_impulsive_par=1..}]" }, { "text": "§c просто так меня ударила!" } ] } 

    #Параноик-мазохист
        damage @a[scores={c_paranoid_mas=1.., custom_random=50..51}, m=!spectator] 1 entity_attack
        tellraw @a[scores={c_paranoid_mas=1.., custom_random=50..51}, m=!spectator] { "rawtext": [ { "text": "§cВы наносите себе удар" } ] } 

    #Аквафоб
        scoreboard players add @a[scores={c_aquaphobe=1.., water_delay=1..}, m=!spectator] stress 12
        title @a[scores={c_aquaphobe=1.., water_delay=1..}, m=!spectator] actionbar Вы боитесь промокать!

#Ломаем лодки мобами
    execute at @e[family=boat_destroyer] run damage @e[family=boat, r=1] 1000

#Горим порочным пламенем
    scoreboard players set @a[hasitem={item=arx:amul_essence_of_vicious_demon, location=slot.armor.legs}] vicious_flame 0
    execute at @e[scores={vicious_flame=1..}] run particle arx:vicious_flame ~ ~1.2 ~
    title @a[scores={vicious_flame=1..}] title §aВы горите!
    execute at @e[scores={vicious_flame=1..}] run playsound vicious_flame @a ~ ~ ~ 
    damage @e[scores={vicious_flame=1..}] 1 suicide
    camera @a[scores={vicious_flame=1..}] fade time 0.5 0 0.5 color 0 150 0
    scoreboard players add @e[scores={vicious_flame=1..}] vicious_flame -1

# Секвенция появления порочного демона. Она базирована на score vicious_demon
    execute as @a[scores={verify=2, vicious_demon=1}] run w @a[scores={verify=2}] Бой с порочным демоном начат
    execute as @a[scores={verify=2, vicious_demon=1}] run particle arx:vicious_demon_spawn_flame_inward -191 34 336
    execute as @a[scores={verify=2, vicious_demon=4}] run particle arx:vicious_demon_spawn_flame_outward -191 34 336
    execute as @a[scores={verify=2, vicious_demon=4}] run summon arx:vicious_demon -191 34 336 facing -181 35 336
    execute as @a[scores={verify=2, vicious_demon=4}] run event entity @e[type=arx:vicious_demon] start_rush
    execute if entity @a[scores={verify=2, vicious_demon=4}] as @a[x=-204, y=33, z=324, dx=25, dy=5, dz=25] at @s run playsound mob.rat_eliminator.spawn @s  
    execute as @a[scores={verify=2, vicious_demon=1..}] run scoreboard players add @s vicious_demon 1


# Партиклы и звуки порталов
    particle arx:portal_fog 249 65 287
    playsound portal.passive @a 249 64 287

    particle arx:portal_fog -993 74 4219
    playsound portal.passive @a -993 74 4219

    execute unless entity @e[type=arx:vicious_demon] run particle arx:portal_fog_down -186 40 341
    execute unless entity @e[type=arx:vicious_demon] run playsound portal.passive @a -186 40 341

    particle arx:portal_fog -213 34 336
    playsound portal.passive @a -213 34 336

    particle arx:portal_fog_down -213 43 336
    playsound portal.passive @a -213 43 336

    particle arx:portal_fog -213 40 354
    playsound portal.passive @a -213 40 354

    particle arx:portal_fog -20 -42 -303
    playsound portal.passive @a -20 -42 -303

    particle arx:portal_fog 22.0 9 -83.0
    playsound portal.passive @a 22.0 9 -83.0 0.2


# Статуя дварфа
    particle arx:dwarf_statue -213 40.5 346
    camera @a[scores={dwarf_cam_cd=1}] clear
    scoreboard players add @a[scores={dwarf_cam_cd=1..}] dwarf_cam_cd -1



#Насыщение
    #Даем титл если снова можно поесть
        tellraw @a[scores={saturation=1, gender=1, c_rude=0}] { "rawtext": [ { "text": "§aЯ был бы не против перекусить" } ] }
        tellraw @a[scores={saturation=1, gender=2, c_rude=0}] { "rawtext": [ { "text": "§aЯ была бы не против перекусить" } ] }
        tellraw @a[scores={saturation=1, c_rude=1.., custom_random=0..333}] { "rawtext": [ { "text": "§aЕбать, сейчас бы пожрать чё-нить" } ] }
        tellraw @a[scores={saturation=1, c_rude=1.., custom_random=334..666}] { "rawtext": [ { "text": "§aБляяя, жрать хочу" } ] }
        tellraw @a[scores={saturation=1, c_rude=1.., custom_random=667..1000}] { "rawtext": [ { "text": "§aСука, сожрал бы коня блядь" } ] }
    #Снимаем поинт
        scoreboard players add @a[scores={saturation=1..}] saturation -1
    #Выдаем насыщение
        effect @a[scores={saturation=1..}] saturation 1 0 true

# Счётчик пройденной дистации
    # ! При final_speed=..-7 игрок не двигается
    scoreboard players add @a[tag=is_moving, scores={final_speed=-6}, m=!spectator] count_dist_x100 52
    scoreboard players add @a[tag=is_moving, scores={final_speed=-5}, m=!spectator] count_dist_x100 128
    scoreboard players add @a[tag=is_moving, scores={final_speed=-4}, m=!spectator] count_dist_x100 208
    scoreboard players add @a[tag=is_moving, scores={final_speed=-3}, m=!spectator] count_dist_x100 287
    scoreboard players add @a[tag=is_moving, scores={final_speed=-2}, m=!spectator] count_dist_x100 362
    scoreboard players add @a[tag=is_moving, scores={final_speed=-1}, m=!spectator] count_dist_x100 438
    scoreboard players add @a[tag=is_moving, scores={final_speed=0}, m=!spectator] count_dist_x100 515
    scoreboard players add @a[tag=is_moving, scores={final_speed=1}, m=!spectator] count_dist_x100 622
    scoreboard players add @a[tag=is_moving, scores={final_speed=2}, m=!spectator] count_dist_x100 727
    scoreboard players add @a[tag=is_moving, scores={final_speed=3}, m=!spectator] count_dist_x100 826
    scoreboard players add @a[tag=is_moving, scores={final_speed=4}, m=!spectator] count_dist_x100 932
    scoreboard players add @a[tag=is_moving, scores={final_speed=5}, m=!spectator] count_dist_x100 1030
    scoreboard players add @a[tag=is_moving, scores={final_speed=6}, m=!spectator] count_dist_x100 1138 
    scoreboard players add @a[tag=is_moving, scores={final_speed=7..}, m=!spectator] count_dist_x100 1245

    execute as @a run scoreboard players operation @s count_distance = @s count_dist_x100
    execute as @a run scoreboard players operation @s count_distance /= @a[scores={verify=2}] const_100

# Обнаружение перезахода
    # Выставляем журнальную переменную online_log
        execute as @a run scoreboard players operation @s online_log = @s online
    
    # Анализ перезахода
        scoreboard players random @a[scores={verify=2}] online 0 1000000
        scoreboard players operation @a[scores={verify=!2}] online = @a[scores={verify=2}] online
        scoreboard players operation @a[scores={verify=!2}] online_log -= @a[scores={verify=2}] online_log

    # Вывод
        execute as @a run tellraw @s[scores={online_log=!0, verify=!2, religion=0}] { "rawtext": [{ "text": "Добро пожаловать в Аркс, §a"}, { "selector": "@s" }, { "text": "§f!" } ] }
        execute as @a run tellraw @s[scores={online_log=!0, verify=!2, religion=1..9}] { "rawtext": [{ "text": "Добро пожаловать в Аркс, §c"}, { "selector": "@s" }, { "text": "§f!" } ] }
        execute as @a run tellraw @s[scores={online_log=!0, verify=!2, religion=11..19}] { "rawtext": [{ "text": "Добро пожаловать в Аркс, §e"}, { "selector": "@s" }, { "text": "§f!" } ] }
        execute as @a run tellraw @s[scores={online_log=!0, verify=!2, religion=21..22}] { "rawtext": [{ "text": "Добро пожаловать в Аркс, §d"}, { "selector": "@s" }, { "text": "§f!" } ] }

    # Запуск музыки
        scoreboard players set @a[scores={online_log=!0, verify=!2}] music_delay 0

# Чистим у игроков не на респе часы
    clear @a[tag=!at_respawn_room] arx:respawn_time_checker

# Музыка
    function core_parts_NAP/music_core

# Звуки от Газгольдера Истрибитора
    execute as @e[type=arx:gasgolder_istribitor] at @s run playsound gasgolder_istribitor_saw @a ~ ~ ~ 

# Снижение переменной свитка хила
    scoreboard players add @a[scores={heal_scrl_durt=1..}] heal_scrl_durt -1

# Анализ лапмового масла lamp_oil
    # Полная лампа = 100'000
    # Экономия масла = (50 / потреб. в сек.) * 100%
    # Яркость = макс. ур. светимости / 15 * 100%
    # Установка макс. уровня светимости (5..15), 0 - контрольное значение
        scoreboard players set @a max_light_range 0

        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:belt_lamp, location=slot.armor.legs}] max_light_range 10
        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:brightmouse, location=slot.armor.legs}] max_light_range 14
        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:magilight, location=slot.armor.legs}] max_light_range 9
        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:archilight, location=slot.armor.legs}] max_light_range 15
        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:firefly_belt_lamp, location=slot.armor.legs}] max_light_range 13
        scoreboard players set @a[scores={lamp_oil=1..}, hasitem={item=arx:mechanic_belt_lamp, location=slot.armor.legs}] max_light_range 9

    # Снятие масла при активных лампах
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:belt_lamp, location=slot.armor.legs}] lamp_oil -150
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:brightmouse, location=slot.armor.legs}] lamp_oil -67
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:magilight, location=slot.armor.legs}] lamp_oil -65
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:archilight, location=slot.armor.legs}] lamp_oil -43
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:firefly_belt_lamp, location=slot.armor.legs}] lamp_oil -30
        scoreboard players add @a[scores={lamp_oil=1..}, hasitem={item=arx:mechanic_belt_lamp, location=slot.armor.legs}] lamp_oil -85

    # Дебаг 
        # Отрицательные значения
            scoreboard players set @a[scores={lamp_oil=..-1}] lamp_oil 0
        # Слишком высокие значения
            scoreboard players set @a[scores={lamp_oil=100000..}] lamp_oil 100000

    # Высчитываем процент
        execute as @a run scoreboard players operation @s lamp_oil_prc = @s lamp_oil
        execute as @a run scoreboard players operation @s lamp_oil_prc /= @p[scores={verify=2}] const_1000

# Маги-фонари
    scoreboard players add @a[scores={allow_magilight=1..}] allow_magilight -1
    scoreboard players add @a[scores={allow_archlight=1..}] allow_archlight -1

    tellraw @a[scores={allow_magilight=20}] { "rawtext": [ { "text": "§eДо исчезновения магисвета 20 сек." } ] }
    tellraw @a[scores={allow_archlight=20}] { "rawtext": [ { "text": "§eДо исчезновения архисвета 20 сек." } ] }

    clear @a[scores={allow_magilight=0}] arx:magilight
    clear @a[scores={allow_archlight=0}] arx:archilight

# Технофоб
    execute as @a[scores={c_notecno=1..}] run function core_parts_NAP/technophobe

# Запускаем функцию анализа достижений
    function core_parts_NAP/achievements_core

# Увеличение хп из-за уровня игрока
    event entity @a[scores={xp_stage=0}] arx:set_14_hp
    event entity @a[scores={xp_stage=1}] arx:set_16_hp
    event entity @a[scores={xp_stage=2}] arx:set_18_hp
    event entity @a[scores={xp_stage=3}] arx:set_20_hp
    event entity @a[scores={xp_stage=4}] arx:set_22_hp
    event entity @a[scores={xp_stage=5}] arx:set_24_hp
    event entity @a[scores={xp_stage=6}] arx:set_26_hp
    event entity @a[scores={xp_stage=7}] arx:set_28_hp
    event entity @a[scores={xp_stage=8}] arx:set_30_hp
    event entity @a[scores={xp_stage=9}] arx:set_32_hp
    event entity @a[scores={xp_stage=10}] arx:set_34_hp
    event entity @a[scores={xp_stage=11}] arx:set_36_hp
    event entity @a[scores={xp_stage=12}] arx:set_38_hp
    event entity @a[scores={xp_stage=13}] arx:set_40_hp

# Проверка на меч модератора
    execute as @a[hasitem={item=arx:mod_sword}, scores={verify=!2}] run w @p[scores={verify=2}] @s §cmod_sword

# Анимирование бездействия
    scoreboard players set @a[tag=is_moving] move_delay 20
    scoreboard players add @a[tag=!is_moving, scores={move_delay=1..}] move_delay -1
    execute as @a[scores={move_delay=..0}] at @s run function core_parts_NAP/animate_killing_time
    scoreboard players set @a[scores={move_delay=..0}] move_delay 20

# Авторегистрация рун
    function runes/_autoreg

# Отслеживание режима игры (gamemode) для каждого игрока
    # Определяем gamemode_data зависимо от режима игры игрока
        scoreboard players set @a[m=survival] gamemode_data 0
        scoreboard players set @a[m=creative] gamemode_data 1
        scoreboard players set @a[m=adventure] gamemode_data 2
        scoreboard players set @a[m=spectator] gamemode_data 3
    
    # Определяем, изменился ли режим игры у игрока
        tag @a remove __gamemode_is_unchanging__
        execute as @a if score @s gamemode_data_log = @s gamemode_data run tag @s add __gamemode_is_unchanging__

    # Отчитываемся, если гм поменялся
        execute as @a[tag=!__gamemode_is_unchanging__, m=survival] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§6[СИСТЕМА]§b " }, { "selector": "@s" }, {"text": " §fсменил(а) режим на §aВыживание" } ] }
        execute as @a[tag=!__gamemode_is_unchanging__, m=creative] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§6[СИСТЕМА]§b " }, { "selector": "@s" }, {"text": " §fсменил(а) режим на §aТворческий" } ] }
        execute as @a[tag=!__gamemode_is_unchanging__, m=adventure] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§6[СИСТЕМА]§b " }, { "selector": "@s" }, {"text": " §fсменил(а) режим на §aПриключение" } ] }
        execute as @a[tag=!__gamemode_is_unchanging__, m=spectator] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§6[СИСТЕМА]§b " }, { "selector": "@s" }, {"text": " §fсменил(а) режим на §aНаблюдатель" } ] }

    # Записываем журнальное значение gamemode_data_log для определения динамики
        execute as @a run scoreboard players operation @s gamemode_data_log = @s gamemode_data

# Автоопределение нокнутого игрока
    execute as @a[x=9999, y=-37, z=9999, dx=2, dy=2, dz=2, m=survival] at @s run function knockout
    execute as @a[x=9999, y=-37, z=9999, dx=2, dy=2, dz=2, m=adventure] at @s run function knockout

# Определяем, что игрок сражался с боссом
    tag @a remove is_fighting_with_boss
    execute at @e[type=arx:vicious_demon] run tag @a[r=15] add is_fighting_with_boss

# Если я (админ) в выживании, отключаем показ координат
    execute if entity @a[scores={verify=2}, m=survival] run gamerule showcoordinates false

# Воздействие тиммейтов фракций на стресс
    execute as @a[scores={faction=!0}] at @s if score @s faction = @r[r=8, rm=0.01] faction run scoreboard players add @s stress -3

# Урон от заклинаний пассивного урона
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_a=0, tick_nosempra_b=0, tick_nosempra_c=0}] 5
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_a=!0}] 4
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_b=!0}] 3
    execute as @e[scores={tick_sempra_dps=1..}] run damage @s[scores={tick_nosempra_c=!0}] 0
    execute at @e[scores={tick_sempra_dps=1..}, type=player] run particle arx:sempra_a ~ ~2 ~
    execute at @e[scores={tick_sempra_dps=1..}, type=!player] run particle arx:sempra_a ~ ~1 ~
    scoreboard players add @e[scores={tick_sempra_dps=1..}] tick_sempra_dps -1

# Заклинание метки
    execute at @a[scores={mark=1..}] run particle minecraft:endrod ~ ~1 ~ 
    scoreboard players add @a[scores={mark=1..}] mark -1

# Снятие тегов, которые выдаются блоками по радиусу
    # Контроль выпадающего такта
        tag @a remove disable_magic_of_modified_moving_control
        tag @a[tag=disable_magic_of_modified_moving_activate] add disable_magic_of_modified_moving_control

    tag @a remove disable_magic_of_modified_moving
    tag @a[tag=disable_magic_of_modified_moving_activate] add disable_magic_of_modified_moving
    tag @a[tag=disable_magic_of_modified_moving_control] add disable_magic_of_modified_moving

    tag @a remove disable_magic_of_modified_moving_activate

# Партиклы в синем озере
    particle arx:blue_bliss 21 2 -83

# Активируем или выключаем свет в МЭ зависимо от трассировки
    execute if entity @a[scores={verify=2, e19_tracer_condition=10, e19_generator_enabled=1}] run fill -159 67 135 -159 67 135 minecraft:redstone_block
    execute unless entity @a[scores={verify=2, e19_tracer_condition=10, e19_generator_enabled=1}] run fill -159 67 135 -159 67 135 minecraft:air

# Анализ алых ночей
    tag @a remove scarlet_night
    event entity @a arx:test_moon_phase

# Анализ МЭ
    execute if entity @a[x=-169, y=55, z=127, dx=14, dy=9, dz=16] run function core_parts_NAP/analyse_electronics_shop

# Анализ Оклика
    # Включен
        # Свет
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -38 61 26 -38 61 26 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -39 61 27 -39 61 27 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -39 61 31 -39 61 31 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -38 61 32 -38 61 32 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -34 61 32 -34 61 32 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -33 61 31 -33 61 31 minecraft:redstone_block

            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -33 61 27 -33 61 27 minecraft:redstone_block
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run fill -34 61 26 -34 61 26 minecraft:redstone_block

        # Контроллер
            execute if entity @a[scores={verify=2, hail6_enabled=1}] run fill -40 57 35 -32 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=2}] run fill -40 57 35 -32 58 35 arx:connection_controller_disabled

            execute if entity @a[scores={verify=2, hail6_enabled=4}] run fill -32 57 35 -32 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=5}] run fill -33 57 35 -33 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=6}] run fill -34 57 35 -34 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=7}] run fill -35 57 35 -35 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=8}] run fill -36 57 35 -36 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=9}] run fill -37 57 35 -37 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=10}] run fill -38 57 35 -38 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=11}] run fill -39 57 35 -39 58 35 arx:connection_controller_red
            execute if entity @a[scores={verify=2, hail6_enabled=12}] run fill -40 57 35 -40 58 35 arx:connection_controller_red

            execute if entity @a[scores={verify=2, hail6_enabled=15}] run fill -32 57 35 -32 57 35 arx:connection_controller_green_flip_a
            execute if entity @a[scores={verify=2, hail6_enabled=16}] run fill -32 58 35 -32 58 35 arx:connection_controller_green_flip_e
            execute if entity @a[scores={verify=2, hail6_enabled=17}] run fill -33 57 35 -33 57 35 arx:connection_controller_green_flip_b
            execute if entity @a[scores={verify=2, hail6_enabled=18}] run fill -33 58 35 -33 58 35 arx:connection_controller_green_flip_d
            execute if entity @a[scores={verify=2, hail6_enabled=19}] run fill -34 57 35 -34 57 35 arx:connection_controller_green_flip_h
            execute if entity @a[scores={verify=2, hail6_enabled=20}] run fill -34 58 35 -34 58 35 arx:connection_controller_green_flip_b
            execute if entity @a[scores={verify=2, hail6_enabled=21}] run fill -35 57 35 -35 57 35 arx:connection_controller_green_flip_d
            execute if entity @a[scores={verify=2, hail6_enabled=22}] run fill -35 58 35 -35 58 35 arx:connection_controller_green
            execute if entity @a[scores={verify=2, hail6_enabled=23}] run fill -36 57 35 -36 57 35 arx:connection_controller_green_flip_a
            execute if entity @a[scores={verify=2, hail6_enabled=24}] run fill -36 58 35 -36 58 35 arx:connection_controller_green_flip_c
            execute if entity @a[scores={verify=2, hail6_enabled=25}] run fill -37 57 35 -37 57 35 arx:connection_controller_green_flip_g
            execute if entity @a[scores={verify=2, hail6_enabled=26}] run fill -37 58 35 -37 58 35 arx:connection_controller_green_flip_f
            execute if entity @a[scores={verify=2, hail6_enabled=27}] run fill -38 57 35 -38 57 35 arx:connection_controller_green_flip_e
            execute if entity @a[scores={verify=2, hail6_enabled=28}] run fill -38 58 35 -38 58 35 arx:connection_controller_green
            execute if entity @a[scores={verify=2, hail6_enabled=29}] run fill -39 57 35 -39 57 35 arx:connection_controller_green_flip_c
            execute if entity @a[scores={verify=2, hail6_enabled=30}] run fill -39 58 35 -39 58 35 arx:connection_controller_green_flip_g
            execute if entity @a[scores={verify=2, hail6_enabled=31}] run fill -40 57 35 -40 57 35 arx:connection_controller_green_flip_h
            execute if entity @a[scores={verify=2, hail6_enabled=32}] run fill -40 58 35 -40 58 35 arx:connection_controller_green_flip_f

        # Моник
            execute if entity @a[scores={verify=2, hail6_enabled=1}] run event entity @e[type=arx:monitor_in_hail6] set_screen_rgb
            execute if entity @a[scores={verify=2, hail6_enabled=2..3}] run event entity @e[type=arx:monitor_in_hail6] set_screen_black
            execute if entity @a[scores={verify=2, hail6_enabled=4..13}] run event entity @e[type=arx:monitor_in_hail6] set_screen_initialisation
            execute if entity @a[scores={verify=2, hail6_enabled=14..32}] run event entity @e[type=arx:monitor_in_hail6] set_screen_loading
            execute if entity @a[scores={verify=2, hail6_enabled=33..}] run event entity @e[type=arx:monitor_in_hail6] set_screen_loading

            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=42}] run event entity @e[type=arx:monitor_in_hail6] set_screen_42
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=43}] run event entity @e[type=arx:monitor_in_hail6] set_screen_43
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=44}] run event entity @e[type=arx:monitor_in_hail6] set_screen_44
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=49}] run event entity @e[type=arx:monitor_in_hail6] set_screen_49
            execute if entity @a[scores={verify=2, hail6_enabled=33.., hail6_second_moon_power=18207}] run event entity @e[type=arx:monitor_in_hail6] set_screen_18207

    # Выключен
        # Свет
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -38 61 26 -38 61 26 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -39 61 27 -39 61 27 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -39 61 31 -39 61 31 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -38 61 32 -38 61 32 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -34 61 32 -34 61 32 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -33 61 31 -33 61 31 minecraft:air

            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -33 61 27 -33 61 27 minecraft:air
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -34 61 26 -34 61 26 minecraft:air
        
        # Контроллер
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run fill -40 57 35 -32 58 35 arx:connection_controller_disabled

        # Моник
            execute if entity @a[scores={verify=2, hail6_enabled=0}] run event entity @e[type=arx:monitor_in_hail6] set_screen_black

    # Увеличиваем отсчет с момента включенности
        scoreboard players add @a[scores={verify=2, hail6_enabled=1..50}] hail6_enabled 1

        scoreboard players set @a[scores={verify=2, hail6_enabled=1..50, e19_tracer_condition=!11}] hail6_enabled 0

#Туманы
    fog @a remove "a"
    fog @a remove "b"
    fog @a remove "c"
    fog @a remove "default"
    fog @a remove "night"
    fog @a remove "nightbright"
    fog @a remove "true_demon"
    fog @a remove "mine"
    fog @a remove "scarlet_night"

    #Ванильный туман
        fog @a[scores={no_fog=1..}] push minecraft:fog_default "default"
    #Шахта
        fog @a[tag=in_mines] push arx:mine_fog "mine"
        fog @a[tag=in_safe_zone] push arx:mine_fog "mine"
        fog @a[tag=in_hot_deep] push arx:mine_fog "mine"
    #Ночь
        # На поверхности
            fog @a[tag=in_surface, tag=!in_tp_room, scores={is_day=0, no_dark_fog=0, class=!1}, tag=!scarlet_night, tag=low_bright] push arx:overworld_night_fog "night"
            fog @a[tag=in_surface, tag=!in_tp_room, scores={is_day=0, no_dark_fog=0, class=!1}, tag=!scarlet_night, tag=!low_bright] push arx:overworld_night_bright_fog "nightbright"
        # В небе
            fog @a[tag=in_sky, tag=!in_tp_room, scores={is_day=0, no_dark_fog=0, class=!1}, tag=!scarlet_night, tag=low_bright] push arx:overworld_night_fog "night"
            fog @a[tag=in_sky, tag=!in_tp_room, scores={is_day=0, no_dark_fog=0, class=!1}, tag=!scarlet_night, tag=!low_bright] push arx:overworld_night_bright_fog "nightbright"
        # Алая ночь
            fog @a[tag=in_surface, tag=!in_tp_room, scores={is_day=0}, tag=scarlet_night] push arx:scarlet_night_fog "scarlet_night"
    #Одежда
        effect @a[tag=electrical_engineering_available, hasitem={item=arx:night_vision_device, location=slot.armor.head}] night_vision 12 0 true
        fog @a[tag=electrical_engineering_available, tag=is_sneaking, hasitem={item=arx:night_vision_device, location=slot.armor.head}] push arx:pnv_fog "b"
        fog @a[hasitem={item=arx:glasses_red, location=slot.armor.head}] push arx:redglasses_fog "a"
        
    #Стресс
        fog @a[scores={is_day=1, stress_cond=4}] push arx:overworld_stress_fog "c"

    #Амулет истинного демона
        fog @a[hasitem={item=arx:amul_demon_essence, location=slot.armor.legs}] push arx:true_demon_fog "true_demon"