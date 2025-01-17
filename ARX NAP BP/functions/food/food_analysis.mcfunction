# Получаем переменные ОТ ЕДЫ: 
# scores 0..100 t_f_spicy, t_f_salty, t_f_sweet, t_f_sour, t_f_exotic (конкретные вкусы конкретной еды. если какое-то значение 0, в файле еды его можно не указывать)
# tag tt_f_herbal, tt_f_meat, tt_f_fish, tt_f_bread, tt_f_lactic (теги о типе еды)

# food_tray_stress - показатель отношения к типу пищи
# food_tray_prime - показатель отношения к отдельным вкусам


# Отчитываемся, если есть тег о показе пищи
    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "§6=====§aПодробные данные еды:§6=====" } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "§aОбъективная вкусность (0 - 100): §d" }, { "score": {"name": "@s", "objective": "t_f_deliciousness" } } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": " " } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "§6§lТипы пищи:" } ] }
    tellraw @s[tag=show_full_food_data, tag=tt_f_herbal] { "rawtext": [ { "text": "> §aТравяное" } ] }
    tellraw @s[tag=show_full_food_data, tag=tt_f_meat] { "rawtext": [ { "text": "> §aМясное" } ] }
    tellraw @s[tag=show_full_food_data, tag=tt_f_fish] { "rawtext": [ { "text": "> §aРыбное" } ] }
    tellraw @s[tag=show_full_food_data, tag=tt_f_bread] { "rawtext": [ { "text": "> §aХлебное" } ] }
    tellraw @s[tag=show_full_food_data, tag=tt_f_lactic] { "rawtext": [ { "text": "> §aМолочное" } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "§6§lВкусы пищи:" } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "> §aОстрое: §d" }, { "score": {"name": "@s", "objective": "t_f_spicy" } } ] }
    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "> §aСоленое: §d" }, { "score": {"name": "@s", "objective": "t_f_salty" } } ] }
    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "> §aСладкое: §d" }, { "score": {"name": "@s", "objective": "t_f_sweet" } } ] }
    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "> §aКислое: §d" }, { "score": {"name": "@s", "objective": "t_f_sour" } } ] }
    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "> §aЭкзотическое: §d" }, { "score": {"name": "@s", "objective": "t_f_exotic" } } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": " " } ] }

    tellraw @s[tag=show_full_food_data, tag=tt_f_perfect] { "rawtext": [ { "text": "§eЕда идеальная (приготовленная с §cC навыком готовки§e)" } ] }
    tellraw @s[tag=show_full_food_data, tag=!tt_f_perfect] { "rawtext": [ { "text": "§eЕда НЕ идеальная (приготовленная без §cC навыка готовки§e)" } ] }

    tellraw @s[tag=show_full_food_data, tag=is_solid_food] { "rawtext": [ { "text": "§bИспользуется анимация твёрдой пищи" } ] }
    tellraw @s[tag=show_full_food_data, tag=is_liquid_food] { "rawtext": [ { "text": "§bИспользуется анимация напитка" } ] }
    tellraw @s[tag=show_full_food_data, tag=is_soup] { "rawtext": [ { "text": "§bИспользуется анимация супа" } ] }

    tellraw @s[tag=show_full_food_data] { "rawtext": [ { "text": "§6==========" } ] }

# Смотрим, что сказать персонажу, исходя из вкусов еды
    tellraw @s[tag=tt_f_herbal, scores={t_herbal=..-31}] { "rawtext": [ { "text": "§cМне не нравится растительное!" } ] }
    tellraw @s[tag=tt_f_meat, scores={t_meat=..-31}] { "rawtext": [ { "text": "§cМне не нравится мясное!" } ] }
    tellraw @s[tag=tt_f_fish, scores={t_fish=..-31}] { "rawtext": [ { "text": "§cМне не нравится рыба!" } ] }
    tellraw @s[tag=tt_f_bread, scores={t_bread=..-31}] { "rawtext": [ { "text": "§cМне не нравится мучное!" } ] }
    tellraw @s[tag=tt_f_lactic, scores={t_lactic=..-31}] { "rawtext": [ { "text": "§cМне не нравится молочное!" } ] }


