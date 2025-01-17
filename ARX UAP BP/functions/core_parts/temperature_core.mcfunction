# Этот код запускатеся 20 раз в секунду функцией core в NAP

# КОД СТОИТ ПЕРЕВЕСТИ НА ПОЛНЫЙ ТЕГОВЫЙ АНАЛИЗ!!!

#ТЕГИ МЕСТОНАХОЖДЕНИЯ
    tag @a remove underground
    event entity @a[tag=!is_dead] arx:test_underground

    tag @a remove in_snow_biome
    event entity @a[tag=!is_dead] arx:test_in_snow_biome

#АНАЛИЗ СТОЙКОСТЕЙ
    # sun_resistance - имеется стойкость к палящему солнцу
        tag @a remove sun_resistance
        tag @a[scores={hot_hold=1..}] add sun_resistance
        tag @a[scores={water_delay=1..}] add sun_resistance
        tag @a[tag=holding_umbrella] add sun_resistance
        tag @a[hasitem={item=arx:wide_hat, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:derek_hat, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:arabic_bandage, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:big_hat_dyed_blue, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:big_hat_dyed_white, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:big_hat_dyed_black, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:big_hat_dyed_red, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:big_hat, location=slot.armor.head}] add sun_resistance
        tag @a[hasitem={item=arx:desert_traders_hood, location=slot.armor.head}] add sun_resistance

    # warm_clothes - имеется стойкость к холоду, она же тёплая одежда. Дает доп перегрев в жарких локациях
        tag @a remove warm_clothes
        tag @a[hasitem={item=arx:stroller_clothes, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:wanderer_jacket, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:northerner_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:precursor_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:beryl_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:dwarf_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:black_jacket, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:archmage_robe, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:silver_samurai_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:snow_warrior_armor, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:baron_gambeson, location=slot.armor.chest}] add warm_clothes
        tag @a[hasitem={item=arx:snow_lord_armor, location=slot.armor.chest}] add warm_clothes

    # cold_resistance - тоже стойность к холоду, но полученная сторонним путем. НЕ дает доп перегрев
        tag @a remove cold_resistance
        tag @a[tag=warm_clothes] add cold_resistance
        tag @a[scores={class=1}] add cold_resistance
        tag @a[scores={freezing_hold=1..}] add cold_resistance
        tag @a[tag=in_e19] add cold_resistance
        tag @a[tag=blue_lake] add cold_resistance
        tag @a[tag=in_green_place_in_e19_sewer] add cold_resistance


#ЗАМЕРЗАНИЕ
    #Снятие замерзания
        scoreboard players add @a[scores={freezing=1..4}] freezing -1
        scoreboard players add @a[scores={freezing=5..}] freezing -5

    #Замерзание в снегах
        scoreboard players add @a[tag=in_snow_biome, tag=!cold_resistance, m=!spectator] freezing 6
    #Замерзание от призрака
        execute @a[scores={class=1}] ~ ~ ~ scoreboard players add @a[r=8, tag=!cold_resistance, tag=!at_respawn_room, m=!spectator] freezing 7
    #Замерзание в космосе
        scoreboard players add @a[tag=!cold_resistance, tag=in_space, m=!spectator] freezing 9
    #Замерзание в шахте
        # Тёплые локации
            tag @a[x=-216, y=33, z=325, dx=40, dy=20, dz=35] add in_warm_custom_location
        execute @a[tag=in_mines, tag=!cold_resistance, tag=!in_warm_custom_location, m=!spectator] ~ ~ ~ scoreboard players add @s freezing 6
        tag @a remove in_warm_custom_location

    #Урон при холоде
        execute @a[scores={verify=2, tick=20}] ~ ~ ~ damage @a[tag=!at_respawn_room, scores={freezing=1001..2400, custom_random=0..200}] 2 freezing

    #Титлы
        title @a[scores={freezing=2..200}] actionbar Đ §bВы замерзаете §fĐ
        title @a[scores={freezing=201..400}] actionbar ĐĐ §bВы замерзаете §fĐĐ
        title @a[scores={freezing=401..600}] actionbar ĐĐĐ §bВы замерзаете §fĐĐĐ
        title @a[scores={freezing=601..800}] actionbar ĐĐĐĐ §bВы замерзаете §fĐĐĐĐ
        title @a[scores={freezing=801..1000}] actionbar ĐĐĐĐĐ §bВы замерзаете §fĐĐĐĐĐ
        title @a[scores={freezing=1001..2400}] actionbar §fĐ §1Вы замёрзли §fĐ

#ПЕРЕГРЕВ
    #Снятие перегревания
        scoreboard players add @a[scores={freezing=-4..-1}] freezing 1
        scoreboard players add @a[scores={freezing=..-5}] freezing 5

    #Перегревание в пустыне/мезе из-за тёплой одежды
        scoreboard players add @a[tag=BIOME_desert, tag=warm_clothes, scores={is_day=1, hot_hold=0}, m=!spectator] freezing -7
        scoreboard players add @a[tag=BIOME_mesa, tag=warm_clothes, scores={is_day=1, hot_hold=0}, m=!spectator] freezing -6
    #Перегревание в пустыне/мезе из-за пекущего солнца
        scoreboard players add @a[tag=BIOME_desert, tag=!sun_resistance, tag=high_bright, tag=!underground, scores={is_day=1}, m=!spectator] freezing -6
        scoreboard players add @a[tag=BIOME_mesa, tag=!sun_resistance, tag=high_bright, tag=!underground, scores={is_day=1}, m=!spectator] freezing -6
    #Перегревание в глубинных шахтах
        scoreboard players add @a[tag=in_hot_deep, tag=warm_clothes, tag=!in_snow_biome, scores={hot_hold=0}, m=!spectator] freezing -7
    #Перегревание в аду
        tag @a[hasitem={item=arx:lamenite_plate_armor, location=slot.armor.chest}, tag=low_hp] add lamenite_plate_armor
        scoreboard players add @a[scores={hot_hold=0, water_delay=0}, tag=in_nether, tag=!lamenite_plate_armor, m=!spectator] freezing -7
        scoreboard players add @a[scores={hot_hold=0, water_delay=0}, tag=in_nether, tag=lamenite_plate_armor, m=!spectator] freezing -6
        tag @a remove lamenite_plate_armor
    #Урон при перегреве
        execute @a[scores={verify=2, tick=20}] ~ ~ ~ damage @a[tag=!at_respawn_room, scores={freezing=-2400..-1001, custom_random=0..200}] 2 fire
    #Титлы
        title @a[scores={freezing=-200..-2}] actionbar Ė §cВам жарко §fĖ
        title @a[scores={freezing=-400..-201}] actionbar ĖĖ §cВам жарко §fĖĖ
        title @a[scores={freezing=-600..-401}] actionbar ĖĖĖ §cВам жарко §fĖĖĖ
        title @a[scores={freezing=-800..-601}] actionbar ĖĖĖĖ §cВам жарко §fĖĖĖĖ
        title @a[scores={freezing=-1000..-801}] actionbar ĖĖĖĖĖ §cВам жарко §fĖĖĖĖĖ
        title @a[scores={freezing=-2400..-1001}] actionbar §fĖ §4Вам очень жарко §fĖ

#Дебаг значений температуры
    scoreboard players set @a[scores={freezing=..-2401}] freezing -2400 
    scoreboard players set @a[scores={freezing=2401..}] freezing 2400 