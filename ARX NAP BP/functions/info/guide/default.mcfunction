# Проводим самостоятельный (от лица скрипта) сбор нужных данных

    # Опыт майна
        execute as @s[lm=30] run tag @s add level_is_more_or_equal_30
        execute as @s[lm=40] run tag @s add level_is_more_or_equal_40
        execute as @s[lm=50] run tag @s add level_is_more_or_equal_50
        execute as @s[lm=60] run tag @s add level_is_more_or_equal_60
        execute as @s[lm=70] run tag @s add level_is_more_or_equal_70

    # Позиционка
        tag @s[x=-95, y=65, z=-137, dx=20, dy=20, dz=20] add is_on_indestructible_spawn

# Даем советы
    # Нокаут
        execute as @s[scores={respawn_delay=1..}] run tellraw @s { "rawtext": [ { "text": "§cВы в нокауте. Ничего страшного, это не смерть. Вы встанете через минуту - полторы после нока, но вам могут помочь ваши друзья, если они присядут (встанут на шифт) рядом с вами." } ] }
        execute as @s[scores={respawn_delay=1..}] run tag @s add has_smth_to_guide

    # На спавне
        execute as @s[tag=is_on_indestructible_spawn] run tellraw @s { "rawtext": [ { "text": "§aВы сейчас на самом спавне. Здесь не ломаются блоки, отойдите немного подальше." } ] }
        execute as @s[tag=is_on_indestructible_spawn] run tag @s add has_smth_to_guide

    # Ранения
        # very_low_hp - очень сильные ранения
            execute as @s[tag=very_low_hp, hasitem={item=arx:scroll_of_healing}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы очень сильно ранены!§6\nВылечитесь как можно быстрее, иначе у вас повысится стресс!\nИспользуйте §dсвиток регенерации§6, который у вас есть." } ] }
            execute as @s[tag=very_low_hp, hasitem={item=arx:scroll_of_healing}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[tag=very_low_hp, scores={saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы очень сильно ранены!§6\nВылечитесь как можно быстрее, иначе у вас повысится стресс!\nПоешьте что-то вкусное, вы как раз проголодались." } ] }
            execute as @s[tag=very_low_hp, scores={saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[tag=very_low_hp, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы очень сильно ранены!§6\nВылечитесь как можно быстрее, иначе у вас очень сильно повысится стресс!\nВылечиться можно при помощи вкусной еды, свитка или магии." } ] }
            execute as @s[tag=very_low_hp, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

        # low_hp - неприятные ранения
            execute as @s[tag=low_hp, hasitem={item=arx:scroll_of_healing}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы ранены!§6\nВылечитесь как можно быстрее, иначе у вас повысится стресс!\nИспользуйте §dсвиток регенерации§6, который у вас есть." } ] }
            execute as @s[tag=low_hp, hasitem={item=arx:scroll_of_healing}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[tag=low_hp, scores={saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы ранены!§6\nВылечитесь как можно быстрее, иначе у вас повысится стресс!\nПоешьте что-то вкусное, вы как раз проголодались." } ] }
            execute as @s[tag=low_hp, scores={saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[tag=low_hp, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cВы ранены!§6\nВылечитесь как можно быстрее, иначе у вас повысится стресс!\nВылечиться можно при помощи вкусной еды, свитка или магии." } ] }
            execute as @s[tag=low_hp, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

    # Стресс
        # 2 ур.
            execute as @s[scores={stress_cond=2, saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 2 ур. стресса.§6\nВкусно покушайте, и он пройдет, вы как раз проголодались." } ] }
            execute as @s[scores={stress_cond=2, saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[scores={stress_cond=2}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 2 ур. стресса.§6\nВкусно покушайте, сделайте и используйте свиток забвения или просто подождите, пока он не пройдет. Подробные дебаффы от 2-го ур. стресса вы можете посмотреть с помощью предмета <Инфо> во вкладке <Общие данные о персонаже>." } ] }
            execute as @s[scores={stress_cond=2}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide
        
        # 3 ур.
            execute as @s[scores={stress_cond=3, saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 3 ур. стресса.§6\nВкусно покушайте, и вам станет лучше, вы как раз проголодались. §oТолько ради бога, не ешьте кору..." } ] }
            execute as @s[scores={stress_cond=3, saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[scores={stress_cond=3}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 3 ур. стресса.§6\nВкусно покушайте, сделайте и используйте свиток забвения или просто подождите, пока он не пройдет. Подробные дебаффы от 3-го ур. стресса вы можете посмотреть с помощью предмета <Инфо> во вкладке <Общие данные о персонаже>." } ] }
            execute as @s[scores={stress_cond=3}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide
        
        # 4 ур.
            execute as @s[scores={stress_cond=4}, hasitem={item=arx:scroll_of_oblivion}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 4, максимальный ур. стресса.§6\nСамое время использовать §dсвиток забвения§6, чтобы его сбросить." } ] }
            execute as @s[scores={stress_cond=4}, hasitem={item=arx:scroll_of_oblivion}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[scores={stress_cond=4, saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 4, максимальный ур. стресса.§6\nВкусно покушайте, и вам полегчает, вы как раз проголодались." } ] }
            execute as @s[scores={stress_cond=4, saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

            execute as @s[scores={stress_cond=4}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cУ вас 4, максимальный ур. стресса.§6\nВкусно покушайте, сделайте и используйте свиток забвения или просто подождите, пока он не пройдет. Подробные дебаффы от 4-го ур. стресса вы можете посмотреть с помощью предмета <Инфо> во вкладке <Общие данные о персонаже>. §cНе забывайте, что при 4 ур. стресса можно получить случайную черту хараектра, при чем более вероятно отрицательную." } ] }
            execute as @s[scores={stress_cond=4}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide


    # Скрафтить верстак
        execute as @s[scores={ach_has_crafting_table=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aНачните с создания вестака!§6 Для этого:\n§a1.§6 Добудьте рукой маленькие камушки. Их можно найти везде на поверхности\n§a2.§6 Зайдите в инвентарь и сделайте из них два блока булыжника\n§a3.§6 Добудьте дерево и скрафтите доски. Пожалуйста, дорубайте деревья целиком!\n§a4.§6 Скрафтите верстак и поставьте его!" } ] }
        execute as @s[scores={ach_has_crafting_table=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide
    
    # Невложенные очки обучения
        execute as @s[scores={skill_point=1..}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aУ вас есть §d" }, { "score": {"name": "@s", "objective": "skill_point" } }, { "text": " §aневкачанное(-ых) очко(-в) обучения.§f Чтобы их использовать, создайте и используйте один из трех предметов на обычном вестаке: §cПовысить силу§f, §aПовысить ловкость§f или §bПовысить магию§f." } ] }
        execute as @s[scores={skill_point=1..}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

    # Еда
        execute as @s[scores={saturation=0}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§cПочему бы не перекусить?§6\nПокушайте. Помните, чем вкуснее для вас еда, тем больше она вам даст счастья и лечения." } ] }
        execute as @s[scores={saturation=0}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide

    # Повышение религии 
        execute as @s[scores={religion=0}, tag=level_is_more_or_equal_30, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aВы можете повысить религию до уровня Ученик! §fСкрафтите на обычном верстаке либо §aкаменного Пиреса§f, либо §aкаменного Палласа§f, и используйте. §cНо осторожно! Некоторые персонажи могут очень отрицательно относиться к тем, кто верит не в их бога." } ] }
        execute as @s[scores={religion=0}, tag=level_is_more_or_equal_30, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide


    # Есть доступная религия
        # 1 ур
            execute as @s[scores={religion=0}, tag=!level_is_more_or_equal_30, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aВы сможете повысить религию до уровня Ученик, если у вас будет 30-й уровень! §6Это даст приятные бонусы." } ] }
            execute as @s[scores={religion=0}, tag=!level_is_more_or_equal_30] run tag @s add has_smth_to_guide

    # Уровни Аркса
        execute as @s[scores={xp_stage=0..3}, tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aВам стоит повысить уровень Аркса! §6У вас сейчас §a" }, { "score": {"name": "@s", "objective": "xp" } }, { "text": "XP§6, а нужно §a" }, { "score": {"name": "@s", "objective": "xp_lim" } }, { "text": "XP§6. Чтобы повысить уровень, попробуйте добыть осколки опыта в шахте, поделать еду, получить достижения или поохотиться §a(с последним осторожно, мобы в Арксе довольно опасные)" } ] }
        execute as @s[scores={xp_stage=0..3}, tag=!has_smth_to_guide] run tag @s add has_smth_to_guide


    # Нечего советовать
        execute as @s[tag=!has_smth_to_guide] run tellraw @s { "rawtext": [ { "text": "§aВ настоящее время гиду нечего сказать. Просто продолжайте играть!" } ] }

# Чистим теги
    tag @s remove has_smth_to_guide

    tag @s remove level_is_more_or_equal_30
    tag @s remove level_is_more_or_equal_40
    tag @s remove level_is_more_or_equal_50
    tag @s remove level_is_more_or_equal_60
    tag @s remove level_is_more_or_equal_70

    tag @s remove is_on_indestructible_spawn