# Прибавляем отношение к типу пищи. Оно поставляется просто тегом, при чем тега может быть два или больше, так же может не быть вообще.
# Когда мы едим, например, мясо, к итоговой вкусности добавляется наше отношение к мясу, которое в норме должно быть от -100 до 100.

    # Высчитываем, сколько дано типов еды
        scoreboard players set @s food_count_taste_types 0
        scoreboard players add @s[tag=tt_f_herbal] food_count_taste_types 1
        scoreboard players add @s[tag=tt_f_meat] food_count_taste_types 1
        scoreboard players add @s[tag=tt_f_fish] food_count_taste_types 1
        scoreboard players add @s[tag=tt_f_bread] food_count_taste_types 1
        scoreboard players add @s[tag=tt_f_lactic] food_count_taste_types 1
    
    # Сам рассчет вкусности, опираясь на типы еды
        execute as @s[tag=tt_f_herbal] run scoreboard players operation @s food_tray_stress += @s t_herbal
        execute as @s[tag=tt_f_meat] run scoreboard players operation @s food_tray_stress += @s t_meat
        execute as @s[tag=tt_f_fish] run scoreboard players operation @s food_tray_stress += @s t_fish
        execute as @s[tag=tt_f_bread] run scoreboard players operation @s food_tray_stress += @s t_bread
        execute as @s[tag=tt_f_lactic] run scoreboard players operation @s food_tray_stress += @s t_lactic

    # Нормализуем значение зависимо от кол-ва указанных типов еды
        execute as @s[scores={food_count_taste_types=1}] run scoreboard players operation @s food_tray_stress *= @a[scores={verify=2}] const_10
        execute as @s[scores={food_count_taste_types=2}] run scoreboard players operation @s food_tray_stress *= @a[scores={verify=2}] const_5
        execute as @s[scores={food_count_taste_types=3}] run scoreboard players operation @s food_tray_stress *= @a[scores={verify=2}] const_3
        execute as @s[scores={food_count_taste_types=4}] run scoreboard players operation @s food_tray_stress *= @a[scores={verify=2}] const_2

        execute as @s[scores={food_count_taste_types=!1..4}] run tellraw @s { "rawtext": [ { "text": "§cНекорректный тип пищи, пожалуйста, отчитайтесь об этом как об ошибке" } ] }
        execute as @s[scores={food_count_taste_types=!1..4}] run tellraw @a[scores={verify=2}] { "rawtext": [ { "text": "§cНекорректный тип пищи у " }, { "selector": "@s" } ] }

# tellraw @s { "rawtext": [ { "text": "Перечисленно аргументов типа еды [food_count_taste_types] §a" }, { "score": {"name": "@s", "objective": "food_count_taste_types" } } ] }

# tellraw @s { "rawtext": [ { "text": "Прибавка к счастью по типу пищи (§6травяное, мясное, рыбное, хлебное, молочное§f) [food_tray_stress] §a" }, { "score": {"name": "@s", "objective": "food_tray_stress" } } ] }



# Перемножаем вкус еды на наш вкус.
# Когда мы едим острый кусок мяса, его значение остроты перемножается с нашим отношением к острому. Так происходит с каждым отдельным вкусом.

    scoreboard players operation @s t_f_spicy *= @s t_spicy
    scoreboard players operation @s food_tray_prime += @s t_f_spicy

    scoreboard players operation @s t_f_salty *= @s t_salty
    scoreboard players operation @s food_tray_prime += @s t_f_salty

    scoreboard players operation @s t_f_sweet *= @s t_sweet
    scoreboard players operation @s food_tray_prime += @s t_f_sweet

    scoreboard players operation @s t_f_sour *= @s t_sour
    scoreboard players operation @s food_tray_prime += @s t_f_sour

    scoreboard players operation @s t_f_exotic *= @s t_exotic
    scoreboard players operation @s food_tray_prime += @s t_f_exotic

    scoreboard players operation @s food_tray_prime /= @a[scores={verify=2}] const_10

# tellraw @s { "rawtext": [ { "text": "Прибавка к счастью по отдельным вкусам (§6острое, соленое, сладкое, кислое, экзотич.§f) [food_tray_prime] §a" }, { "score": {"name": "@s", "objective": "food_tray_prime" } } ] }



# Складываем food_tray_stress и food_tray_prime
    scoreboard players operation @s food_tray_stress += @s food_tray_prime

# tellraw @s { "rawtext": [ { "text": "Складываем полученные выше значения [food_tray_stress] §a" }, { "score": {"name": "@s", "objective": "food_tray_stress" } } ] }



