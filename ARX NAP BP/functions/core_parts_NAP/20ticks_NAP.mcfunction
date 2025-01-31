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
    playsound portal.passive @a -213 34 336 0.5

    particle arx:portal_fog_down -213 43 336
    playsound portal.passive @a -213 43 336 0.5

    particle arx:portal_fog -213 40 354
    playsound portal.passive @a -213 40 354 0.5

    particle arx:portal_fog -20 -42 -303
    playsound portal.passive @a -20 -42 -303 0.5

    particle arx:portal_fog 22.0 9 -83.0
    playsound portal.passive @a 22.0 9 -83.0 0.2

    particle arx:portal_fog -172 67 24
    playsound portal.passive @a -172 67 24 0.5

    particle arx:portal_fog 1475 63 2692 
    playsound portal.passive @a 1475 63 2692 0.5


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

# Определяем, что игрок сражался с боссом
    tag @a remove is_fighting_with_boss
    execute at @e[type=arx:vicious_demon] run tag @a[r=15] add is_fighting_with_boss
    execute at @e[type=arx:march] run tag @a[r=15] add is_fighting_with_boss

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

# Партиклы в голубом озере
    particle arx:blue_bliss 21 2 -83

# Активируем или выключаем свет в МЭ зависимо от трассировки
    execute if entity @a[scores={verify=2, e19_tracer_condition=10, e19_generator_enabled=1}] run fill -159 67 135 -159 67 135 minecraft:redstone_block
    execute unless entity @a[scores={verify=2, e19_tracer_condition=10, e19_generator_enabled=1}] run fill -159 67 135 -159 67 135 minecraft:air

# Анализ алых ночей
    tag @a remove scarlet_night
    event entity @a arx:test_moon_phase

# Анализ МЭ
    execute if entity @a[x=-169, y=55, z=127, dx=14, dy=9, dz=16] run function core_parts_NAP/analyse_electronics_shop

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
        fog @a[scores={is_day=1, stress_cond=4, respawn_delay=..5}] push arx:overworld_stress_fog "c"

    #Амулет истинного демона
        fog @a[hasitem={item=arx:amul_demon_essence, location=slot.armor.legs}] push arx:true_demon_fog "true_demon"

# Запускаем ананлиз оклика 6
    execute if entity @a[x=-61, y=50, z=4, dx=50, dy=100, dz=50] run function core_parts_NAP/hail6_analysis

