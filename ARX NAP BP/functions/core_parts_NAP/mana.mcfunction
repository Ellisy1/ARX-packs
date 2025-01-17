# Эта функция запускается каждый 1 такт
# Установка максимальной маны (mp_max)
    # База
        scoreboard players set @a mp_max 0
    # Консты
        execute as @a[scores={mp_const=1..}] run scoreboard players operation @s mp_max += @s mp_const
    # Одежда 
        scoreboard players add @a[hasitem={item=arx:piranha_amulet, location=slot.armor.legs}] mp_max 3
        scoreboard players add @a[hasitem={item=arx:ring_aluminum_sapphire, location=slot.armor.feet}] mp_max 1
        scoreboard players add @a[hasitem={item=arx:ring_gold_sapphire, location=slot.armor.feet}] mp_max 3
        scoreboard players add @a[hasitem={item=arx:ring_durasteel_sapphire, location=slot.armor.feet}] mp_max 5
        scoreboard players add @a[hasitem={item=arx:ring_caryite_sapphire, location=slot.armor.feet}] mp_max 10
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_sapphire, location=slot.armor.feet}] mp_max 15
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_sapphire, location=slot.armor.feet}] mp_max 20
        scoreboard players add @a[hasitem={item=arx:pallada_amul, location=slot.armor.legs}] mp_max 25
        scoreboard players add @a[hasitem={item=arx:apprentice_robe, location=slot.armor.chest}] mp_max 3
        scoreboard players add @a[hasitem={item=arx:armored_robe, location=slot.armor.chest}] mp_max 5
        scoreboard players add @a[hasitem={item=arx:royal_sorrel_flower, location=slot.armor.head}] mp_max 2
        scoreboard players add @a[hasitem={item=arx:gray_dress_of_the_forgotten_queen, location=slot.armor.chest}] mp_max 7
        scoreboard players add @a[hasitem={item=arx:vicious_staff_refined, location=slot.weapon.mainhand}] mp_max 8
        scoreboard players add @a[scores={religion=5}, hasitem={item=arx:archmage_robe, location=slot.armor.chest}] mp_max 10
        scoreboard players add @a[scores={religion=22}, hasitem={item=arx:necro_mantle, location=slot.armor.chest}] mp_max 10
        scoreboard players add @a[scores={religion=22}, hasitem={item=arx:necro_mantle_zel, location=slot.armor.chest}] mp_max 10
        scoreboard players add @a[scores={religion=5}, hasitem={item=arx:pallas_mage_mantle, location=slot.armor.chest}] mp_max 10
        scoreboard players add @a[scores={religion=15}, hasitem={item=arx:pires_mage_mantle, location=slot.armor.chest}] mp_max 10
        scoreboard players add @a[hasitem={item=arx:marchs_wreath, location=slot.armor.head}] mp_max 8
    # Религия
        scoreboard players add @a[scores={religion=2..9}] mp_max 5
        scoreboard players add @a[scores={religion=12..29}] mp_max 5
        scoreboard players add @a[scores={religion=4..5}] mp_max 10
        scoreboard players add @a[scores={religion=14..15}] mp_max 10
        scoreboard players add @a[scores={religion=21..22}] mp_max 15
    # Призрак
        scoreboard players add @a[scores={class=1}] mp_max 15
    # Навыки
        scoreboard players add @a[scores={sk_a_21=1}] mp_max 5
        scoreboard players add @a[scores={sk_c_10=1}] mp_max 5
        scoreboard players add @a[scores={sk_c_11=1}] mp_max 5
        scoreboard players add @a[scores={sk_d_4=1}] mp_max 15
    # Черты
        scoreboard players add @a[scores={c_stupid=1..}] mp_max -5
        scoreboard players add @a[scores={c_seen_death=1..}] mp_max 5
        scoreboard players add @a[scores={c_enlightened=1..}] mp_max 5
        scoreboard players add @a[scores={c_bright_look=1..}] mp_max 5
    # Прокач в магию
        scoreboard players add @a[scores={magic_skill=1}] mp_max 10
        scoreboard players add @a[scores={magic_skill=2}] mp_max 20
        scoreboard players add @a[scores={magic_skill=3}] mp_max 30
        scoreboard players add @a[scores={magic_skill=4}] mp_max 40
        scoreboard players add @a[scores={magic_skill=5}] mp_max 50
        scoreboard players add @a[scores={magic_skill=6}] mp_max 60
    # Амулет звёздной силы
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower = @s heavy_compens
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower *= @p[scores={verify=2}] const_1500
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower /= @p[scores={verify=2}] const_1000

        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_max += @s mp_boost_by_amul_of_starpower
    # Если макс мана отрицательная
        scoreboard players set @a[scores={mp_max=..-1}] mp_max 0