#Если еда идеальная
    #Если вкусно (домножаем на 1.5)
        execute as @s[tag=tt_f_perfect, scores={food_tray_stress=0..}] run scoreboard players operation @s food_tray_stress *= @a[scores={verify=2}] const_1500
        execute as @s[tag=tt_f_perfect, scores={food_tray_stress=0..}] run scoreboard players operation @s food_tray_stress /= @a[scores={verify=2}] const_1000

    #Если невкусно (добавляем немного к вкусности)
        execute as @s[tag=tt_f_perfect, scores={food_tray_stress=..-1}] run scoreboard players add @s food_tray_stress 100
#

# tellraw @s { "rawtext": [ { "text": "Увеличиваем вкусность, если еда идеальная [food_tray_stress] §a" }, { "score": {"name": "@s", "objective": "food_tray_stress" } } ] }



# Объективная вкусность
    # Корректируем переменную t_f_deliciousness. Нам надо чтобы она была в 10 раз больше текущего
        scoreboard players add @s t_f_deliciousness -42
        scoreboard players operation @s t_f_deliciousness *= @a[scores={verify=2}] const_10

    #Считаем
        scoreboard players operation @s food_tray_stress += @s t_f_deliciousness
#

# tellraw @s { "rawtext": [ { "text": "Добавляем к высчитанному ранее вкусу (объективную вкусность данной еды * 10) [food_tray_stress] §a" }, { "score": {"name": "@s", "objective": "food_tray_stress" } } ] }



#Если черта привередливый (-0.2 счастья)
    scoreboard players add @s[scores={c_fastidious=1..}] food_tray_stress -200


# tellraw @s { "rawtext": [ { "text": "§6ИТОГОВОЕ ЗНАЧЕНИЕ [food_tray_stress] §a" }, { "score": {"name": "@s", "objective": "food_tray_stress" } } ] }



