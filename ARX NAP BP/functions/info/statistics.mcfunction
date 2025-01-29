tellraw @p { "rawtext": [{"text": "§6=====§aСТАТИСТИКА§6====="}] }

tellraw @s { "rawtext": [ { "text": "Время игры: §d" }, { "score": {"name": "@p", "objective": "time_h" } }, { "text": "ч. " }, { "score": {"name": "@p", "objective": "time_m" } }, { "text": "мин." } ] }

tellraw @s { "rawtext": [ { "text": "§6===" } ] }

tellraw @s { "rawtext": [ { "text": "Убито мобов: §d" }, { "score": {"name": "@s", "objective": "count_mob_kills" } } ] }
tellraw @s { "rawtext": [ { "text": "Убито мини-боссов: §d" }, { "score": {"name": "@s", "objective": "count_mbs_kills" } } ] }
tellraw @s { "rawtext": [ { "text": "Убито боссов: §d" }, { "score": {"name": "@s", "objective": "count_bss_kills" } } ] }

tellraw @s { "rawtext": [ { "text": "§6===" } ] }

tellraw @s { "rawtext": [ { "text": "Нокаутов: §d" }, { "score": {"name": "@s", "objective": "count_death" } } ] }
tellraw @s { "rawtext": [ { "text": "Получено ударов: §d" }, { "score": {"name": "@s", "objective": "count_hits" } } ] }
tellraw @s { "rawtext": [ { "text": "Пройденная дистанция: §d" }, { "score": {"name": "@s", "objective": "count_distance" } }, { "text": " блоков" } ] }

tellraw @s { "rawtext": [ { "text": "§6===" } ] }

tellraw @s { "rawtext": [ { "text": "Заклинаний сотворено: §d" }, { "score": {"name": "@s", "objective": "count_spells" } } ] }
tellraw @s { "rawtext": [ { "text": "Маны потрачено: §b" }, { "score": {"name": "@s", "objective": "count_spent_mp" } }, { "text": " MP" } ] }