# Установка длительности восстановления очка маны (regen_mp)
    # База
        scoreboard players set @a regen_mp 30
    # Одежда
        scoreboard players add @a[hasitem={item=arx:ring_gold_amethyst, location=slot.armor.feet}] regen_mp -1
        scoreboard players add @a[hasitem={item=arx:ring_durasteel_amethyst, location=slot.armor.feet}] regen_mp -2
        scoreboard players add @a[hasitem={item=arx:ring_caryite_amethyst, location=slot.armor.feet}] regen_mp -3
        scoreboard players add @a[hasitem={item=arx:ring_malafiotironite_amethyst, location=slot.armor.feet}] regen_mp -4
        scoreboard players add @a[hasitem={item=arx:ring_lamenite_amethyst, location=slot.armor.feet}] regen_mp -6
        scoreboard players add @a[hasitem={item=arx:pallada_amul, location=slot.armor.legs}] regen_mp -8
        scoreboard players add @a[hasitem={item=arx:vicious_staff_refined, location=slot.weapon.mainhand}] regen_mp -3
        scoreboard players add @a[scores={religion=5}, hasitem={item=arx:archmage_robe, location=slot.armor.chest}] regen_mp -4
        scoreboard players add @a[hasitem={item=arx:diadem_of_the_forgotten_queen, location=slot.armor.head}] regen_mp -2
    # Религия
        scoreboard players add @a[scores={religion=4..5}] regen_mp -2
        scoreboard players add @a[scores={religion=14..15}] regen_mp -2
        scoreboard players add @a[scores={religion=21..22}] regen_mp -4
    # Зелья
        scoreboard players add @a[scores={poit_mp_reg=1..}] regen_mp -2
    # Черты
        scoreboard players add @a[scores={c_wise=1..}] regen_mp -1
        scoreboard players add @a[scores={c_paranoid=1..}] regen_mp 2
        scoreboard players add @a[scores={c_seen_death=1..}] regen_mp -2
    # Навыки
        scoreboard players add @a[scores={sk_c_12=1}] regen_mp -2
        scoreboard players add @a[scores={sk_c_13=1}] regen_mp -2
        scoreboard players add @a[scores={sk_d_4=1}] regen_mp -3
    # Счастье
        scoreboard players add @a[scores={stress_cond=2}] regen_mp 5
        scoreboard players add @a[scores={stress_cond=3}] regen_mp 10
        scoreboard players add @a[scores={stress_cond=4}] regen_mp 20
        scoreboard players add @a[scores={stress_cond=-2}] regen_mp -1
        scoreboard players add @a[scores={stress_cond=-3}] regen_mp -3
        scoreboard players add @a[scores={stress_cond=-4}] regen_mp -5
    # Прокач в магию
        execute as @a run scoreboard players operation @s regen_mp -= @s magic_skill
        execute as @a run scoreboard players operation @s regen_mp -= @s magic_skill
        execute as @a run scoreboard players operation @s regen_mp -= @s magic_skill
        execute as @a run scoreboard players operation @s regen_mp -= @s magic_skill

    # Могущество
        scoreboard players add @a[scores={might_skill=1}] regen_mp -2
        scoreboard players add @a[scores={might_skill=2}] regen_mp -5
        scoreboard players add @a[scores={might_skill=3}] regen_mp -7
        scoreboard players add @a[scores={might_skill=4}] regen_mp -10
        scoreboard players add @a[scores={might_skill=5}] regen_mp -12
        scoreboard players add @a[scores={might_skill=6}] regen_mp -15

    # Амулет звёздной силы
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower = @s heavy_compens
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower *= @p[scores={verify=2}] const_300
        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s mp_boost_by_amul_of_starpower /= @p[scores={verify=2}] const_1000

        execute as @a[hasitem={item=arx:amul_of_starpower, location=slot.armor.legs}] run scoreboard players operation @s regen_mp -= @s mp_boost_by_amul_of_starpower

    # Вычисляем увеличение количества регенерируемых очков в сек. (mp_regeneration_amplification)
        # Задаем значение регерерации маны. Далее адаптируем.
            execute as @a run scoreboard players operation @s mp_regeneration_amplification = @s regen_mp 
            # Нормализуем. Так как скорость регенерации маны в 0 уже является срезаемой, то надо вычесть 2 чтобы всё считалось правильно
                scoreboard players add @a mp_regeneration_amplification -2
            # Оборачиваем отриц. значение в положительное
                execute as @a run scoreboard players operation @s mp_regeneration_amplification *= @p[scores={verify=2}] const_-1
        # Если реген маны больше 0с, то ставим 1 (стандартная регенерация)
            scoreboard players set @a[scores={regen_mp=1..}] mp_regeneration_amplification 1


    # Если реген маны равен 0 или ниже, выставляем его в значение 1
        execute as @a[scores={regen_mp=..0}] run scoreboard players set @s regen_mp 1