#вывод прибавки к счастью
    # -
        tellraw @s[scores={food_tray_stress=..-401}] { "rawtext": [ { "text": "§cНевкусно!" } ] }

        tellraw @s[scores={food_tray_stress=..-9801}] { "rawtext": [ { "text": "§c§l-9.9 или более ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9800..-9701}] { "rawtext": [ { "text": "§c§l-9.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9700..-9601}] { "rawtext": [ { "text": "§c§l-9.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9600..-9501}] { "rawtext": [ { "text": "§c§l-9.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9500..-9401}] { "rawtext": [ { "text": "§c§l-9.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9400..-9301}] { "rawtext": [ { "text": "§c§l-9.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9300..-9201}] { "rawtext": [ { "text": "§c§l-9.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9200..-9101}] { "rawtext": [ { "text": "§c§l-9.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9100..-9001}] { "rawtext": [ { "text": "§c§l-9.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-9000..-8901}] { "rawtext": [ { "text": "§c§l-9.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8900..-8801}] { "rawtext": [ { "text": "§c§l-8.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8800..-8701}] { "rawtext": [ { "text": "§c§l-8.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8700..-8601}] { "rawtext": [ { "text": "§c§l-8.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8600..-8501}] { "rawtext": [ { "text": "§c§l-8.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8500..-8401}] { "rawtext": [ { "text": "§c§l-8.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8400..-8301}] { "rawtext": [ { "text": "§c§l-8.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8300..-8201}] { "rawtext": [ { "text": "§c§l-8.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8200..-8101}] { "rawtext": [ { "text": "§c§l-8.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8100..-8001}] { "rawtext": [ { "text": "§c§l-8.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-8000..-7901}] { "rawtext": [ { "text": "§c§l-8.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7900..-7801}] { "rawtext": [ { "text": "§c§l-7.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7800..-7701}] { "rawtext": [ { "text": "§c§l-7.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7700..-7601}] { "rawtext": [ { "text": "§c§l-7.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7600..-7501}] { "rawtext": [ { "text": "§c§l-7.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7500..-7401}] { "rawtext": [ { "text": "§c§l-7.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7400..-7301}] { "rawtext": [ { "text": "§c§l-7.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7300..-7201}] { "rawtext": [ { "text": "§c§l-7.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7200..-7101}] { "rawtext": [ { "text": "§c§l-7.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7100..-7001}] { "rawtext": [ { "text": "§c§l-7.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-7000..-6901}] { "rawtext": [ { "text": "§c§l-7.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6900..-6801}] { "rawtext": [ { "text": "§c§l-6.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6800..-6701}] { "rawtext": [ { "text": "§c§l-6.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6700..-6601}] { "rawtext": [ { "text": "§c§l-6.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6600..-6501}] { "rawtext": [ { "text": "§c§l-6.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6500..-6401}] { "rawtext": [ { "text": "§c§l-6.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6400..-6301}] { "rawtext": [ { "text": "§c§l-6.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6300..-6201}] { "rawtext": [ { "text": "§c§l-6.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6200..-6101}] { "rawtext": [ { "text": "§c§l-6.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6100..-6001}] { "rawtext": [ { "text": "§c§l-6.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-6000..-5901}] { "rawtext": [ { "text": "§c§l-6.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5900..-5801}] { "rawtext": [ { "text": "§c§l-5.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5800..-5701}] { "rawtext": [ { "text": "§c§l-5.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5700..-5601}] { "rawtext": [ { "text": "§c§l-5.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5600..-5501}] { "rawtext": [ { "text": "§c§l-5.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5500..-5401}] { "rawtext": [ { "text": "§c§l-5.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5400..-5301}] { "rawtext": [ { "text": "§c§l-5.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5300..-5201}] { "rawtext": [ { "text": "§c§l-5.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5200..-5101}] { "rawtext": [ { "text": "§c§l-5.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5100..-5001}] { "rawtext": [ { "text": "§c§l-5.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-5000..-4901}] { "rawtext": [ { "text": "§c§l-5.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4900..-4801}] { "rawtext": [ { "text": "§c§l-4.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4800..-4701}] { "rawtext": [ { "text": "§c§l-4.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4700..-4601}] { "rawtext": [ { "text": "§c§l-4.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4600..-4501}] { "rawtext": [ { "text": "§c§l-4.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4500..-4401}] { "rawtext": [ { "text": "§c§l-4.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4400..-4301}] { "rawtext": [ { "text": "§c§l-4.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4300..-4201}] { "rawtext": [ { "text": "§c§l-4.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4200..-4101}] { "rawtext": [ { "text": "§c§l-4.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4100..-4001}] { "rawtext": [ { "text": "§c§l-4.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-4000..-3901}] { "rawtext": [ { "text": "§c§l-4.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3900..-3801}] { "rawtext": [ { "text": "§c§l-3.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3800..-3701}] { "rawtext": [ { "text": "§c§l-3.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3700..-3601}] { "rawtext": [ { "text": "§c§l-3.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3600..-3501}] { "rawtext": [ { "text": "§c§l-3.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3500..-3401}] { "rawtext": [ { "text": "§c§l-3.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3400..-3301}] { "rawtext": [ { "text": "§c§l-3.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3300..-3201}] { "rawtext": [ { "text": "§c§l-3.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3200..-3101}] { "rawtext": [ { "text": "§c§l-3.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3100..-3001}] { "rawtext": [ { "text": "§c§l-3.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-3000..-2901}] { "rawtext": [ { "text": "§c§l-3.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2900..-2801}] { "rawtext": [ { "text": "§c§l-2.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2800..-2701}] { "rawtext": [ { "text": "§c§l-2.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2700..-2601}] { "rawtext": [ { "text": "§c§l-2.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2600..-2501}] { "rawtext": [ { "text": "§c§l-2.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2500..-2401}] { "rawtext": [ { "text": "§c§l-2.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2400..-2301}] { "rawtext": [ { "text": "§c§l-2.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2300..-2201}] { "rawtext": [ { "text": "§c§l-2.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2200..-2101}] { "rawtext": [ { "text": "§c§l-2.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2100..-2001}] { "rawtext": [ { "text": "§c§l-2.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-2000..-1901}] { "rawtext": [ { "text": "§c§l-2.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1900..-1801}] { "rawtext": [ { "text": "§c§l-1.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1800..-1701}] { "rawtext": [ { "text": "§c§l-1.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1700..-1601}] { "rawtext": [ { "text": "§c§l-1.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1600..-1501}] { "rawtext": [ { "text": "§c§l-1.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1500..-1401}] { "rawtext": [ { "text": "§c§l-1.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1400..-1301}] { "rawtext": [ { "text": "§c§l-1.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1300..-1201}] { "rawtext": [ { "text": "§c§l-1.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1200..-1101}] { "rawtext": [ { "text": "§c§l-1.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1100..-1001}] { "rawtext": [ { "text": "§c§l-1.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-1000..-901}] { "rawtext": [ { "text": "§c§l-1.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-900..-801}] { "rawtext": [ { "text": "§c§l-0.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-800..-701}] { "rawtext": [ { "text": "§c§l-0.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-700..-601}] { "rawtext": [ { "text": "§c§l-0.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-600..-501}] { "rawtext": [ { "text": "§c§l-0.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-500..-401}] { "rawtext": [ { "text": "§c§l-0.5 ур. счастья" } ] }

    # 0
        tellraw @s[scores={food_tray_stress=-400..400}] { "rawtext": [ { "text": "§eНормально" } ] }

        tellraw @s[scores={food_tray_stress=-400..-301}] { "rawtext": [ { "text": "§e§l-0.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-300..-201}] { "rawtext": [ { "text": "§e§l-0.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-200..-101}] { "rawtext": [ { "text": "§e§l-0.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=-100..-1}] { "rawtext": [ { "text": "§e§l-0.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=0..100}] { "rawtext": [ { "text": "§e§l+0.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=101..200}] { "rawtext": [ { "text": "§e§l+0.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=201..300}] { "rawtext": [ { "text": "§e§l+0.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=301..400}] { "rawtext": [ { "text": "§e§l+0.4 ур. счастья" } ] }

    # +
        tellraw @s[scores={food_tray_stress=401..}] { "rawtext": [ { "text": "§aВкусно!" } ] }

        tellraw @s[scores={food_tray_stress=401..500}] { "rawtext": [ { "text": "§a§l+0.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=501..600}] { "rawtext": [ { "text": "§a§l+0.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=601..700}] { "rawtext": [ { "text": "§a§l+0.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=701..800}] { "rawtext": [ { "text": "§a§l+0.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=801..900}] { "rawtext": [ { "text": "§a§l+0.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=901..1000}] { "rawtext": [ { "text": "§a§l+1.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1001..1100}] { "rawtext": [ { "text": "§a§l+1.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1101..1200}] { "rawtext": [ { "text": "§a§l+1.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1201..1300}] { "rawtext": [ { "text": "§a§l+1.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1301..1400}] { "rawtext": [ { "text": "§a§l+1.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1401..1500}] { "rawtext": [ { "text": "§a§l+1.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1501..1600}] { "rawtext": [ { "text": "§a§l+1.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1601..1700}] { "rawtext": [ { "text": "§a§l+1.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1701..1800}] { "rawtext": [ { "text": "§a§l+1.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1801..1900}] { "rawtext": [ { "text": "§a§l+1.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=1901..2000}] { "rawtext": [ { "text": "§a§l+2.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2001..2100}] { "rawtext": [ { "text": "§a§l+2.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2101..2200}] { "rawtext": [ { "text": "§a§l+2.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2201..2300}] { "rawtext": [ { "text": "§a§l+2.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2301..2400}] { "rawtext": [ { "text": "§a§l+2.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2401..2500}] { "rawtext": [ { "text": "§a§l+2.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2501..2600}] { "rawtext": [ { "text": "§a§l+2.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2601..2700}] { "rawtext": [ { "text": "§a§l+2.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2701..2800}] { "rawtext": [ { "text": "§a§l+2.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2801..2900}] { "rawtext": [ { "text": "§a§l+2.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=2901..3000}] { "rawtext": [ { "text": "§a§l+3.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3001..3100}] { "rawtext": [ { "text": "§a§l+3.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3101..3200}] { "rawtext": [ { "text": "§a§l+3.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3201..3300}] { "rawtext": [ { "text": "§a§l+3.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3301..3400}] { "rawtext": [ { "text": "§a§l+3.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3401..3500}] { "rawtext": [ { "text": "§a§l+3.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3501..3600}] { "rawtext": [ { "text": "§a§l+3.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3601..3700}] { "rawtext": [ { "text": "§a§l+3.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3701..3800}] { "rawtext": [ { "text": "§a§l+3.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3801..3900}] { "rawtext": [ { "text": "§a§l+3.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=3901..4000}] { "rawtext": [ { "text": "§a§l+4.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4001..4100}] { "rawtext": [ { "text": "§a§l+4.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4101..4200}] { "rawtext": [ { "text": "§a§l+4.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4201..4300}] { "rawtext": [ { "text": "§a§l+4.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4301..4400}] { "rawtext": [ { "text": "§a§l+4.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4401..4500}] { "rawtext": [ { "text": "§a§l+4.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4501..4600}] { "rawtext": [ { "text": "§a§l+4.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4601..4700}] { "rawtext": [ { "text": "§a§l+4.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4701..4800}] { "rawtext": [ { "text": "§a§l+4.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4801..4900}] { "rawtext": [ { "text": "§a§l+4.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=4901..5000}] { "rawtext": [ { "text": "§a§l+5.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5001..5100}] { "rawtext": [ { "text": "§a§l+5.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5101..5200}] { "rawtext": [ { "text": "§a§l+5.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5201..5300}] { "rawtext": [ { "text": "§a§l+5.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5301..5400}] { "rawtext": [ { "text": "§a§l+5.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5401..5500}] { "rawtext": [ { "text": "§a§l+5.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5501..5600}] { "rawtext": [ { "text": "§a§l+5.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5601..5700}] { "rawtext": [ { "text": "§a§l+5.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5701..5800}] { "rawtext": [ { "text": "§a§l+5.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5801..5900}] { "rawtext": [ { "text": "§a§l+5.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=5901..6000}] { "rawtext": [ { "text": "§a§l+6.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6001..6100}] { "rawtext": [ { "text": "§a§l+6.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6101..6200}] { "rawtext": [ { "text": "§a§l+6.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6201..6300}] { "rawtext": [ { "text": "§a§l+6.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6301..6400}] { "rawtext": [ { "text": "§a§l+6.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6401..6500}] { "rawtext": [ { "text": "§a§l+6.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6501..6600}] { "rawtext": [ { "text": "§a§l+6.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6601..6700}] { "rawtext": [ { "text": "§a§l+6.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6701..6800}] { "rawtext": [ { "text": "§a§l+6.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6801..6900}] { "rawtext": [ { "text": "§a§l+6.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=6901..7000}] { "rawtext": [ { "text": "§a§l+7.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7001..7100}] { "rawtext": [ { "text": "§a§l+7.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7101..7200}] { "rawtext": [ { "text": "§a§l+7.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7201..7300}] { "rawtext": [ { "text": "§a§l+7.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7301..7400}] { "rawtext": [ { "text": "§a§l+7.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7401..7500}] { "rawtext": [ { "text": "§a§l+7.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7501..7600}] { "rawtext": [ { "text": "§a§l+7.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7601..7700}] { "rawtext": [ { "text": "§a§l+7.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7701..7800}] { "rawtext": [ { "text": "§a§l+7.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7801..7900}] { "rawtext": [ { "text": "§a§l+7.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=7901..8000}] { "rawtext": [ { "text": "§a§l+8.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8001..8100}] { "rawtext": [ { "text": "§a§l+8.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8101..8200}] { "rawtext": [ { "text": "§a§l+8.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8201..8300}] { "rawtext": [ { "text": "§a§l+8.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8301..8400}] { "rawtext": [ { "text": "§a§l+8.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8401..8500}] { "rawtext": [ { "text": "§a§l+8.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8501..8600}] { "rawtext": [ { "text": "§a§l+8.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8601..8700}] { "rawtext": [ { "text": "§a§l+8.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8701..8800}] { "rawtext": [ { "text": "§a§l+8.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8801..8900}] { "rawtext": [ { "text": "§a§l+8.9 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=8901..9000}] { "rawtext": [ { "text": "§a§l+9.0 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9001..9100}] { "rawtext": [ { "text": "§a§l+9.1 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9101..9200}] { "rawtext": [ { "text": "§a§l+9.2 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9201..9300}] { "rawtext": [ { "text": "§a§l+9.3 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9301..9400}] { "rawtext": [ { "text": "§a§l+9.4 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9401..9500}] { "rawtext": [ { "text": "§a§l+9.5 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9501..9600}] { "rawtext": [ { "text": "§a§l+9.6 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9601..9700}] { "rawtext": [ { "text": "§a§l+9.7 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9701..9800}] { "rawtext": [ { "text": "§a§l+9.8 ур. счастья" } ] }
        tellraw @s[scores={food_tray_stress=9801..}] { "rawtext": [ { "text": "§a§l+9.9 или более ур. счастья" } ] }

        execute as @s[scores={food_tray_stress=..-401, custom_random=0..500}] run function actions/cough

#Регенерация, если вкусно
    effect @s[scores={food_tray_stress=400..599}] regeneration 5 0
    effect @s[scores={food_tray_stress=600..799}] regeneration 10 0
    effect @s[scores={food_tray_stress=800..999}] regeneration 5 1
    effect @s[scores={food_tray_stress=1000..1499}] regeneration 10 1
    effect @s[scores={food_tray_stress=1500..}] regeneration 5 2

#прибавка к счастью
    scoreboard players operation @s stress -= @s food_tray_stress

    scoreboard players operation @s poisoning += @s t_f_poisoning