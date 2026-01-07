# Драйвер 0 фазы. Март редко сильно атакует, по большей части просто парирует 

    # Игроки близко
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..49}] run playanimation @s animation.march.hit_with_jump
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=50..100}] run playanimation @s animation.march.attack_with_hand_using_rotation
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..100}] run damage @p[r=3, m=!spectator, has_property={arx:is_knocked=false}] 7
        execute if entity @s[tag=allow_melee_attack] if entity @a[scores={verify=2, custom_random=0..100}] run playsound axe_use @a ~ ~ ~
        