# СТРЕСС
    #Холод
        scoreboard players add @a[scores={c_coldy=!1.., freezing=1..}] stress 3
        scoreboard players add @a[scores={c_warmy=1.., freezing=1..}] stress 30

    #Жара
        scoreboard players add @a[scores={c_warmy=!1.., freezing=..-1}] stress 3
        scoreboard players add @a[scores={c_coldy=1.., freezing=..-1}] stress 30

    #Матершинник
        #Мат на нематерящихся
            execute as @a[scores={c_rude=1.., custom_random=410..430}] at @s run scoreboard players add @a[scores={c_rude=0}, rm=0.1, r=8] stress 150
            execute as @a[scores={c_rude=1.., custom_random=410..430}] at @s run w @a[scores={c_rude=0}, rm=0.1, r=8] @p[scores={c_rude=1..}] много матерится. Мне это неприятно.
        #Мат на матершинника
            execute as @a[scores={c_rude=1.., custom_random=410..430}] at @s run scoreboard players add @a[scores={c_rude=1}, rm=0.1, r=8] stress -100
            execute as @a[scores={c_rude=1.., custom_random=410..430}] at @s run w @a[scores={c_rude=1}, rm=0.1, r=8] @p[scores={c_rude=1..}] много матерится. Как же это охуенно!

    #Чилл в водичке
        scoreboard players add @a[scores={c_water_lover=0}, tag=in_block_water] stress -2
        scoreboard players add @a[scores={c_water_lover=1..}, tag=in_block_water] stress -4

    #Случайная динамика
        #Случайная незначительная динамика
            scoreboard players add @a[scores={custom_random=100..120, stress=-1000..1000, c_indifference=0}] stress -200
            scoreboard players add @a[scores={custom_random=121..141, stress=-1000..1000, c_indifference=0, c_inflexible=0}] stress 200
            scoreboard players add @a[scores={custom_random=100..120, stress=-1000..1000, c_indifference=1..}] stress -100
            scoreboard players add @a[scores={custom_random=121..141, stress=-1000..1000, c_indifference=1.., c_inflexible=0}] stress 100

        #Случайные события
            scoreboard players add @a[scores={custom_random=200, custom_random_b=0..100, c_indifference=0}] stress -2000
            scoreboard players add @a[scores={custom_random=200, custom_random_b=0..100, c_indifference=1..}] stress -1000
            tellraw @a[scores={custom_random=200, custom_random_b=0..100}] { "rawtext": [ { "text": "Ē Вы вспомнили хорошие времена. Это подняло ваше настроение." } ] }
            scoreboard players add @a[scores={custom_random=201, custom_random_b=0..100, c_indifference=0, c_inflexible=0}] stress 2000
            scoreboard players add @a[scores={custom_random=201, custom_random_b=0..100, c_indifference=1.., c_inflexible=0}] stress 1000
            tellraw @a[scores={custom_random=201, custom_random_b=0..100, c_inflexible=0, xp_stage=2..}] { "rawtext": [ { "text": "đ Вы вспомнили плохие времена. Это испортило ваше настроение." } ] }

    # Корректирующая динамика. Этот код не позволяет оставаться игроку очень долго на стрессе или счастье, приближая его к нейтральным значениям

        # Изменяем нормализацию стресса зависимо от самого стресса
            # Если стресс (stress_normalize стремится к отрицательным значениям)
                execute as @a[scores={stress_cond=4, custom_random=..100}] run scoreboard players add @s stress_normalize -1
                execute as @a[scores={stress_cond=3, custom_random=..35}] run scoreboard players add @s stress_normalize -1
                execute as @a[scores={stress_cond=2, custom_random=..15}] run scoreboard players add @s stress_normalize -1
            
            # Если счастье (stress_normalize стремится к положительным значениям)
                execute as @a[scores={stress_cond=-4, custom_random=..100}] run scoreboard players add @s stress_normalize 1
                execute as @a[scores={stress_cond=-3, custom_random=..35}] run scoreboard players add @s stress_normalize 1
                execute as @a[scores={stress_cond=-2, custom_random=..15}] run scoreboard players add @s stress_normalize 1

            # Угасание переменной
                execute as @a[scores={stress_cond=-1..4, stress_normalize=1.., custom_random=500..535}] run scoreboard players add @s stress_normalize -1
                execute as @a[scores={stress_cond=-4..1, stress_normalize=..-1, custom_random=500..535}] run scoreboard players add @s stress_normalize 1

        # Граница
            execute as @a[scores={stress_normalize=21..}] run scoreboard players set @s stress_normalize 20
            execute as @a[scores={stress_normalize=..-21}] run scoreboard players set @s stress_normalize -20

        # Прибавляем нормализацию к стрессу
            execute as @a run scoreboard players operation @s stress += @s stress_normalize


    #Действие колец и амулетов
        scoreboard players add @a[scores={stress=-1500..}, hasitem={item=arx:ring_caryite_prismarine, location=slot.armor.feet}] stress -1
        scoreboard players add @a[scores={stress=..1500}, hasitem={item=arx:ring_caryite_emerald, location=slot.armor.feet}] stress 20
        scoreboard players add @a[scores={custom_random=10..110, religion=1..9}, hasitem={item=arx:amul_pallas, location=slot.armor.feet}] stress -50
        scoreboard players add @a[scores={custom_random=10..110, religion=11..19}, hasitem={item=arx:amul_pires, location=slot.armor.feet}] stress -50

    #Падение стресса к нейтральным значениям
        #Снижение счастья
            scoreboard players add @a[scores={stress=..-800, c_indifference=0, c_angry=0}] stress 1
            scoreboard players add @a[scores={stress=..-800, c_indifference=1.., custom_random=0..500, c_angry=0}] stress 1

        #Снижение стресса
            scoreboard players add @a[scores={stress=800.., c_indifference=0}] stress -1
            scoreboard players add @a[scores={stress=800.., c_indifference=1.., custom_random=0..500}] stress -1
            #Ускоренное снижение стресса при высоком стрессе
                scoreboard players add @a[scores={stress=1600.., c_indifference=0}] stress -6
                scoreboard players add @a[scores={stress=1600.., c_indifference=1..}] stress -3

        #Если c_angry
            scoreboard players add @a[scores={stress=..-2500, c_indifference=0, c_angry=1..}] stress 2
            scoreboard players add @a[scores={stress=..-2500, c_indifference=1.., c_angry=1..}] stress 1

    #Стресс при низком хп
        scoreboard players add @a[tag=low_hp] stress 5
        scoreboard players add @a[tag=very_low_hp] stress 25

    #Воздействие черт
        execute at @e[type=cave_spider] run scoreboard players add @a[r=5, scores={c_nospider=1..}] stress 100
        execute at @e[type=cave_spider] run title @a[r=5, scores={c_nospider=1..}] actionbar Вы боитесь паука!

        execute at @e[type=zombie] run scoreboard players add @a[r=5, scores={c_nonecro=1..}] stress 100
        execute at @e[type=zombie] run title @a[r=5, scores={c_nonecro=1..}] actionbar Вы боитесь мертвеца!

        execute at @e[type=skeleton] run scoreboard players add @a[r=5, scores={c_nonecro=1..}] stress 100
        execute at @e[type=skeleton] run title @a[r=5, scores={c_nonecro=1..}] actionbar Вы боитесь скелета!

        execute at @a[scores={class=1}] run scoreboard players add @a[r=5, rm=0.5, scores={c_nonecro=1..}] stress 100
        execute at @a[scores={class=1}] run title @a[r=5, rm=0.0001, scores={c_nonecro=1..}] actionbar Вы боитесь призрака!

        execute at @a run scoreboard players add @a[r=8, rm=0.5, scores={c_nosocio=1..}] stress 6
        execute at @a run title @a[r=8, rm=0.5, scores={c_nosocio=1..}] actionbar Вам неприятно в обществе

        scoreboard players add @a[scores={c_nodarkness=1..}, tag=low_bright] stress 3
        title @a[scores={c_nodarkness=1..}, tag=low_bright] actionbar Вы боитесь темноты!

        scoreboard players add @a[scores={c_nolight=1..}, tag=high_bright] stress 3
        title @a[scores={c_nolight=1..}, tag=high_bright] actionbar Вы боитесь света!

        scoreboard players add @a[scores={c_nomines=1..}, tag=in_mines] stress 20
        title @a[scores={c_nomines=1..}, tag=in_mines] actionbar Вы боитесь шахт!
        scoreboard players add @a[scores={c_nomines=1..}, tag=in_safe_zone] stress 20
        title @a[scores={c_nomines=1..}, tag=in_safe_zone] actionbar Вы боитесь шахт!
        scoreboard players add @a[scores={c_nomines=1..}, tag=in_hot_deep] stress 20
        title @a[scores={c_nomines=1..}, tag=in_hot_deep] actionbar Вы боитесь шахт!

        scoreboard players add @a[scores={c_religious=1.., religion=0}] stress 1
        title @a[scores={c_religious=1.., religion=0}] actionbar Вам противно ваше неверование!

        scoreboard players add @a[scores={c_nocold=1.., freezing=1..}] stress 10
        scoreboard players add @a[scores={c_nowarm=1.., freezing=..-1}] stress 10

    #Границы стресса
        scoreboard players set @a[scores={stress=..-4501}] stress -4500
        scoreboard players set @a[scores={stress=4501..}] stress 4500
    
    #Состояние стресса stress_cond
        scoreboard players set @a[scores={stress=..-3501}] stress_cond -4
        scoreboard players set @a[scores={stress=-3500..-2501}] stress_cond -3
        scoreboard players set @a[scores={stress=-2500..-1501}] stress_cond -2
        scoreboard players set @a[scores={stress=-1500..-501}] stress_cond -1

        scoreboard players set @a[scores={stress=-500..500}] stress_cond 0
        
        scoreboard players set @a[scores={stress=501..1500}] stress_cond 1
        scoreboard players set @a[scores={stress=1501..2500}] stress_cond 2
        scoreboard players set @a[scores={stress=2501..3500}] stress_cond 3
        scoreboard players set @a[scores={stress=3501..}] stress_cond 4
    
    #Рассчёт дельты
        execute as @a run scoreboard players operation @s stress_co_delta = @s stress_cond
        execute as @a run scoreboard players operation @s stress_co_delta -= @s stress_co_hist
        execute as @a run scoreboard players operation @s stress_co_hist = @s stress_cond

    #Вывод
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=-4}] {"rawtext": [{"text": "[Стало лучше] ĒĒĒĒ (§aМакс.§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=-3}] {"rawtext": [{"text": "[Стало лучше] ĒĒĒ (§a3§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=-2}] {"rawtext": [{"text": "[Стало лучше] ĒĒ (§a2§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=-1}] {"rawtext": [{"text": "[Стало лучше] Ē (1 ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=0}] {"rawtext": [{"text": "[Стало лучше] ē (0 ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=1}] {"rawtext": [{"text": "[Стало лучше] đ (1 ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=2}] {"rawtext": [{"text": "[Стало лучше] đđ (§c2§f ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=3}] {"rawtext": [{"text": "[Стало лучше] đđđ (§c3§f ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=..-1, stress_cond=4}] {"rawtext": [{"text": "[Стало лучше] đđđđ (§cМакс.§f ур. стресса)"}]}

        tellraw @a[scores={stress_co_delta=1.., stress_cond=-4}] {"rawtext": [{"text": "[Стало хуже] ĒĒĒĒ (§aМакс.§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=-3}] {"rawtext": [{"text": "[Стало хуже] ĒĒĒ (§a3§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=-2}] {"rawtext": [{"text": "[Стало хуже] ĒĒ (§a2§f ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=-1}] {"rawtext": [{"text": "[Стало хуже] Ē (1 ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=0}] {"rawtext": [{"text": "[Стало хуже] ē (0 ур. счастья)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=1}] {"rawtext": [{"text": "[Стало хуже] đ (1 ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=2}] {"rawtext": [{"text": "[Стало хуже] đđ (§c2§f ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=3}] {"rawtext": [{"text": "[Стало хуже] đđđ (§c3§f ур. стресса)"}]}
        tellraw @a[scores={stress_co_delta=1.., stress_cond=4}] {"rawtext": [{"text": "[Стало хуже] đđđđ (§cМакс.§f ур. стресса)"}]}
        
    #Получение-снятие черт характера 
        execute as @a[scores={stress_cond=4, custom_random=700, custom_random_b=0..500}] run function traits/get_negative_trait
        execute as @a[scores={stress_cond=4, custom_random=700, custom_random_b=501..833}] run function traits/get_neutral_trait
        execute as @a[scores={stress_cond=4, custom_random=700, custom_random_b=834..1000}] run function traits/get_positive_trait

        execute as @a[scores={c_unstable=1.., stress_cond=4, custom_random=701, custom_random_b=0..500}] run function traits/get_negative_trait
        execute as @a[scores={c_unstable=1.., stress_cond=4, custom_random=701, custom_random_b=501..833}] run function traits/get_neutral_trait
        execute as @a[scores={c_unstable=1.., stress_cond=4, custom_random=701, custom_random_b=834..1000}] run function traits/get_positive_trait
        
        scoreboard players add @a[scores={stress_cond=4, custom_random=700}] stress -150
        scoreboard players add @a[scores={c_unstable=1.., stress_cond=4, custom_random=701}] stress -150

        execute as @a[scores={stress_cond=-4}] run function traits/clear_loose_traits

# Маленькая голова (закл)
    scoreboard players add @a[scores={spell_of_small_head=1..}] spell_of_small_head -1 
    playanimation @a[scores={spell_of_small_head=1..}] animation.player.invisible_head

# Действите некоторых амулетов
    execute at @a[hasitem={item=arx:amul_antighost, location=slot.armor.legs}] run scoreboard players add @a[scores={class=1}, r=10] stress 100
    execute at @a[hasitem={item=arx:amul_antighost, location=slot.armor.legs}] run title @a[scores={class=1}, r=10] actionbar §4Вас накрывает ужас

    effect @a[hasitem={item=arx:amul_photoresonance, location=slot.armor.legs}, tag=high_bright] night_vision 11 0 true

    effect @a[hasitem={item=arx:amul_ruby, location=slot.armor.legs}, scores={freezing=!..-1001}] fire_resistance 1 0 true

# Обнаружение и автофикс некоторых ошибок
    execute as @a[tag=self] run w @a[scores={verify=2}] §4Обнаружена ошибка у @s core>>tags>>self
    tag @a remove self
    execute as @a[tag=staffself] run w @a[scores={verify=2}] §4Обнаружена ошибка у @s core>>tags>>staffself
    tag @a remove staffself
    execute as @a[tag=success] run w @a[scores={verify=2}] §4Обнаружена ошибка у @s core>>tags>>success 
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

# Отравление
    # Вычисление эффективности снятия отравления
        scoreboard players set @a pois_dec 1
        scoreboard players add @a[scores={poit_pois_dec_a=1..}] pois_dec 1
        scoreboard players add @a[scores={poit_pois_dec_b=1..}] pois_dec 2
        scoreboard players add @a[scores={poit_pois_dec_c=1..}] pois_dec 4
        scoreboard players add @a[scores={poit_pois_dec_d=1..}] pois_dec 8
        scoreboard players add @a[hasitem={item=arx:ring_caryite_aquamarine, location=slot.armor.feet}] pois_dec 1
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_aquamarine, location=slot.armor.feet}] pois_dec 3
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_aquamarine, location=slot.armor.feet}] pois_dec 5
        scoreboard players add @a[hasitem={item=arx:ring_of_immortal_eagle, location=slot.armor.feet}] pois_dec 5

        scoreboard players add @a[scores={trailblazer_skill=1..2}] pois_dec 1
        scoreboard players add @a[scores={trailblazer_skill=3..4}] pois_dec 2
        scoreboard players add @a[scores={trailblazer_skill=5..6}] pois_dec 3

    # Вычитание отравления
        execute as @a[scores={poisoning=1..}] run scoreboard players operation @s poisoning -= @s pois_dec

    # Определяем уровень отравления
        scoreboard players set @a[scores={poisoning=0}] pois_cond 0
        scoreboard players set @a[scores={poisoning=260..999}] pois_cond 1
        scoreboard players set @a[scores={poisoning=1000..1999}] pois_cond 2
        scoreboard players set @a[scores={poisoning=2000..2999}] pois_cond 3
        scoreboard players set @a[scores={poisoning=3000..}] pois_cond 4

    # Определяем дельту состояния отравления
        execute as @a run scoreboard players operation @s pois_cond_delta = @s pois_cond
        execute as @a run scoreboard players operation @s pois_cond_delta -= @s pois_cond_log

    # Выводим сообщения
        tellraw @a[scores={pois_cond_delta=1.., pois_cond=1}] { "rawtext": [  { "text": "Мне стало хуже §4(1 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=1.., pois_cond=2}] { "rawtext": [  { "text": "Мне стало хуже §4(2 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=1.., pois_cond=3}] { "rawtext": [  { "text": "Мне стало хуже §4(3 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=1.., pois_cond=4}] { "rawtext": [  { "text": "Мне стало хуже §4(4 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=..-1, pois_cond=0}] { "rawtext": [  { "text": "Мне стало лучше §a(Отравление прошло)" } ] } 
        tellraw @a[scores={pois_cond_delta=..-1, pois_cond=1}] { "rawtext": [  { "text": "Мне стало лучше §a(1 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=..-1, pois_cond=2}] { "rawtext": [  { "text": "Мне стало лучше §a(2 ур. отравления)" } ] } 
        tellraw @a[scores={pois_cond_delta=..-1, pois_cond=3}] { "rawtext": [  { "text": "Мне стало лучше §a(3 ур. отравления)" } ] } 

    # Воздействие на стресс
        scoreboard players add @a[scores={pois_cond=1.., c_persistent=0}] stress 2
        scoreboard players add @a[scores={pois_cond=2.., c_persistent=0}] stress 5
        scoreboard players add @a[scores={pois_cond=3.., c_persistent=0}] stress 20
        scoreboard players add @a[scores={pois_cond=4, c_persistent=0}] stress 100

    # Непосредственные дебаффы
        #Отравление 2 ур
            effect @a[scores={pois_cond=2, custom_random=0..50}] nausea 20 0

        # Отравление 3 ур
            effect @a[scores={pois_cond=3, custom_random=1..50}] darkness 20 0
            effect @a[scores={pois_cond=3, custom_random=51..100}] fatal_poison 10 0
            effect @a[scores={pois_cond=3..4}] nausea 20 0
            #Отравление 3.. ур блокирует регенерацию (см. Авторегенерация хп)
            #scoreboard players set @a[scores={pois_cond=3..4}] regen_mp 0

        # Отравление 4 ур
            effect @a[scores={pois_cond=4}] blindness 20 0
            effect @a[scores={pois_cond=4}] fatal_poison 5 0

    # Обновляем перменную-историю уровня отравления
        execute as @a run scoreboard players operation @s pois_cond_log = @s pois_cond

    # Вычитание поинта блокировки отравления (ванильного, но надо проверить)
        execute as @e[scores={pois_block=1..}] run scoreboard players add @e[r=0.0001] pois_block -1

    # Дебаг
        scoreboard players set @a[scores={poisoning=..-1}] poisoning 0

# Нокаут
    # Вход в нокаут
        execute as @a if score @s respawn_delay > @s respawn_delay_history run inputpermission set @s camera disabled
        execute as @a if score @s respawn_delay > @s respawn_delay_history run inputpermission set @s movement disabled
        execute as @a if score @s respawn_delay > @s respawn_delay_history run event entity @s arx:property_is_knockout_set_true
        
    # Выход из нокаута (именно не вставание, а выход из нокаута. Игрок может продолжить лежать и притворяться мертвым)
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run inputpermission set @s camera enabled
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run inputpermission set @s[tag=!is_riding] movement enabled
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run tellraw @s[tag=!__died_last_second__, scores={custom_random=0..333}] { "rawtext": [ { "text": "§o§eГде я...?" } ] }
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run tellraw @s[tag=!__died_last_second__, scores={custom_random=334..666}] { "rawtext": [ { "text": "§o§eСколько прошло времени...?" } ] }
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run tellraw @s[tag=!__died_last_second__, scores={custom_random=667..1000}] { "rawtext": [ { "text": "§o§eКак больно..." } ] }
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history if entity @s[tag=!__died_last_second__, tag=crystal_of_shield_activate] run tellraw @s { "rawtext": [ { "text": "§aВас защищает магическая сила (кристалл щита активен)" } ] }
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history if entity @s[tag=!__died_last_second__, tag=crystal_of_shield_activate] run effect @s resistance 60 0 true
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run scoreboard players set @s knockout_row_sounter 0
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run tag @s remove crystal_of_shield_activate
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run tag @s remove crystal_of_second_life_activate
        execute as @a[scores={respawn_delay=0}] if score @s respawn_delay < @s respawn_delay_history run clear @s arx:slot_blocker

    # Темнеем камеру, если нокнуты
        execute as @a[scores={respawn_delay=6}] run camera @s fade time 0 0 10 color 20 3 3

    # Ресанье игрока
        execute as @a[has_property={arx:is_knocked=1..}, tag=!is_riding] at @s if entity @a[has_property={arx:is_knocked=0}, tag=is_sneaking, r=2.2, rm=0.001] run scoreboard players add @s revive_delay 1
        execute as @a[has_property={arx:is_knocked=1..}, tag=!is_riding] at @s if entity @a[has_property={arx:is_knocked=0}, tag=is_sneaking, r=2.2, rm=0.001, hasitem={item=arx:amul_revive, location=slot.armor.legs}] run scoreboard players add @s revive_delay 2

        execute as @a[has_property={arx:is_knocked=1..}] at @s unless entity @a[has_property={arx:is_knocked=0}, tag=is_sneaking, r=2.2, rm=0.001] run scoreboard players set @s revive_delay 0

        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=1}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=1}] run title @s actionbar §a█
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=2}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=2}] run title @s actionbar §a█ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=3}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=3}] run title @s actionbar §a█ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=4}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=4}] run title @s actionbar §a█ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=5}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=5}] run title @s actionbar §a█ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=6}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=6}] run title @s actionbar §a█ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=7}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=7}] run title @s actionbar §a█ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=8}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=8}] run title @s actionbar §a█ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=9}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=9}] run title @s actionbar §a█ █ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] at @s run title @a[tag=is_sneaking, r=2.2, rm=0.001] actionbar §a█ █ █ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] run title @s actionbar §a█ █ █ █ █ █ █ █ █ █
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10.., respawn_delay=1..}] at @s run tellraw @s { "rawtext": [ { "selector": "@a[has_property={arx:is_knocked=0}, tag=is_sneaking, r=2.2, rm=0.001]" }, { "text": " §aпомогает мне" } ] }
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10.., respawn_delay=1..}] at @s run scoreboard players add @s stress -1500
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10.., respawn_delay=0}] at @s run tellraw @s { "rawtext": [ { "selector": "@a[has_property={arx:is_knocked=0}, tag=is_sneaking, r=2.2, rm=0.001]" }, { "text": " §aпомогает мне. Притворяться вырубленным сейчас не выйдет" } ] }
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] at @s run tellraw @a[tag=is_sneaking, r=2.2, rm=0.001] { "rawtext": [ { "selector": "@s" }, { "text": " §aстановится лучше" } ] }
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] run camera @s fade time 0 0 5 color 20 3 3
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] run clear @s arx:slot_blocker
        execute as @a[has_property={arx:is_knocked=1..}, scores={revive_delay=10..}] run event entity @s arx:property_is_knockout_set_0

    # Обработка переменных (Должно быть последним в блоке "Нокаут")
        execute as @a run scoreboard players operation @s respawn_delay_history = @s respawn_delay
        scoreboard players add @a[scores={respawn_delay=1..}] respawn_delay -1

        tag @s remove __died_last_second__

    # Умираем по рп, если есть нужный тег
        execute as @a[tag=__force_to_rp_death__] at @s run function knockout_system/on_rp_death

#Верификация
    #Эффекты, если не верифицирован (verify=0)
        effect @a[scores={verify=0}] slowness 1 255 true
        title @a[scores={verify=0}] actionbar §a§lДождитесь верификации...
        camera @a[scores={verify=0}] fade time 0 2 0.2 color 40 50 40 