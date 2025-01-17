tag @p add self

#Дроп
#Руны
    scoreboard players random @p trait_random 0 30
    give @p[tag=self, scores={trait_random=0}] arx:rune_affuono_b
    give @p[tag=self, scores={trait_random=1}] arx:rune_arrako_b
    give @p[tag=self, scores={trait_random=2}] arx:rune_din_b
    give @p[tag=self, scores={trait_random=3}] arx:rune_disortari_b
    give @p[tag=self, scores={trait_random=4}] arx:rune_elletera_b
    give @p[tag=self, scores={trait_random=5}] arx:rune_floruum_b
    give @p[tag=self, scores={trait_random=6}] arx:rune_flurri_b
    give @p[tag=self, scores={trait_random=7}] arx:rune_hijo_b
    give @p[tag=self, scores={trait_random=8}] arx:rune_horo_b
    give @p[tag=self, scores={trait_random=9}] arx:rune_inoffo_b
    give @p[tag=self, scores={trait_random=10}] arx:rune_kon_b
    give @p[tag=self, scores={trait_random=11}] arx:rune_kotoka_b
    give @p[tag=self, scores={trait_random=12}] arx:rune_laffaeti_b
    give @p[tag=self, scores={trait_random=13}] arx:rune_low_b
    give @p[tag=self, scores={trait_random=14}] arx:rune_marra_b
    give @p[tag=self, scores={trait_random=15}] arx:rune_mega_b
    give @p[tag=self, scores={trait_random=16}] arx:rune_orduino_b
    give @p[tag=self, scores={trait_random=17}] arx:rune_recuro_b
    give @p[tag=self, scores={trait_random=18}] arx:rune_sakiifori_b
    give @p[tag=self, scores={trait_random=19}] arx:rune_san_b
    give @p[tag=self, scores={trait_random=20}] arx:rune_sartagana_b
    give @p[tag=self, scores={trait_random=21}] arx:rune_sempra_b
    give @p[tag=self, scores={trait_random=22}] arx:rune_shumi_b
    give @p[tag=self, scores={trait_random=23}] arx:rune_sin_b
    give @p[tag=self, scores={trait_random=24}] arx:rune_sofiso_b
    give @p[tag=self, scores={trait_random=25}] arx:rune_subversa_b
    give @p[tag=self, scores={trait_random=26}] arx:rune_sukimo_b
    give @p[tag=self, scores={trait_random=27}] arx:rune_trafantana_b
    give @p[tag=self, scores={trait_random=28}] arx:rune_transkursio_b
    give @p[tag=self, scores={trait_random=29}] arx:rune_watashi_b
    give @p[tag=self, scores={trait_random=30}] arx:rune_yanamo_b
give @p[tag=self, scores={sk_a_11=1}] arx:human_meat 1
give @p[tag=self, scores={sk_a_13=1}] arx:human_skin 1
give @p[tag=self, scores={sk_a_16=1}] bone 4
give @p[tag=self, scores={sk_b_6=1}] arx:animal_heart 1
give @p[tag=self, scores={sk_b_7=1}] arx:brain 1
give @p[tag=self, scores={sk_b_8=1}] arx:liver 1
give @p[tag=self, scores={sk_b_9=1}] arx:animal_eye 2

tag @p[tag=self, hasitem={item=arx:bottle_for_blood}] add has_bottle_for_blood
    tellraw @p[tag=self, scores={gender=1, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы мог наполнить бутыли кровью, если бы они у меня были." } ] }
    tellraw @p[tag=self, scores={gender=2, sk_c_6=1}, tag=!has_bottle_for_blood] { "rawtext": [ { "text": "§6Я бы могла наполнить бутыли кровью, если бы они у меня были." } ] }

tag @p[tag=self, scores={sk_c_6=1}, hasitem={item=arx:bottle_for_blood}] add can_collect_blood
    give @p[tag=self, tag=can_collect_blood] arx:bottle_of_blood
    clear @p[tag=self, tag=can_collect_blood] arx:bottle_for_blood 0 1

#Если нет навыков
tellraw @p[tag=self, scores={gender=1, sk_a_11=0, sk_a_13=0, sk_a_16=0, sk_b_6=0, sk_b_7=0, sk_b_8=0, sk_b_9=0, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смог достать..." } ] }
tellraw @p[tag=self, scores={gender=2, sk_a_11=0, sk_a_13=0, sk_a_16=0, sk_b_6=0, sk_b_7=0, sk_b_8=0, sk_b_9=0, sk_c_6=0}] { "rawtext": [ { "text": "§6Я ничего не смогла достать..." } ] }

#Дропаем ОП
scoreboard players add @p xp_tray 10

#Удаляем предмет
clear @p arx:dead_snow_lady 0 1

tag @p remove has_bottle_for_blood
tag @p remove can_collect_blood
tag @p remove self