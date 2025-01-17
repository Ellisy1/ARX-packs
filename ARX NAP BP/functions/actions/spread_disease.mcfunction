#Эта функция отвечает за распространение болезней, когда кто-то чихает или кашляет. Активируется соответствующей функцией

#Анализируем, заблокировала ли маска распространение болезни при вашем чихе/кашле
    tag @s remove spread_disease

    tag @s[tag=!in_mask, tag=!in_ideal_mask, scores={custom_random_c=0..500}] add spread_disease
    tag @s[tag=in_mask, scores={custom_random_c=0..100}] add spread_disease
    tag @s[tag=in_ideal_mask, scores={custom_random_c=0..5}] add spread_disease
    

#Заражение окружающих
    #Лёгкая простуда
        execute at @s[tag=spread_disease, scores={ill_mild_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_ideal_mask, scores={ill_mild_cold=!1.., custom_random=1}] ill_mild_cold 14600
        execute at @s[tag=spread_disease, scores={ill_mild_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_mask, scores={ill_mild_cold=!1.., custom_random=1..100}] ill_mild_cold 14600
        execute at @s[tag=spread_disease, scores={ill_mild_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=!in_mask, tag=!in_ideal_mask, scores={ill_mild_cold=!1.., custom_random=1..500}] ill_mild_cold 14600
    #Тяжёлая простуда
        execute at @s[tag=spread_disease, scores={ill_severe_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_ideal_mask, scores={ill_severe_cold=!1.., custom_random=1}] ill_severe_cold 14600
        execute at @s[tag=spread_disease, scores={ill_severe_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_mask, scores={ill_severe_cold=!1.., custom_random=1..100}] ill_severe_cold 14600
        execute at @s[tag=spread_disease, scores={ill_severe_cold=5000..}] run scoreboard players set @a[m=!spectator, r=5, tag=!in_mask, tag=!in_ideal_mask, scores={ill_severe_cold=!1.., custom_random=1..500}] ill_severe_cold 14600
    #Пневмония
        execute at @s[tag=spread_disease, scores={ill_pneumonia=1..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_ideal_mask, scores={ill_pneumonia=!1.., custom_random=1}] ill_pneumonia 19200
        execute at @s[tag=spread_disease, scores={ill_pneumonia=1..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_mask, scores={ill_pneumonia=!1.., custom_random=1..100}] ill_pneumonia 19200
        execute at @s[tag=spread_disease, scores={ill_pneumonia=1..}] run scoreboard players set @a[m=!spectator, r=5, tag=!in_mask, tag=!in_ideal_mask, scores={ill_pneumonia=!1.., custom_random=1..500}] ill_pneumonia 19200
    #Грипп
        execute at @s[tag=spread_disease, scores={ill_flu=30000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_ideal_mask, scores={ill_flu=!1.., custom_random=1}] ill_flu 40000
        execute at @s[tag=spread_disease, scores={ill_flu=30000..}] run scoreboard players set @a[m=!spectator, r=5, tag=in_mask, scores={ill_flu=!1.., custom_random=1..100}] ill_flu 40000
        execute at @s[tag=spread_disease, scores={ill_flu=30000..}] run scoreboard players set @a[m=!spectator, r=5, tag=!in_mask, tag=!in_ideal_mask, scores={ill_flu=!1.., custom_random=1..500}] ill_flu 40000