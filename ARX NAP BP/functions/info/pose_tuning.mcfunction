# Анимации

# Если юзаем при беге
    execute if entity @s[tag=is_moving, tag=!is_riding] run tellraw @s { "rawtext": [ { "text": "§cЧтобы запустить анимацию, встаньте на одном месте." } ] }
    execute if entity @s[tag=is_riding] run tellraw @s { "rawtext": [ { "text": "§cЧтобы запустить анимацию, слезьте с того, на чем сидите." } ] }

# Запускаем конкретную анимацию
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-80] run playanimation @s animation.pose_tuning.hands_up a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-70, rxm=-80] run playanimation @s animation.pose_tuning.point_at_birds a 0.1 "query.is_moving || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-60, rxm=-70] run playanimation @s animation.pose_tuning.lie_on_back a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-50, rxm=-60] run playanimation @s animation.pose_tuning.lie_on_belly a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-40, rxm=-50] run playanimation @s animation.pose_tuning.lie_on_right_side a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-30, rxm=-40] run playanimation @s animation.pose_tuning.lie_on_left_side a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-20, rxm=-30] run playanimation @s animation.pose_tuning.sit_like_gangster a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=-10, rxm=-20] run playanimation @s animation.pose_tuning.look_what_i_have a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=0, rxm=-10] run playanimation @s animation.pose_tuning.sit a 0.1 "query.is_moving || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=10, rxm=0] run playanimation @s animation.pose_tuning.half_sitting a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=20, rxm=10] run playanimation @s animation.pose_tuning.sit_alternative a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=30, rxm=20] run playanimation @s animation.pose_tuning.sit_on_knees a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=40, rxm=30] run playanimation @s animation.pose_tuning.sad a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=50, rxm=40] run playanimation @s animation.pose_tuning.whiny a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=60, rxm=50] run playanimation @s animation.pose_tuning.incredulous a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=70, rxm=60] run playanimation @s animation.pose_tuning.monk_pose a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"
    execute if entity @s[tag=!is_moving, tag=!is_riding, rx=80, rxm=70] run playanimation @s animation.pose_tuning.facepalm a 0.1 "query.is_moving || q.property('arx:is_knocked') > 0" 
    execute if entity @s[tag=!is_moving, tag=!is_riding, rxm=80] run playanimation @s animation.pose_tuning.proud a 0.1 "query.is_moving || query.is_sneaking || q.property('arx:is_knocked') > 0"