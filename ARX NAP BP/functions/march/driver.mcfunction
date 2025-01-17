# Уменьшаем переменные откатов
    scoreboard players add @s[scores={march_shoot_cd=1..}] march_shoot_cd -1 

# Увеличиваем переменную счета секунд/4 после начала боя
    scoreboard players add @a[scores={verify=2}] march_battle_time 1

# Проверяем, летит ли март после самого начала боя вниз, или уже закончил
    execute if entity @s[has_property={arx:descent=true}] run event entity @s test_stop_descent

# Устанавливаем титл босса, когда он спускается и становится виден
    execute if entity @a[scores={verify=2, march_battle_time=40}] run event entity @s[type=arx:march] set_default_boss_title

# Шумим за двигатели
    execute if entity @s[has_property={arx:active_engines=true}] run playsound march_engines @a ~ ~-0.5 ~

# Выпускаем реактивные струи
    execute as @s[has_property={arx:active_engines=true}] at @s positioned ~ ~1.2 ~ rotated as @s run particle arx:march_jet_stream ^0.42 ^ ^
    execute as @s[has_property={arx:active_engines=true}] at @s positioned ~ ~1.2 ~ rotated as @s run particle arx:march_jet_stream ^-0.42 ^ ^

# Определяем, стоит ли доочередно закончить бой, если на поле боя нет игроков 
    execute unless entity @a[x=43, y=18, z=-200, dx=17, dy=10, dz=17, m=!spectator] run function march/finalize_battle_march_won

# Определяем фазу
    event entity @s test_hp

# Запускаем нужный драйвер, зависимо от фазы
    execute if entity @s[has_property={arx:phase=0, arx:descent=false}] run function march/0_phase_driver
    execute if entity @s[has_property={arx:phase=1}] run function march/1_phase_driver
    execute if entity @s[has_property={arx:phase=2}] run function march/2_phase_driver
    execute if entity @s[has_property={arx:phase=3}] run function march/3_phase_driver

# Анализируем смену состояний хп
    execute if entity @s[has_property={arx:descent=false}, tag=descent_last_pass] run function march/switch_to_0_phase
    execute if entity @s[has_property={arx:phase=1}, tag=phase_0_last_pass] run function march/switch_to_1_phase
    execute if entity @s[has_property={arx:phase=2}, tag=phase_1_last_pass] run function march/switch_to_2_phase
    execute if entity @s[has_property={arx:phase=3}, tag=phase_2_last_pass] run function march/switch_to_3_phase

# Выставляем журнальные теги о хп
    tag @s remove phase_0_last_pass
    tag @s remove phase_1_last_pass
    tag @s remove phase_2_last_pass
    tag @s remove phase_3_last_pass
    tag @s remove descent_last_pass

    tag @s[has_property={arx:phase=0}] add phase_0_last_pass
    tag @s[has_property={arx:phase=1}] add phase_1_last_pass
    tag @s[has_property={arx:phase=2}] add phase_2_last_pass
    tag @s[has_property={arx:phase=3}] add phase_3_last_pass
    tag @s[has_property={arx:descent=true}] add descent_last_pass