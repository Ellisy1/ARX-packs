tellraw @s { "rawtext": [ { "text": "§6=====§aВАШИ ВКУСЫ§6=====" } ] } 

tellraw @s { "rawtext": [ { "text": "§6Отношение к типам пищи:" } ] } 

    tellraw @s[scores={t_herbal=..-31}] { "rawtext": [ { "text": "> Растительное: §c" }, { "score": {"name": "@s", "objective": "t_herbal" } } ] }
    tellraw @s[scores={t_herbal=-30..30}] { "rawtext": [ { "text": "> Растительное: §e" }, { "score": {"name": "@s", "objective": "t_herbal" } } ] }
    tellraw @s[scores={t_herbal=31..}] { "rawtext": [ { "text": "> Растительное: §a" }, { "score": {"name": "@s", "objective": "t_herbal" } } ] }

    tellraw @s[scores={t_meat=..-31}] { "rawtext": [ { "text": "> Мясное: §c" }, { "score": {"name": "@s", "objective": "t_meat" } } ] }
    tellraw @s[scores={t_meat=-30..30}] { "rawtext": [ { "text": "> Мясное: §e" }, { "score": {"name": "@s", "objective": "t_meat" } } ] }
    tellraw @s[scores={t_meat=31..}] { "rawtext": [ { "text": "> Мясное: §a" }, { "score": {"name": "@s", "objective": "t_meat" } } ] }

    tellraw @s[scores={t_fish=..-31}] { "rawtext": [ { "text": "> Рыбное: §c" }, { "score": {"name": "@s", "objective": "t_fish" } } ] }
    tellraw @s[scores={t_fish=-30..30}] { "rawtext": [ { "text": "> Рыбное: §e" }, { "score": {"name": "@s", "objective": "t_fish" } } ] }
    tellraw @s[scores={t_fish=31..}] { "rawtext": [ { "text": "> Рыбное: §a" }, { "score": {"name": "@s", "objective": "t_fish" } } ] }

    tellraw @s[scores={t_bread=..-31}] { "rawtext": [ { "text": "> Хлебное: §c" }, { "score": {"name": "@s", "objective": "t_bread" } } ] }
    tellraw @s[scores={t_bread=-30..30}] { "rawtext": [ { "text": "> Хлебное: §e" }, { "score": {"name": "@s", "objective": "t_bread" } } ] }
    tellraw @s[scores={t_bread=31..}] { "rawtext": [ { "text": "> Хлебное: §a" }, { "score": {"name": "@s", "objective": "t_bread" } } ] }

    tellraw @s[scores={t_lactic=..-31}] { "rawtext": [ { "text": "> Молочное: §c" }, { "score": {"name": "@s", "objective": "t_lactic" } } ] }
    tellraw @s[scores={t_lactic=-30..30}] { "rawtext": [ { "text": "> Молочное: §e" }, { "score": {"name": "@s", "objective": "t_lactic" } } ] }
    tellraw @s[scores={t_lactic=31..}] { "rawtext": [ { "text": "> Молочное: §a" }, { "score": {"name": "@s", "objective": "t_lactic" } } ] }

tellraw @s { "rawtext": [ { "text": " " } ] } 
tellraw @s { "rawtext": [ { "text": "§6Конкретные вкусы:" } ] } 

    tellraw @s[scores={t_spicy=..-31}] { "rawtext": [ { "text": "> Острое: §c" }, { "score": {"name": "@s", "objective": "t_spicy" } } ] }
    tellraw @s[scores={t_spicy=-30..30}] { "rawtext": [ { "text": "> Острое: §e" }, { "score": {"name": "@s", "objective": "t_spicy" } } ] }
    tellraw @s[scores={t_spicy=31..}] { "rawtext": [ { "text": "> Острое: §a" }, { "score": {"name": "@s", "objective": "t_spicy" } } ] }

    tellraw @s[scores={t_salty=..-31}] { "rawtext": [ { "text": "> Солёное: §c" }, { "score": {"name": "@s", "objective": "t_salty" } } ] }
    tellraw @s[scores={t_salty=-30..30}] { "rawtext": [ { "text": "> Солёное: §e" }, { "score": {"name": "@s", "objective": "t_salty" } } ] }
    tellraw @s[scores={t_salty=31..}] { "rawtext": [ { "text": "> Солёное: §a" }, { "score": {"name": "@s", "objective": "t_salty" } } ] }

    tellraw @s[scores={t_sweet=..-31}] { "rawtext": [ { "text": "> Сладкое: §c" }, { "score": {"name": "@s", "objective": "t_sweet" } } ] }
    tellraw @s[scores={t_sweet=-30..30}] { "rawtext": [ { "text": "> Сладкое: §e" }, { "score": {"name": "@s", "objective": "t_sweet" } } ] }
    tellraw @s[scores={t_sweet=31..}] { "rawtext": [ { "text": "> Сладкое: §a" }, { "score": {"name": "@s", "objective": "t_sweet" } } ] }

    tellraw @s[scores={t_sour=..-31}] { "rawtext": [ { "text": "> Кислое: §c" }, { "score": {"name": "@s", "objective": "t_sour" } } ] }
    tellraw @s[scores={t_sour=-30..30}] { "rawtext": [ { "text": "> Кислое: §e" }, { "score": {"name": "@s", "objective": "t_sour" } } ] }
    tellraw @s[scores={t_sour=31..}] { "rawtext": [ { "text": "> Кислое: §a" }, { "score": {"name": "@s", "objective": "t_sour" } } ] }

    tellraw @s[scores={t_exotic=..-31}] { "rawtext": [ { "text": "> Экзотическое: §c" }, { "score": {"name": "@s", "objective": "t_exotic" } } ] }
    tellraw @s[scores={t_exotic=-30..30}] { "rawtext": [ { "text": "> Экзотическое: §e" }, { "score": {"name": "@s", "objective": "t_exotic" } } ] }
    tellraw @s[scores={t_exotic=31..}] { "rawtext": [ { "text": "> Экзотическое: §a" }, { "score": {"name": "@s", "objective": "t_exotic" } } ] }