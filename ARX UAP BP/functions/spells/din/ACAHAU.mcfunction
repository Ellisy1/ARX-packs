#Анализ доступности
    scoreboard players set @s mp_req 45

    tag @p[tag=self, tag=staff_din] add drop_cost_with_staff
    tag @p[tag=self, scores={religion=22}] add drop_cost_with_religion

    function spells/operations/drop_spell_cost
    function spells/operations/check_mp_spell_availability

#Заклинание
    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ scoreboard players set @s item_control 0

    # Оружие
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:costorub}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Интересный меч. Чудесно подходит для того, чтобы рубить кости. По преданиям, это первая модель меча, которую создали перворождённые боги."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:costorub}] ~ ~ ~ scoreboard players set @s item_control 1
    
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:staff_golden_cross}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Посох-крест. Такие посохи обычно используются в ритуальных целях, при чём преимущественно верующими в Пиреса. Этот посох выл изготовлен в Сансареа и украден одним стражником-дезертиром."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:staff_golden_cross}] ~ ~ ~ scoreboard players set @s item_control 1

    # Одежда
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:archmage_robe}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Магическая мантия. В прошлом принадлежала магу Ксарту, который наделил её массой эффективных свойств. Впрочем, он ей почти не пользовался, так как отказался от веры в Палласа и стал некромантом."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:archmage_robe}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:hu_tao_hat}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Данная шляпа принадлежала владелице похоронного бюро Ху Тао из Тейвата, Ли Юэ. Как оно попало в мир Аркса, до сих пор остается загадкой."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:hu_tao_hat}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:descriptor}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Изобретение древних. Если подключить питание, то это устройство сможет расшифровывать тексты и переводить их на разные языки. Таких было выпущенно не особо много, так как специальное устройство для расшифровки было не совсем разумным: почти все переводили через смартфон и такое устройство было нужно разве что для профессиональных переводчиков, которые переводят за день невероятные объемы текста невероятно качественно."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:descriptor}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:night_vision_device}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Прибор модулируемого ночного видения древних. Примечательно, что это не обычная модель, а профессиональная исследовательская. Суть данного аппарата сводится не к простому усилению поступающего света, как в дешевых моделях, а в переотрисовке всего видимого в режиме реального времени. Ещё одна особенность этого устройства в том, что оно позволяет видеть даже в абсолютной темноте. Это достигается за счет того, что излучатели по бокам устройства испускают свет в дальнем инфракрасном диапазоне, который люди попросту не видят, а вот линзы данного ПНВ без проблем замечают и отрисовывают как вполе реальный свет. У данного устройства можно включить режим особой видимости, если немного присесть."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:night_vision_device}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:precursor_armor}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "На эту броню наложен особый барьер, который не позволяет изучить её секреты."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:precursor_armor}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:precursor_helmet}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "На этот шлем наложен особый барьер, который не позволяет изучить его секреты."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:precursor_helmet}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:moon_mask}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Лунная маска. В неё вшит лунный камень, наделяющий носителя особыми способностями ночью. Её создал сам Динаронос, как истинную плоть и кровь малой луны."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:moon_mask}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:demon_essence}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Сущность демона. Этого дружка можно заселить в книжку."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:demon_essence}] ~ ~ ~ scoreboard players set @s item_control 1

    
    # Древняя электроника из старого Аркса
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:antenna}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Длинный провод, созданый для принятия радиоволн опеределенных длин."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:antenna}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:catushka}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Медная катушка. Является необходимым элементом многих электросхем, но сама по себе практически бесполезна."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:catushka}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:contacts}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Начишенные контакты, стойкие к коррозии. Ток по таким бежит вполне себе неплохо. Может пригодиться при сборке какого-нибудь модуля большой системы."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:contacts}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:cooler}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Вентилятор, призваный охлаждать горячие электроэлементы. Достаточно простое, оттого не менее интересное устройство."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:cooler}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:copper_provoloka}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Кусок медной проволоки. Это простой провод, позволяющий быстро взаимодействовать удаленным элементам в устройстве. Незаменимая часть почти всех схем."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:copper_provoloka}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:power_wire}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Силовой провод. Такие провода нужны, чтобы проводить высоковольтный ток, при этом не спалить свою тушку. Однако сейчас, отключенный, он абсолютно безопасен."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:power_wire}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:processor}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Сложнейший логический элемент, позволяющий делать миллионы вычислений в секунду. Однако стоит признать, что я едва ли хоть как-то смогу использовать эту информацию."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:processor}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:pult}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Устройство дистанционного управления чего бы то ни было, например двери, бомбы или компьютера."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:pult}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:reestr}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Даже могущественная магия искажения не способна определить, как работает это устройство древних."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:reestr}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:shlafe}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Шлейф из контактов. Готовый элемент, который часто используется в снимаемых модулях."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:shlafe}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:small_motor}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Небольшой моторчик. Бесполезен без электропитания. Вряд ли мне это пригодится в обозримом будущем."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:small_motor}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:textolite}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Кусок текстолита. На таких древние делали свои схемы. Вот бы найти инструкцию и подходящий верстак..."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:textolite}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:vinil}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Особый вид пластмассы, получаемый при переплавке виниловых пластинок."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:vinil}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:wire}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Провод. Кусок медной провлоки в нейлоновой оплетке. Он нужен, чтобы передавать электричество на небольшое расстояние."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:wire}] ~ ~ ~ scoreboard players set @s item_control 1

    # Хлам
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:rune_multi}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Эта удивительная руна способна совмещать в себе сразу 4 другие - KON, SIN, SAN и DIN"}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:rune_multi}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:hole_coin}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Монетка в ходу в Сансареа. Некоторые жители закапывают их на всякий случай. Возможно, вы когда-то повстречаете купца..."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:hole_coin}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:united_player_data}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Книжка, которая может рассказать о вас всё. Нет, буквально, она знает всё о вас. И что вы ей сделаете?"}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:united_player_data}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:canister_empty}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Путая канистра. Большая бадья для бензина, или аналогичной жидкости. После долгих путешествий по дну морскому бесследно потеряла всё содержимое, если оно там вообще было. Если понадобится перенести бензин, то она вполне подойдет."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:canister_empty}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:canister_full}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Канистра, наполненая бензином. Им можно запитать движок, работающий на бензине, а может и что-то посложнее."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:canister_full}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:damaged_electronics}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Поврежденная электроника. Путём сложных электрохимических преобразований, из нее, возможно, получится извлечь что-то полезное..."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:damaged_electronics}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_large}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Большая тяжёлая литиево-ионная батарея. Их преимущественно производила компания ElectroTech, между прочим одна из первых в своем деле."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_large}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_small}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Маленькая компактная батарея. Разработана компанией ElectroTech, при этом была народным стандартом в Элитее."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_small}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_ultra}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Дорогая баратея премиум-класса, выпущенная ElectroTech в ограниченном тираже. Вероятно, это её последний экземпляр в мире."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:battery_ultra}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:iron_pie}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Пирожок с подвохом. Не рекомендуется употреблять в пищу."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:iron_pie}] ~ ~ ~ scoreboard players set @s item_control 1

    # Монеты
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_falcon}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Подлинный золотой Сокол."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_falcon}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_falcon_silver}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Подлинный серебрянный Сокол."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_falcon_silver}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_pires}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Подлинный золотой Пирес."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_pires}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_pires_silver}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Подлинный серебрянный Пирес."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:coin_of_pires_silver}] ~ ~ ~ scoreboard players set @s item_control 1

    # Зелья
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Это просто спирт в бутылке. Кто-то из этого приготовит водку, а кто-то - лечебное зелье."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Заготовка для лечебных зелий. Попробуй добавить какой-то ингредиент!"}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_bone}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Зелье, способное исцелить сломаные кости. Осторожно, оно достаточно токсичное."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_bone}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_day_kosk}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Лекарство для исцеления от легкой простуды. Простое в приготовлении и простое и эффективное в использовании."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_day_kosk}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_fioletic}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Зелье, исцеляющее от наркозависимости. Осторожно, придется расплатиться вчерашним ужином..."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_fioletic}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_fok}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Медикамент, позволяющий убрать симптомы острой фазы почти любой болезни. Крайне полезно, когда пациент уже просит оборвать его страдания навсегда, а вы случайно выпили его лекарство вместо чая и не знаете что делать."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_fok}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_kaspora}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Полезное зелье, если вы поражены пневмонией. Просто выпейте его и ложитесь спать, чтобы скипнуть отравление. А, точно..."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_kaspora}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_night_kosk}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Для лечения тяжёлой простуды требуется тяжелое лечение, которое, по всей видимости, у вас сейчас в руке."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_night_kosk}] ~ ~ ~ scoreboard players set @s item_control 1

        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_poison}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "Ужасный способ лечения для ужасной болезни. Грипп бывает настолько тяжёлым, что уж лучше его вытравить из себя этим ядом, чем терпаеть весь этот ад."}]}
        execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[hasitem={location=slot.hotbar, slot=0, item=arx:square_bottle_spirt_golden_hay_poison}] ~ ~ ~ scoreboard players set @s item_control 1



    execute @p[tag=self, tag=spell_available, scores={target=1}] ~ ~ ~ execute @s[scores={item_control=0}] ~ ~ ~ tellraw @s {"rawtext": [{"text": "В первом слоте ничего нет, или в этом предмете не заключено ничего интересного"}]}
    
    execute @p[tag=self, tag=spell_available, scores={target=2}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на ближайшего
    tag @p[tag=self, tag=spell_available, scores={target=2}] add cant_be_casted_cus_of_target

    execute @p[tag=self, tag=spell_available, scores={target=3}] ~ ~ ~ w @p Кажется, это заклинание невозможно применить на животных и монстров
    tag @p[tag=self, tag=spell_available, scores={target=3}] add cant_be_casted_cus_of_target

    function spells/operations/withdraw_mp
