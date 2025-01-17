# Эта функция отвечает за проверку, МОЖНО ЛИ съесть еду сейчас
    # Если можно
        execute as @s[scores={saturation=0}] run function food/food_analysis
        execute as @s[scores={saturation=0}] run function food/visual/food
    # Если нет
        tellraw @s[scores={saturation=!0, class=0}] { "rawtext": [ { "text": "§6Вы ещё не проголодались. Поесть можно будет через§a " }, { "score": {"name": "@s", "objective": "saturation" } }, { "text": "§6 сек." } ] }
        tellraw @s[scores={saturation=!0, class=1}] { "rawtext": [ { "text": "§cВы - призрак. Вы не нуждаетесь в еде и не можете есть." } ] }

    # Аннулируем все временные переменные еды
        function food/return_temp_data_to_zero