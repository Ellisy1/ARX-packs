# Универсальный радиоключ - обычный режим работы

# Конструкция переменных универстального ключа:
#   urk_последовательность, то есть переменная для последовательности 0000 будет urk_0000
#   urkm_последовательность, если требудется военный шифровальный чип

tag @s[hasitem={item=arx:military_chip, location=slot.armor.feet}] add has_military_chip

# Достаточно заряда, набор значения
    # 0
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tellraw @s { "rawtext": [ { "text": "Записано §a0" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urk_D0782133229=1}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urk_D0782133229=1}] urk_D0782133229 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urk_0001=2}] add encoding_urk_0001
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urk_0001=2}] urk_0001 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urk_0001=1}] add encoding_urk_0001
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urk_0001=1}] urk_0001 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urk_0001=0}] add encoding_urk_0001
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urk_0001=0}] urk_0001 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urkm_AFB7125BF065=9}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urkm_AFB7125BF065=9}] urkm_AFB7125BF065 10

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run tag @s[scores={urkm_5F8E7D827D2C10A1=13}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-80] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=13}] urkm_5F8E7D827D2C10A1 14

    # 1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tellraw @s { "rawtext": [ { "text": "Записано §a1" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s urk_12343 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s urk_19D837AB277 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urk_ABC12345F=3}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urk_ABC12345F=3}] urk_ABC12345F 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urk_98221DA8124=4}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urk_98221DA8124=4}] urk_98221DA8124 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urk_98221DA8124=8}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urk_98221DA8124=8}] urk_98221DA8124 9

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urk_D0782133229=5}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urk_D0782133229=5}] urk_D0782133229 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urk_0001=3}] add encoding_urk_0001
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urk_0001=3}] urk_0001 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urkm_AFB7125BF065=4}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urkm_AFB7125BF065=4}] urkm_AFB7125BF065 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s urk_1398AACBC8 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urkm_5F8E7D827D2C10A1=12}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=12}] urkm_5F8E7D827D2C10A1 13

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run tag @s[scores={urkm_5F8E7D827D2C10A1=15}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-70, rxm=-80] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=15}] urkm_5F8E7D827D2C10A1 99

    # 2
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tellraw @s { "rawtext": [ { "text": "Записано §a2" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_12343=1}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_12343=1}] urk_12343 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_19D837AB277=8}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_19D837AB277=8}] urk_19D837AB277 9

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_ABC12345F=4}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_ABC12345F=4}] urk_ABC12345F 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_98221DA8124=3}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_98221DA8124=3}] urk_98221DA8124 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_98221DA8124=2}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_98221DA8124=2}] urk_98221DA8124 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_98221DA8124=9}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_98221DA8124=9}] urk_98221DA8124 10

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_D0782133229=4}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_D0782133229=4}] urk_D0782133229 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_D0782133229=9}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_D0782133229=9}] urk_D0782133229 10

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urk_D0782133229=8}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urk_D0782133229=8}] urk_D0782133229 9

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urkm_AFB7125BF065=5}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urkm_AFB7125BF065=5}] urkm_AFB7125BF065 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urkm_5F8E7D827D2C10A1=7}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=7}] urkm_5F8E7D827D2C10A1 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run tag @s[scores={urkm_5F8E7D827D2C10A1=10}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-60, rxm=-70] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=10}] urkm_5F8E7D827D2C10A1 11

    # 3
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tellraw @s { "rawtext": [ { "text": "Записано §a3" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_12343=4}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_12343=4}] urk_12343 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_12343=2}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_12343=2}] urk_12343 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_19D837AB277=4}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_19D837AB277=4}] urk_19D837AB277 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_ABC12345F=5}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_ABC12345F=5}] urk_ABC12345F 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_D0782133229=7}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_D0782133229=7}] urk_D0782133229 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_D0782133229=6}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_D0782133229=6}] urk_D0782133229 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_1398AACBC8=1}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_1398AACBC8=1}] urk_1398AACBC8 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run tag @s[scores={urk_F48DC3DBC=5}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-50, rxm=-60] run scoreboard players set @s[scores={urk_F48DC3DBC=5}] urk_F48DC3DBC 6

    # 4
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tellraw @s { "rawtext": [ { "text": "Записано §a4" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tag @s[scores={urk_12343=3}] add encoding_urk_12343
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run scoreboard players set @s[scores={urk_12343=3}] urk_12343 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tag @s[scores={urk_ABC12345F=6}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run scoreboard players set @s[scores={urk_ABC12345F=6}] urk_ABC12345F 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tag @s[scores={urk_98221DA8124=10}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run scoreboard players set @s[scores={urk_98221DA8124=10}] urk_98221DA8124 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run tag @s[scores={urk_F48DC3DBC=1}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-40, rxm=-50] run scoreboard players set @s[scores={urk_F48DC3DBC=1}] urk_F48DC3DBC 2

    # 5
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tellraw @s { "rawtext": [ { "text": "Записано §a5" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tag @s[scores={urk_ABC12345F=7}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run scoreboard players set @s[scores={urk_ABC12345F=7}] urk_ABC12345F 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tag @s[scores={urkm_AFB7125BF065=6}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run scoreboard players set @s[scores={urkm_AFB7125BF065=6}] urkm_AFB7125BF065 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tag @s[scores={urkm_AFB7125BF065=11}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run scoreboard players set @s[scores={urkm_AFB7125BF065=11}] urkm_AFB7125BF065 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run tag @s add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-30, rxm=-40] run scoreboard players set @s urkm_5F8E7D827D2C10A1 1

    # 6
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-20, rxm=-30] run tellraw @s { "rawtext": [ { "text": "Записано §a6" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-20, rxm=-30] run tag @s[scores={urkm_AFB7125BF065=10}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-20, rxm=-30] run scoreboard players set @s[scores={urkm_AFB7125BF065=10}] urkm_AFB7125BF065 11

    # 7
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tellraw @s { "rawtext": [ { "text": "Записано §a7" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urk_19D837AB277=5}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urk_19D837AB277=5}] urk_19D837AB277 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urk_19D837AB277=10}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urk_19D837AB277=10}] urk_19D837AB277 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urk_19D837AB277=9}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urk_19D837AB277=9}] urk_19D837AB277 10

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urk_D0782133229=2}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urk_D0782133229=2}] urk_D0782133229 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urkm_AFB7125BF065=3}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urkm_AFB7125BF065=3}] urkm_AFB7125BF065 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urkm_5F8E7D827D2C10A1=4}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=4}] urkm_5F8E7D827D2C10A1 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run tag @s[scores={urkm_5F8E7D827D2C10A1=8}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-10, rxm=-20] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=8}] urkm_5F8E7D827D2C10A1 9

    # 8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tellraw @s { "rawtext": [ { "text": "Записано §a8" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_19D837AB277=3}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_19D837AB277=3}] urk_19D837AB277 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_98221DA8124=1}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_98221DA8124=1}] urk_98221DA8124 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_98221DA8124=7}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_98221DA8124=7}] urk_98221DA8124 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_D0782133229=3}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_D0782133229=3}] urk_D0782133229 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_1398AACBC8=3}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_1398AACBC8=3}] urk_1398AACBC8 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_1398AACBC8=9}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_1398AACBC8=9}] urk_1398AACBC8 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urkm_5F8E7D827D2C10A1=2}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=2}] urkm_5F8E7D827D2C10A1 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urkm_5F8E7D827D2C10A1=6}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=6}] urkm_5F8E7D827D2C10A1 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run tag @s[scores={urk_F48DC3DBC=2}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=-0.001, rxm=-10] run scoreboard players set @s[scores={urk_F48DC3DBC=2}] urk_F48DC3DBC 3

    # 9
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tellraw @s { "rawtext": [ { "text": "Записано §a9" } ] }
        
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tag @s[scores={urk_19D837AB277=1}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run scoreboard players set @s[scores={urk_19D837AB277=1}] urk_19D837AB277 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tag @s add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run scoreboard players set @s urk_98221DA8124 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tag @s[scores={urk_D0782133229=10}] add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run scoreboard players set @s[scores={urk_D0782133229=10}] urk_D0782133229 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run tag @s[scores={urk_1398AACBC8=2}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=10, rxm=0] run scoreboard players set @s[scores={urk_1398AACBC8=2}] urk_1398AACBC8 3

    # A
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tellraw @s { "rawtext": [ { "text": "Записано §aA" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s[scores={urk_19D837AB277=6}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s[scores={urk_19D837AB277=6}] urk_19D837AB277 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s urk_ABC12345F 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s[scores={urk_98221DA8124=6}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s[scores={urk_98221DA8124=6}] urk_98221DA8124 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s urkm_AFB7125BF065 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s[scores={urk_1398AACBC8=5}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s[scores={urk_1398AACBC8=5}] urk_1398AACBC8 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s[scores={urk_1398AACBC8=4}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s[scores={urk_1398AACBC8=4}] urk_1398AACBC8 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run tag @s[scores={urkm_5F8E7D827D2C10A1=14}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=20, rxm=10] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=14}] urkm_5F8E7D827D2C10A1 15

    # B 
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tellraw @s { "rawtext": [ { "text": "Записано §aB" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urk_19D837AB277=7}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urk_19D837AB277=7}] urk_19D837AB277 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urk_ABC12345F=1}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urk_ABC12345F=1}] urk_ABC12345F 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urkm_AFB7125BF065=2}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urkm_AFB7125BF065=2}] urkm_AFB7125BF065 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urkm_AFB7125BF065=7}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urkm_AFB7125BF065=7}] urkm_AFB7125BF065 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urk_1398AACBC8=7}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urk_1398AACBC8=7}] urk_1398AACBC8 8

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run tag @s[scores={urk_F48DC3DBC=7}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=30, rxm=20] run scoreboard players set @s[scores={urk_F48DC3DBC=7}] urk_F48DC3DBC 8

    # C
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tellraw @s { "rawtext": [ { "text": "Записано §aC" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urk_ABC12345F=2}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urk_ABC12345F=2}] urk_ABC12345F 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urk_1398AACBC8=6}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urk_1398AACBC8=6}] urk_1398AACBC8 7

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urk_1398AACBC8=8}] add encoding_urk_1398AACBC8
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urk_1398AACBC8=8}] urk_1398AACBC8 9

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urkm_5F8E7D827D2C10A1=11}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=11}] urkm_5F8E7D827D2C10A1 12

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urk_F48DC3DBC=4}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urk_F48DC3DBC=4}] urk_F48DC3DBC 5

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run tag @s[scores={urk_F48DC3DBC=8}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=40, rxm=30] run scoreboard players set @s[scores={urk_F48DC3DBC=8}] urk_F48DC3DBC 99

    # D
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tellraw @s { "rawtext": [ { "text": "Записано §aD" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urk_19D837AB277=2}] add encoding_urk_19D837AB277
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urk_19D837AB277=2}] urk_19D837AB277 3

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s add encoding_urk_D0782133229
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s urk_D0782133229 1

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urk_98221DA8124=5}] add encoding_urk_98221DA8124
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urk_98221DA8124=5}] urk_98221DA8124 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urkm_5F8E7D827D2C10A1=5}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=5}] urkm_5F8E7D827D2C10A1 6

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urkm_5F8E7D827D2C10A1=9}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=9}] urkm_5F8E7D827D2C10A1 10

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urk_F48DC3DBC=3}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urk_F48DC3DBC=3}] urk_F48DC3DBC 4

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run tag @s[scores={urk_F48DC3DBC=6}] add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=50, rxm=40] run scoreboard players set @s[scores={urk_F48DC3DBC=6}] urk_F48DC3DBC 7

    # E
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=60, rxm=50] run tellraw @s { "rawtext": [ { "text": "Записано §aE" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=60, rxm=50] run tag @s[scores={urkm_5F8E7D827D2C10A1=3}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=60, rxm=50] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=3}] urkm_5F8E7D827D2C10A1 4

    # F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tellraw @s { "rawtext": [ { "text": "Записано §aF" } ] }

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tag @s[scores={urk_ABC12345F=8}] add encoding_urk_ABC12345F
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run scoreboard players set @s[scores={urk_ABC12345F=8}] urk_ABC12345F 99

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tag @s[scores={urkm_AFB7125BF065=1}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run scoreboard players set @s[scores={urkm_AFB7125BF065=1}] urkm_AFB7125BF065 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tag @s[scores={urkm_AFB7125BF065=8}] add encoding_urkm_AFB7125BF065
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run scoreboard players set @s[scores={urkm_AFB7125BF065=8}] urkm_AFB7125BF065 9

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tag @s[scores={urkm_5F8E7D827D2C10A1=1}] add encoding_urkm_5F8E7D827D2C10A1
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run scoreboard players set @s[scores={urkm_5F8E7D827D2C10A1=1}] urkm_5F8E7D827D2C10A1 2

        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run tag @s add encoding_urk_F48DC3DBC
        execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70, rxm=60] run scoreboard players set @s urk_F48DC3DBC 1


    # Обработка тегов
        scoreboard players set @s[rx=70, tag=!encoding_urk_12343] urk_12343 0
        tag @s[rx=70] remove encoding_urk_12343

        scoreboard players set @s[rx=70, tag=!encoding_urk_19D837AB277] urk_19D837AB277 0
        tag @s[rx=70] remove encoding_urk_19D837AB277

        scoreboard players set @s[rx=70, tag=!encoding_urk_D0782133229] urk_D0782133229 0
        tag @s[rx=70] remove encoding_urk_D0782133229

        scoreboard players set @s[rx=70, tag=!encoding_urk_ABC12345F] urk_ABC12345F 0
        tag @s[rx=70] remove encoding_urk_ABC12345F

        scoreboard players set @s[rx=70, tag=!encoding_urk_98221DA8124] urk_98221DA8124 0
        tag @s[rx=70] remove encoding_urk_98221DA8124

        scoreboard players set @s[rx=70, tag=!encoding_urk_0001] urk_0001 0
        tag @s[rx=70] remove encoding_urk_0001

        scoreboard players set @s[rx=70, tag=!encoding_urkm_AFB7125BF065] urkm_AFB7125BF065 0
        tag @s[rx=70] remove encoding_urkm_AFB7125BF065

        scoreboard players set @s[rx=70, tag=!encoding_urk_1398AACBC8] urk_1398AACBC8 0
        tag @s[rx=70] remove encoding_urk_1398AACBC8

        scoreboard players set @s[rx=70, tag=!encoding_urkm_5F8E7D827D2C10A1] urkm_5F8E7D827D2C10A1 0
        tag @s[rx=70] remove encoding_urkm_5F8E7D827D2C10A1

        scoreboard players set @s[rx=70, tag=!encoding_urk_F48DC3DBC] urk_F48DC3DBC 0
        tag @s[rx=70] remove encoding_urk_F48DC3DBC