# mp_delay - фактическая задержка до регенерации одного очка маны. Она уменьшается каждую сек. и возобновляется, когда доходит до 0.
# Начало нового цикла отката одного очка маны (добавляем 1мп и устанавливаем счётчик). Начнется только если мана не максимальна и прошлый цикл закончился.
    execute as @a[scores={mp_delay=..0}, tag=!mp_was_equal_to_max_mp_last_pass] if score @s mp < @s mp_max run scoreboard players operation @s mp += @s mp_regeneration_amplification
    execute as @a[scores={mp_delay=..0}] if score @s mp < @s mp_max run scoreboard players operation @s mp_delay = @s regen_mp

# Вычет mp_delay каждую секунду
    execute if entity @a[scores={verify=2, tick=20}] as @a[scores={mp_delay=1..}] run scoreboard players add @s mp_delay -1

# Если мана внеочередно достигла макимальной, сбрасываем откат маны
    execute as @a unless score @s mp < @s mp_max run scoreboard players set @s mp_delay 0

# Плавное накопление маны с зелий
    scoreboard players add @a[scores={mp_tray=1.., regen_mp=..1000}] mp 1
    scoreboard players add @a[scores={mp_tray=1..}] mp_tray -1
    scoreboard players set @a[scores={mp_tray=..-1}] mp_tray 0

# Ошибки маны по кол-ву
    # Мана превышает макс. ману
        execute as @a if score @s mp > @s mp_max run scoreboard players operation @s mp = @s mp_max
    # Мана ниже 0
        scoreboard players set @a[scores={mp=..-1}] mp 0

# Сообщения о мане
    function core_parts_NAP/mp_actionbar_title

# Определяем, была ли мана равна макс мане и загоняем это в отдельную переменную. Это требуется для точного анализа предыдущего цикла регенерации маны.
    tag @a remove mp_was_equal_to_max_mp_last_pass
    execute as @a if score @s mp = @s mp_max run tag @s add mp_was_equal_to_max_mp_last_pass