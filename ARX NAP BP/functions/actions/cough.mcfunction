#Обнаружаем маски
    execute as @a[r=5] run function actions/detect_mask

#Активируем анализ распространения болезней
    function actions/spread_disease


#Звук кашля
    execute at @s[scores={gender=1}] run playsound action.cough.man @a ~ ~ ~ 3.00 
    execute at @s[scores={gender=2}] run playsound action.cough.woman @a ~ ~ ~ 3.00 

#Анимация кашля
    tag @s[hasitem={item=arx:pose_tuning, location=slot.weapon.mainhand}] add forbid_cough

    execute as @s[tag=!forbid_cough, scores={custom_random=0..500}] run playanimation @s animation.cough.1
    execute as @s[tag=!forbid_cough, scores={custom_random=501..1000}] run playanimation @s animation.cough.2

    tag @s remove forbid_cough