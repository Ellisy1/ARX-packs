tag @a remove __allow_analyse_near_march_pc__
tag @a[tag=urk_remote_controller_mode, x=63, y=18, z=-190, dx=4, dy=4, dz=5, hasitem={item=arx:universal_radio_key, location=slot.weapon.mainhand}] add __allow_analyse_near_march_pc__

tag @a remove facing_march_pc_y_middle
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, ry=7, rym=-7] add facing_march_pc_y_middle

tag @a remove facing_march_pc_y_right
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, ry=50, rym=7] add facing_march_pc_y_right

tag @a remove facing_march_pc_y_left
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, ry=-7, rym=-50] add facing_march_pc_y_left

tag @a remove facing_march_pc_x_middle
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, rx=7, rxm=-7] add facing_march_pc_x_middle

tag @a remove facing_march_pc_x_up
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, rx=-7, rxm=-50] add facing_march_pc_x_up

tag @a remove facing_march_pc_x_down
tag @a[tag=urk_remote_controller_mode, tag=__allow_analyse_near_march_pc__, rx=50, rxm=7] add facing_march_pc_x_down


tag @a remove marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_up] run event entity @e[type=arx:marchs_monitor] set_aim_direction_1
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_up] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_up] run event entity @e[type=arx:marchs_monitor] set_aim_direction_2
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_up] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_up] run event entity @e[type=arx:marchs_monitor] set_aim_direction_3
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_up] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_middle] run event entity @e[type=arx:marchs_monitor] set_aim_direction_4
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_middle] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_middle] run event entity @e[type=arx:marchs_monitor] set_aim_direction_5
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_middle] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_middle] run event entity @e[type=arx:marchs_monitor] set_aim_direction_6
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_middle] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_down] run event entity @e[type=arx:marchs_monitor] set_aim_direction_7
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_left, tag=facing_march_pc_x_down] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_down] run event entity @e[type=arx:marchs_monitor] set_aim_direction_8
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_middle, tag=facing_march_pc_x_down] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_down] run event entity @e[type=arx:marchs_monitor] set_aim_direction_9
execute as @a[tag=urk_remote_controller_mode, tag=facing_march_pc_y_right, tag=facing_march_pc_x_down] run tag @a add marchs_monitor_control

execute as @a[tag=urk_remote_controller_mode, tag=!marchs_monitor_control] run event entity @e[type=arx:marchs_monitor] set_aim_direction_0