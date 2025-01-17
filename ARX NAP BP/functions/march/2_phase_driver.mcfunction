# Драйвер 2 фазы. Март сильно атакует, быстро бегает и иногда стреляет

    # Игроки далеко
        # Активируем атаку по дистанции
            execute if entity @s[tag=!allow_melee_attack, scores={march_shoot_cd=0}] if entity @a[scores={verify=2, custom_random=0..50}] run event entity @s enable_ranged_attack
            execute if entity @s[tag=!allow_melee_attack, scores={march_shoot_cd=0}] if entity @a[scores={verify=2, custom_random=0..50}] run scoreboard players set @s march_shoot_cd 20
        
        # Деактивируем
            execute if entity @s[scores={march_shoot_cd=8}] run event entity @s disable_ranged_attack

    # Игроки близко
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..100}] run playanimation @s animation.march.strike_with_leg_0_phase
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..100}] run damage @p[r=3, m=!spectator] 12
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..100}] run playsound axe_use @a ~ ~ ~