# Недостаточно заряда, набор значения
    execute as @s[scores={battery_avail=1, battery_charge=..9}, rx=70] run tellraw @s { "rawtext": [ { "text": "§cНедостаточно заряда для набора значения! Требуется 10§fŐ" } ] }

# Списание заряда при наборе любого HEX числа
    execute as @s[scores={battery_avail=1, battery_charge=10..}, rx=70] run scoreboard players add @s battery_charge -10



# Достаточно заряда, активация

    # Общее сообщение + пик
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70] run playsound urk_activation_beep @a ~ ~ ~
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70, tag=!has_military_chip] run tellraw @s { "rawtext": [ { "text": "§aАктивировано!\n§bИспользуется стандартное URK шифрование" } ] }
        execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70, tag=has_military_chip] run tellraw @s { "rawtext": [ { "text": "§aАктивировано!\n§dИспользуется военное URK-M шифрование" } ] }

    # АКТИВАЦИИ
        # urk_12343 (тестовый код)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_12343=99}, rxm=70] run tellraw @s { "rawtext": [ { "text": "§a§oУспешно активирован тестовый код 1-2-3-4-3" } ] }

        # urk_19D837AB277 (открытие крысиной таверны)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_19D837AB277=99}, rxm=70] if entity @s[x=110, y=70, z=-46, dx=3, dy=3, dz=3] run fill 114 71 -45 114 72 -44 minecraft:air

        # urk_0001 (программная деактивация трассировки)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_0001=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=10.., e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run fill 16 44 -158 16 44 -158 arx:tracer_monitor_awaiting_adress
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_0001=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=10.., e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run scoreboard players set @a[scores={verify=2}] e19_tracer_condition 2

        # urk_D0782133229 (трассировка электиричества в магазин электроники)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_D0782133229=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=2, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run fill 16 44 -158 16 44 -158 arx:tracer_monitor_active
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_D0782133229=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=2, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run scoreboard players set @a[scores={verify=2}] e19_tracer_condition 10

        # urk_ABC12345F (логин в пк трассировщик в Э19)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_ABC12345F=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=1, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run fill 16 44 -158 16 44 -158 arx:tracer_monitor_awaiting_adress
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_ABC12345F=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=1, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run scoreboard players set @a[scores={verify=2}] e19_tracer_condition 2

        # urkm_AFB7125BF065 (открытие локации для боя с Мартом)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urkm_AFB7125BF065=99}, rxm=70, tag=has_military_chip] if entity @s[x=37, y=18, z=-193, dx=5, dy=4, dz=3] if entity @a[scores={verify=2, march_battle_time=!1..}] run fill 42 19 -192 42 21 -191 minecraft:air

        # urk_1398AACBC8 (открытие паркинга)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_1398AACBC8=99}, rxm=70] if entity @a[scores={verify=2, e19_generator_enabled=1}] if entity @s[x=17, y=-22, z=-160, dx=1, dy=3, dz=-3] run fill 17 -21 -163 17 -20 -163 minecraft:air

        # urk_98221DA8124 (открытие МЭ)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_98221DA8124=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=10}] if entity @s[x=-159, y=62, z=134, dx=-5, dy=4, dz=5] run fill -156 63 138 -156 63 138 minecraft:redstone_block

        # urkm_5F8E7D827D2C10A1 (открытие оклика-6)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urkm_5F8E7D827D2C10A1=99}, rxm=70, tag=has_military_chip] if entity @a[scores={verify=2, e19_tracer_condition=11}] if entity @s[x=-38, y=62, z=36, dx=4, dy=4, dz=-4] run fill -36 63 31 -36 64 31 minecraft:air

        # urk_F48DC3DBC (трассировка электиричества в магазин электроники)
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_F48DC3DBC=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=2, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run fill 16 44 -158 16 44 -158 arx:tracer_monitor_active
            execute as @s[scores={battery_avail=1, battery_charge=30.., urk_F48DC3DBC=99}, rxm=70] if entity @a[scores={verify=2, e19_tracer_condition=2, e19_generator_enabled=1}] if entity @s[x=15, y=42, z=-160, dx=3, dy=3, dz=2] run scoreboard players set @a[scores={verify=2}] e19_tracer_condition 11


# Недостаточно заряда, активация
    execute as @s[scores={battery_avail=1, battery_charge=..29}, rxm=70] run tellraw @s { "rawtext": [ { "text": "§cНедостаточно заряда для активации! Требуется 30§fŐ" } ] }

# Списание заряда
    execute as @s[scores={battery_avail=1, battery_charge=30..}, rxm=70] run scoreboard players add @s battery_charge -30

# Чистка
    tag @s remove has_military_chip