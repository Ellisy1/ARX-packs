# Дроп
    # Руны
        scoreboard players random @s trait_random 0 30
        give @s[scores={trait_random=0}] arx:rune_affuono_b
        give @s[scores={trait_random=1}] arx:rune_arrako_b
        give @s[scores={trait_random=2}] arx:rune_din_b
        give @s[scores={trait_random=3}] arx:rune_disortari_b
        give @s[scores={trait_random=4}] arx:rune_elletera_b
        give @s[scores={trait_random=5}] arx:rune_floruum_b
        give @s[scores={trait_random=6}] arx:rune_flurri_b
        give @s[scores={trait_random=7}] arx:rune_hijo_b
        give @s[scores={trait_random=8}] arx:rune_horo_b
        give @s[scores={trait_random=9}] arx:rune_inoffo_b
        give @s[scores={trait_random=10}] arx:rune_kon_b
        give @s[scores={trait_random=11}] arx:rune_kotoka_b
        give @s[scores={trait_random=12}] arx:rune_laffaeti_b
        give @s[scores={trait_random=13}] arx:rune_low_b
        give @s[scores={trait_random=14}] arx:rune_marra_b
        give @s[scores={trait_random=15}] arx:rune_mega_b
        give @s[scores={trait_random=16}] arx:rune_orduino_b
        give @s[scores={trait_random=17}] arx:rune_recuro_b
        give @s[scores={trait_random=18}] arx:rune_sakiifori_b
        give @s[scores={trait_random=19}] arx:rune_san_b
        give @s[scores={trait_random=20}] arx:rune_sartagana_b
        give @s[scores={trait_random=21}] arx:rune_sempra_b
        give @s[scores={trait_random=22}] arx:rune_shumi_b
        give @s[scores={trait_random=23}] arx:rune_sin_b
        give @s[scores={trait_random=24}] arx:rune_sofiso_b
        give @s[scores={trait_random=25}] arx:rune_subversa_b
        give @s[scores={trait_random=26}] arx:rune_sukimo_b
        give @s[scores={trait_random=27}] arx:rune_trafantana_b
        give @s[scores={trait_random=28}] arx:rune_transkursio_b
        give @s[scores={trait_random=29}] arx:rune_watashi_b
        give @s[scores={trait_random=30}] arx:rune_yanamo_b

    give @s arx:human_meat 1
    give @s arx:human_skin 1
    give @s[scores={custom_random=0..199}] bone 2
    give @s[scores={custom_random=200..399}] arx:animal_heart 1
    give @s[scores={custom_random=400..599}] arx:brain 1
    give @s[scores={custom_random=600..799}] arx:liver 1
    function dead_mobs/operations/get_blood

# Удаляем предмет
    clear @s arx:dead_snow_lady 0 1
