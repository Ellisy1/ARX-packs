#Обнаружаем маски
    execute as @a[r=5] run function actions/detect_mask

#Активируем анализ распространения болезней
    function actions/spread_disease


#Звук чихания
    execute at @s[scores={gender=1}] run playsound action.sneeze.man @a ~ ~ ~ 3.00 
    execute at @s[scores={gender=2}] run playsound action.sneeze.woman @a ~ ~ ~ 3.00 

#Анимация чихания
    tag @s[hasitem={item=arx:pose_tuning, location=slot.weapon.mainhand}] add forbid_sneeze

    execute as @p[tag=!forbid_sneeze, scores={custom_random=0..500}] run playanimation @p animation.sneeze.1
    execute as @p[tag=!forbid_sneeze, scores={custom_random=501..1000}] run playanimation @p animation.sneeze.2

    tag @s remove forbid_sneeze