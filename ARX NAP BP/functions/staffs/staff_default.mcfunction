tag @s add self
tag @p[tag=!self, r=15] add self2

#Индексируем каналы
    tag @s[tag=staff_mono] add 1_channel

    tag @s[tag=staff_duo, rx=0] add 1_channel
    tag @s[tag=staff_duo, rxm=0.001] add 2_channel

    tag @s[tag=staff_trio, rx=-25] add 1_channel
    tag @s[tag=staff_trio, rx=25, rxm=-25] add 2_channel
    tag @s[tag=staff_trio, rxm=25] add 3_channel

    tag @s[tag=staff_quadro, rx=-40] add 1_channel
    tag @s[tag=staff_quadro, rxm=-40, rx=0] add 2_channel
    tag @s[tag=staff_quadro, rxm=0.001, rx=40] add 3_channel
    tag @s[tag=staff_quadro, rxm=40] add 4_channel

    tag @s[tag=staff_quintu, rx=-45] add 1_channel
    tag @s[tag=staff_quintu, rxm=-45, rx=-20] add 2_channel
    tag @s[tag=staff_quintu, rxm=-20, rx=20] add 3_channel
    tag @s[tag=staff_quintu, rxm=20, rx=45] add 4_channel
    tag @s[tag=staff_quintu, rxm=45] add 5_channel

    tag @s[tag=staff_sexto, rx=-60] add 1_channel
    tag @s[tag=staff_sexto, rxm=-60, rx=-30] add 2_channel
    tag @s[tag=staff_sexto, rxm=-30, rx=0] add 3_channel
    tag @s[tag=staff_sexto, rxm=0.001, rx=30] add 4_channel
    tag @s[tag=staff_sexto, rxm=30, rx=60] add 5_channel
    tag @s[tag=staff_sexto, rxm=60] add 6_channel



    #Отчёт о канале
        tellraw @s[tag=1_channel] { "rawtext": [ { "text": "§dI канал" } ] }
        tellraw @s[tag=2_channel] { "rawtext": [ { "text": "§dII канал" } ] }
        tellraw @s[tag=3_channel] { "rawtext": [ { "text": "§dIII канал" } ] }
        tellraw @s[tag=4_channel] { "rawtext": [ { "text": "§dIV канал" } ] }
        tellraw @s[tag=5_channel] { "rawtext": [ { "text": "§dV канал" } ] }
        tellraw @s[tag=6_channel] { "rawtext": [ { "text": "§dVI канал" } ] }

#Отчёт о цели
    tellraw @s[scores={target=1}] { "rawtext": [ { "text": "§f§oЦель: §aНа себя" } ] }
    tellraw @s[scores={target=2}] { "rawtext": [ { "text": "§f§oЦель: §cНа ближайшего" } ] }
    tellraw @s[scores={target=3}] { "rawtext": [ { "text": "§f§oЦель: §eНа животных и монстров" } ] }

# Устанавливаем контрольное значение стоимости заклинания
    scoreboard players set @s mp_req -1



# Индексация заклинаний
    # 1 канал
        execute as @s[tag=1_channel, scores={AAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=1_channel, scores={AAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=1_channel, scores={AAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=1_channel, scores={AAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=1_channel, scores={AAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=1_channel, scores={AAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=1_channel, scores={AAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=1_channel, scores={AAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=1_channel, scores={AAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=1_channel, scores={AAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=1_channel, scores={AAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=1_channel, scores={AAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=1_channel, scores={AAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=1_channel, scores={AAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=1_channel, scores={AAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=1_channel, scores={AAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=1_channel, scores={AAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=1_channel, scores={AAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=1_channel, scores={AAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=1_channel, scores={AAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=1_channel, scores={AAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=1_channel, scores={AAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=1_channel, scores={AAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=1_channel, scores={AAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=1_channel, scores={AAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=1_channel, scores={AAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=1_channel, scores={AAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=1_channel, scores={AAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=1_channel, scores={ABFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=1_channel, scores={ABFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=1_channel, scores={ABEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=1_channel, scores={ABEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=1_channel, scores={ABGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=1_channel, scores={ABG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=1_channel, scores={ABFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=1_channel, scores={ABFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=1_channel, scores={ABFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=1_channel, scores={ABFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=1_channel, scores={ABFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=1_channel, scores={ABFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=1_channel, scores={ABFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=1_channel, scores={ABFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=1_channel, scores={ABFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=1_channel, scores={ABFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=1_channel, scores={ABFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=1_channel, scores={ABFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=1_channel, scores={ABFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=1_channel, scores={ABFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=1_channel, scores={ABJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=1_channel, scores={ACFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=1_channel, scores={ACFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=1_channel, scores={ACFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=1_channel, scores={ACFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=1_channel, scores={ACFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=1_channel, scores={ACFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=1_channel, scores={ACFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=1_channel, scores={ACFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=1_channel, scores={ACFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=1_channel, scores={ACFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=1_channel, scores={ACFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=1_channel, scores={ACFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=1_channel, scores={ACFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=1_channel, scores={ACFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=1_channel, scores={ACFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=1_channel, scores={ACFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=1_channel, scores={ACFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=1_channel, scores={ACFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=1_channel, scores={ACFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=1_channel, scores={ACFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=1_channel, scores={ACFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=1_channel, scores={ACFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=1_channel, scores={ACFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=1_channel, scores={ACFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=1_channel, scores={ACFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=1_channel, scores={ACFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=1_channel, scores={ACFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=1_channel, scores={ACFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=1_channel, scores={ACFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=1_channel, scores={ACFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=1_channel, scores={ACFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=1_channel, scores={ACFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=1_channel, scores={ACFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=1_channel, scores={ACFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=1_channel, scores={ACFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=1_channel, scores={ACJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=1_channel, scores={ACG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=1_channel, scores={ACGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=1_channel, scores={ACF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=1_channel, scores={ACIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=1_channel, scores={ACIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=1_channel, scores={ACFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=1_channel, scores={ACFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=1_channel, scores={ACFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=1_channel, scores={ADITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=1_channel, scores={ADGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=1_channel, scores={ADFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=1_channel, scores={ADFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=1_channel, scores={ADFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=1_channel, scores={ADFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=1_channel, scores={ADFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=1_channel, scores={ADFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=1_channel, scores={ADEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=1_channel, scores={ADEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=1_channel, scores={ADEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=1_channel, scores={ADFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=1_channel, scores={ADFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=1_channel, scores={ADFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=1_channel, scores={ADFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=1_channel, scores={ADFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=1_channel, scores={ADFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=1_channel, scores={ADFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=1_channel, scores={ADFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=1_channel, scores={ADFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=1_channel, scores={ADET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=1_channel, scores={ADETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=1_channel, scores={ADETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=1_channel, scores={ADETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=1_channel, scores={ADEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=1_channel, scores={ADEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=1_channel, scores={ADEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=1_channel, scores={ADEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=1_channel, scores={ADEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=1_channel, scores={ADEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=1_channel, scores={ADEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=1_channel, scores={ADEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=1_channel, scores={ADEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=1_channel, scores={ADEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=1_channel, scores={ADFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=1_channel, scores={ADFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=1_channel, scores={ADFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=1_channel, scores={ADFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=1_channel, scores={ADFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=1_channel, scores={ADFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=1_channel, scores={ADFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=1_channel, scores={ADFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=1_channel, scores={ADEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=1_channel, scores={ADENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=1_channel, scores={ADENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=1_channel, scores={ADFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=1_channel, scores={ADFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=1_channel, scores={ADHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=1_channel, scores={ADFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=1_channel, scores={ADFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=1_channel, scores={ADFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=1_channel, scores={ADFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=1_channel, scores={ADIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=1_channel, scores={ADJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=1_channel, scores={ADJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=1_channel, scores={ADJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=1_channel, scores={ADJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=1_channel, scores={ADGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=1_channel, scores={ADG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=1_channel, scores={ADGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=1_channel, scores={ADGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=1_channel, scores={ADFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=1_channel, scores={ADFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=1_channel, scores={ADFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=1_channel, scores={ADI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=1_channel, scores={ADI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=1_channel, scores={ADI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=1_channel, scores={ADI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=1_channel, scores={ADIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=1_channel, scores={ADIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=1_channel, scores={ADIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=1_channel, scores={ADIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

    # 2 канал
        execute as @s[tag=2_channel, scores={BAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=2_channel, scores={BAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=2_channel, scores={BAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=2_channel, scores={BAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=2_channel, scores={BAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=2_channel, scores={BAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=2_channel, scores={BAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=2_channel, scores={BAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=2_channel, scores={BAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=2_channel, scores={BAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=2_channel, scores={BAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=2_channel, scores={BAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=2_channel, scores={BAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=2_channel, scores={BAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=2_channel, scores={BAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=2_channel, scores={BAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=2_channel, scores={BAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=2_channel, scores={BAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=2_channel, scores={BAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=2_channel, scores={BAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=2_channel, scores={BAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=2_channel, scores={BAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=2_channel, scores={BAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=2_channel, scores={BAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=2_channel, scores={BAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=2_channel, scores={BAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=2_channel, scores={BAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=2_channel, scores={BAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=2_channel, scores={BBFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=2_channel, scores={BBFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=2_channel, scores={BBEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=2_channel, scores={BBEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=2_channel, scores={BBGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=2_channel, scores={BBG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=2_channel, scores={BBFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=2_channel, scores={BBFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=2_channel, scores={BBFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=2_channel, scores={BBFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=2_channel, scores={BBFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=2_channel, scores={BBFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=2_channel, scores={BBFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=2_channel, scores={BBFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=2_channel, scores={BBFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=2_channel, scores={BBFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=2_channel, scores={BBFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=2_channel, scores={BBFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=2_channel, scores={BBFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=2_channel, scores={BBFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=2_channel, scores={BBJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=2_channel, scores={BCFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=2_channel, scores={BCFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=2_channel, scores={BCFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=2_channel, scores={BCFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=2_channel, scores={BCFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=2_channel, scores={BCFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=2_channel, scores={BCFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=2_channel, scores={BCFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=2_channel, scores={BCFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=2_channel, scores={BCFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=2_channel, scores={BCFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=2_channel, scores={BCFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=2_channel, scores={BCFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=2_channel, scores={BCFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=2_channel, scores={BCFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=2_channel, scores={BCFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=2_channel, scores={BCFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=2_channel, scores={BCFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=2_channel, scores={BCFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=2_channel, scores={BCFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=2_channel, scores={BCFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=2_channel, scores={BCFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=2_channel, scores={BCFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=2_channel, scores={BCFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=2_channel, scores={BCFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=2_channel, scores={BCFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=2_channel, scores={BCFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=2_channel, scores={BCFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=2_channel, scores={BCFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=2_channel, scores={BCFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=2_channel, scores={BCFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=2_channel, scores={BCFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=2_channel, scores={BCFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=2_channel, scores={BCFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=2_channel, scores={BCFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=2_channel, scores={BCJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=2_channel, scores={BCG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=2_channel, scores={BCGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=2_channel, scores={BCF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=2_channel, scores={BCIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=2_channel, scores={BCIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=2_channel, scores={BCFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=2_channel, scores={BCFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=2_channel, scores={BCFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=2_channel, scores={BDITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=2_channel, scores={BDGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=2_channel, scores={BDFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=2_channel, scores={BDFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=2_channel, scores={BDFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=2_channel, scores={BDFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=2_channel, scores={BDFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=2_channel, scores={BDFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=2_channel, scores={BDEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=2_channel, scores={BDEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=2_channel, scores={BDEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=2_channel, scores={BDFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=2_channel, scores={BDFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=2_channel, scores={BDFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=2_channel, scores={BDFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=2_channel, scores={BDFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=2_channel, scores={BDFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=2_channel, scores={BDFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=2_channel, scores={BDFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=2_channel, scores={BDFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=2_channel, scores={BDET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=2_channel, scores={BDETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=2_channel, scores={BDETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=2_channel, scores={BDETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=2_channel, scores={BDEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=2_channel, scores={BDEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=2_channel, scores={BDEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=2_channel, scores={BDEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=2_channel, scores={BDEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=2_channel, scores={BDEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=2_channel, scores={BDEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=2_channel, scores={BDEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=2_channel, scores={BDEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=2_channel, scores={BDEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=2_channel, scores={BDFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=2_channel, scores={BDFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=2_channel, scores={BDFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=2_channel, scores={BDFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=2_channel, scores={BDFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=2_channel, scores={BDFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=2_channel, scores={BDFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=2_channel, scores={BDFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=2_channel, scores={BDEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=2_channel, scores={BDENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=2_channel, scores={BDENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=2_channel, scores={BDFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=2_channel, scores={BDFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=2_channel, scores={BDHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=2_channel, scores={BDFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=2_channel, scores={BDFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=2_channel, scores={BDFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=2_channel, scores={BDFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=2_channel, scores={BDIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=2_channel, scores={BDJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=2_channel, scores={BDJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=2_channel, scores={BDJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=2_channel, scores={BDJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=2_channel, scores={BDGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=2_channel, scores={BDG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=2_channel, scores={BDGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=2_channel, scores={BDGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=2_channel, scores={BDFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=2_channel, scores={BDFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=2_channel, scores={BDFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=2_channel, scores={BDI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=2_channel, scores={BDI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=2_channel, scores={BDI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=2_channel, scores={BDI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=2_channel, scores={BDIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=2_channel, scores={BDIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=2_channel, scores={BDIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=2_channel, scores={BDIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

    # 3 канал
        execute as @s[tag=3_channel, scores={CAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=3_channel, scores={CAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=3_channel, scores={CAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=3_channel, scores={CAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=3_channel, scores={CAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=3_channel, scores={CAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=3_channel, scores={CAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=3_channel, scores={CAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=3_channel, scores={CAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=3_channel, scores={CAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=3_channel, scores={CAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=3_channel, scores={CAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=3_channel, scores={CAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=3_channel, scores={CAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=3_channel, scores={CAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=3_channel, scores={CAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=3_channel, scores={CAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=3_channel, scores={CAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=3_channel, scores={CAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=3_channel, scores={CAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=3_channel, scores={CAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=3_channel, scores={CAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=3_channel, scores={CAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=3_channel, scores={CAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=3_channel, scores={CAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=3_channel, scores={CAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=3_channel, scores={CAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=3_channel, scores={CAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=3_channel, scores={CBFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=3_channel, scores={CBFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=3_channel, scores={CBEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=3_channel, scores={CBEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=3_channel, scores={CBGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=3_channel, scores={CBG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=3_channel, scores={CBFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=3_channel, scores={CBFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=3_channel, scores={CBFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=3_channel, scores={CBFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=3_channel, scores={CBFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=3_channel, scores={CBFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=3_channel, scores={CBFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=3_channel, scores={CBFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=3_channel, scores={CBFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=3_channel, scores={CBFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=3_channel, scores={CBFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=3_channel, scores={CBFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=3_channel, scores={CBFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=3_channel, scores={CBFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=3_channel, scores={CBJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=3_channel, scores={CCFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=3_channel, scores={CCFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=3_channel, scores={CCFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=3_channel, scores={CCFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=3_channel, scores={CCFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=3_channel, scores={CCFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=3_channel, scores={CCFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=3_channel, scores={CCFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=3_channel, scores={CCFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=3_channel, scores={CCFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=3_channel, scores={CCFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=3_channel, scores={CCFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=3_channel, scores={CCFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=3_channel, scores={CCFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=3_channel, scores={CCFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=3_channel, scores={CCFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=3_channel, scores={CCFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=3_channel, scores={CCFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=3_channel, scores={CCFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=3_channel, scores={CCFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=3_channel, scores={CCFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=3_channel, scores={CCFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=3_channel, scores={CCFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=3_channel, scores={CCFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=3_channel, scores={CCFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=3_channel, scores={CCFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=3_channel, scores={CCFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=3_channel, scores={CCFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=3_channel, scores={CCFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=3_channel, scores={CCFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=3_channel, scores={CCFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=3_channel, scores={CCFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=3_channel, scores={CCFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=3_channel, scores={CCFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=3_channel, scores={CCFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=3_channel, scores={CCJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=3_channel, scores={CCG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=3_channel, scores={CCGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=3_channel, scores={CCF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=3_channel, scores={CCIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=3_channel, scores={CCIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=3_channel, scores={CCFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=3_channel, scores={CCFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=3_channel, scores={CCFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=3_channel, scores={CDITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=3_channel, scores={CDGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=3_channel, scores={CDFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=3_channel, scores={CDFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=3_channel, scores={CDFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=3_channel, scores={CDFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=3_channel, scores={CDFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=3_channel, scores={CDFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=3_channel, scores={CDEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=3_channel, scores={CDEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=3_channel, scores={CDEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=3_channel, scores={CDFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=3_channel, scores={CDFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=3_channel, scores={CDFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=3_channel, scores={CDFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=3_channel, scores={CDFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=3_channel, scores={CDFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=3_channel, scores={CDFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=3_channel, scores={CDFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=3_channel, scores={CDFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=3_channel, scores={CDET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=3_channel, scores={CDETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=3_channel, scores={CDETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=3_channel, scores={CDETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=3_channel, scores={CDEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=3_channel, scores={CDEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=3_channel, scores={CDEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=3_channel, scores={CDEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=3_channel, scores={CDEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=3_channel, scores={CDEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=3_channel, scores={CDEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=3_channel, scores={CDEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=3_channel, scores={CDEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=3_channel, scores={CDEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=3_channel, scores={CDFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=3_channel, scores={CDFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=3_channel, scores={CDFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=3_channel, scores={CDFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=3_channel, scores={CDFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=3_channel, scores={CDFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=3_channel, scores={CDFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=3_channel, scores={CDFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=3_channel, scores={CDEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=3_channel, scores={CDENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=3_channel, scores={CDENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=3_channel, scores={CDFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=3_channel, scores={CDFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=3_channel, scores={CDHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=3_channel, scores={CDFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=3_channel, scores={CDFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=3_channel, scores={CDFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=3_channel, scores={CDFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=3_channel, scores={CDIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=3_channel, scores={CDJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=3_channel, scores={CDJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=3_channel, scores={CDJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=3_channel, scores={CDJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=3_channel, scores={CDGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=3_channel, scores={CDG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=3_channel, scores={CDGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=3_channel, scores={CDGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=3_channel, scores={CDFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=3_channel, scores={CDFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=3_channel, scores={CDFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=3_channel, scores={CDI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=3_channel, scores={CDI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=3_channel, scores={CDI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=3_channel, scores={CDI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=3_channel, scores={CDIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=3_channel, scores={CDIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=3_channel, scores={CDIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=3_channel, scores={CDIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

    # 4 канал
        execute as @s[tag=4_channel, scores={DAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=4_channel, scores={DAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=4_channel, scores={DAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=4_channel, scores={DAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=4_channel, scores={DAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=4_channel, scores={DAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=4_channel, scores={DAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=4_channel, scores={DAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=4_channel, scores={DAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=4_channel, scores={DAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=4_channel, scores={DAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=4_channel, scores={DAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=4_channel, scores={DAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=4_channel, scores={DAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=4_channel, scores={DAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=4_channel, scores={DAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=4_channel, scores={DAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=4_channel, scores={DAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=4_channel, scores={DAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=4_channel, scores={DAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=4_channel, scores={DAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=4_channel, scores={DAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=4_channel, scores={DAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=4_channel, scores={DAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=4_channel, scores={DAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=4_channel, scores={DAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=4_channel, scores={DAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=4_channel, scores={DAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=4_channel, scores={DBFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=4_channel, scores={DBFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=4_channel, scores={DBEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=4_channel, scores={DBEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=4_channel, scores={DBGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=4_channel, scores={DBG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=4_channel, scores={DBFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=4_channel, scores={DBFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=4_channel, scores={DBFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=4_channel, scores={DBFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=4_channel, scores={DBFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=4_channel, scores={DBFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=4_channel, scores={DBFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=4_channel, scores={DBFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=4_channel, scores={DBFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=4_channel, scores={DBFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=4_channel, scores={DBFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=4_channel, scores={DBFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=4_channel, scores={DBFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=4_channel, scores={DBFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=4_channel, scores={DBJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=4_channel, scores={DCFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=4_channel, scores={DCFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=4_channel, scores={DCFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=4_channel, scores={DCFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=4_channel, scores={DCFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=4_channel, scores={DCFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=4_channel, scores={DCFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=4_channel, scores={DCFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=4_channel, scores={DCFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=4_channel, scores={DCFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=4_channel, scores={DCFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=4_channel, scores={DCFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=4_channel, scores={DCFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=4_channel, scores={DCFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=4_channel, scores={DCFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=4_channel, scores={DCFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=4_channel, scores={DCFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=4_channel, scores={DCFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=4_channel, scores={DCFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=4_channel, scores={DCFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=4_channel, scores={DCFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=4_channel, scores={DCFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=4_channel, scores={DCFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=4_channel, scores={DCFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=4_channel, scores={DCFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=4_channel, scores={DCFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=4_channel, scores={DCFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=4_channel, scores={DCFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=4_channel, scores={DCFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=4_channel, scores={DCFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=4_channel, scores={DCFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=4_channel, scores={DCFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=4_channel, scores={DCFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=4_channel, scores={DCFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=4_channel, scores={DCFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=4_channel, scores={DCJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=4_channel, scores={DCG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=4_channel, scores={DCGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=4_channel, scores={DCF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=4_channel, scores={DCIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=4_channel, scores={DCIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=4_channel, scores={DCFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=4_channel, scores={DCFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=4_channel, scores={DCFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=4_channel, scores={DDITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=4_channel, scores={DDGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=4_channel, scores={DDFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=4_channel, scores={DDFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=4_channel, scores={DDFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=4_channel, scores={DDFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=4_channel, scores={DDFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=4_channel, scores={DDFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=4_channel, scores={DDEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=4_channel, scores={DDEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=4_channel, scores={DDEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=4_channel, scores={DDFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=4_channel, scores={DDFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=4_channel, scores={DDFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=4_channel, scores={DDFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=4_channel, scores={DDFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=4_channel, scores={DDFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=4_channel, scores={DDFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=4_channel, scores={DDFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=4_channel, scores={DDFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=4_channel, scores={DDET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=4_channel, scores={DDETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=4_channel, scores={DDETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=4_channel, scores={DDETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=4_channel, scores={DDEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=4_channel, scores={DDEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=4_channel, scores={DDEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=4_channel, scores={DDEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=4_channel, scores={DDEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=4_channel, scores={DDEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=4_channel, scores={DDEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=4_channel, scores={DDEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=4_channel, scores={DDEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=4_channel, scores={DDEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=4_channel, scores={DDFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=4_channel, scores={DDFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=4_channel, scores={DDFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=4_channel, scores={DDFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=4_channel, scores={DDFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=4_channel, scores={DDFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=4_channel, scores={DDFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=4_channel, scores={DDFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=4_channel, scores={DDEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=4_channel, scores={DDENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=4_channel, scores={DDENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=4_channel, scores={DDFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=4_channel, scores={DDFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=4_channel, scores={DDHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=4_channel, scores={DDFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=4_channel, scores={DDFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=4_channel, scores={DDFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=4_channel, scores={DDFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=4_channel, scores={DDIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=4_channel, scores={DDJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=4_channel, scores={DDJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=4_channel, scores={DDJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=4_channel, scores={DDJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=4_channel, scores={DDGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=4_channel, scores={DDG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=4_channel, scores={DDGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=4_channel, scores={DDGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=4_channel, scores={DDFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=4_channel, scores={DDFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=4_channel, scores={DDFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=4_channel, scores={DDI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=4_channel, scores={DDI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=4_channel, scores={DDI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=4_channel, scores={DDI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=4_channel, scores={DDIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=4_channel, scores={DDIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=4_channel, scores={DDIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=4_channel, scores={DDIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

    # 5 канал
        execute as @s[tag=5_channel, scores={EAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=5_channel, scores={EAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=5_channel, scores={EAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=5_channel, scores={EAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=5_channel, scores={EAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=5_channel, scores={EAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=5_channel, scores={EAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=5_channel, scores={EAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=5_channel, scores={EAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=5_channel, scores={EAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=5_channel, scores={EAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=5_channel, scores={EAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=5_channel, scores={EAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=5_channel, scores={EAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=5_channel, scores={EAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=5_channel, scores={EAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=5_channel, scores={EAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=5_channel, scores={EAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=5_channel, scores={EAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=5_channel, scores={EAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=5_channel, scores={EAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=5_channel, scores={EAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=5_channel, scores={EAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=5_channel, scores={EAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=5_channel, scores={EAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=5_channel, scores={EAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=5_channel, scores={EAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=5_channel, scores={EAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=5_channel, scores={EBFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=5_channel, scores={EBFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=5_channel, scores={EBEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=5_channel, scores={EBEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=5_channel, scores={EBGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=5_channel, scores={EBG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=5_channel, scores={EBFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=5_channel, scores={EBFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=5_channel, scores={EBFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=5_channel, scores={EBFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=5_channel, scores={EBFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=5_channel, scores={EBFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=5_channel, scores={EBFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=5_channel, scores={EBFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=5_channel, scores={EBFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=5_channel, scores={EBFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=5_channel, scores={EBFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=5_channel, scores={EBFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=5_channel, scores={EBFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=5_channel, scores={EBFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=5_channel, scores={EBJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=5_channel, scores={ECFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=5_channel, scores={ECFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=5_channel, scores={ECFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=5_channel, scores={ECFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=5_channel, scores={ECFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=5_channel, scores={ECFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=5_channel, scores={ECFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=5_channel, scores={ECFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=5_channel, scores={ECFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=5_channel, scores={ECFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=5_channel, scores={ECFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=5_channel, scores={ECFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=5_channel, scores={ECFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=5_channel, scores={ECFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=5_channel, scores={ECFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=5_channel, scores={ECFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=5_channel, scores={ECFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=5_channel, scores={ECFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=5_channel, scores={ECFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=5_channel, scores={ECFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=5_channel, scores={ECFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=5_channel, scores={ECFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=5_channel, scores={ECFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=5_channel, scores={ECFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=5_channel, scores={ECFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=5_channel, scores={ECFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=5_channel, scores={ECFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=5_channel, scores={ECFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=5_channel, scores={ECFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=5_channel, scores={ECFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=5_channel, scores={ECFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=5_channel, scores={ECFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=5_channel, scores={ECFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=5_channel, scores={ECFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=5_channel, scores={ECFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=5_channel, scores={ECJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=5_channel, scores={ECG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=5_channel, scores={ECGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=5_channel, scores={ECF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=5_channel, scores={ECIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=5_channel, scores={ECIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=5_channel, scores={ECFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=5_channel, scores={ECFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=5_channel, scores={ECFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=5_channel, scores={EDITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=5_channel, scores={EDGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=5_channel, scores={EDFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=5_channel, scores={EDFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=5_channel, scores={EDFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=5_channel, scores={EDFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=5_channel, scores={EDFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=5_channel, scores={EDFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=5_channel, scores={EDEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=5_channel, scores={EDEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=5_channel, scores={EDEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=5_channel, scores={EDFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=5_channel, scores={EDFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=5_channel, scores={EDFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=5_channel, scores={EDFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=5_channel, scores={EDFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=5_channel, scores={EDFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=5_channel, scores={EDFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=5_channel, scores={EDFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=5_channel, scores={EDFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=5_channel, scores={EDET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=5_channel, scores={EDETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=5_channel, scores={EDETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=5_channel, scores={EDETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=5_channel, scores={EDEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=5_channel, scores={EDEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=5_channel, scores={EDEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=5_channel, scores={EDEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=5_channel, scores={EDEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=5_channel, scores={EDEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=5_channel, scores={EDEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=5_channel, scores={EDEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=5_channel, scores={EDEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=5_channel, scores={EDEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=5_channel, scores={EDFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=5_channel, scores={EDFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=5_channel, scores={EDFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=5_channel, scores={EDFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=5_channel, scores={EDFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=5_channel, scores={EDFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=5_channel, scores={EDFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=5_channel, scores={EDFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=5_channel, scores={EDEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=5_channel, scores={EDENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=5_channel, scores={EDENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=5_channel, scores={EDFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=5_channel, scores={EDFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=5_channel, scores={EDHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=5_channel, scores={EDFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=5_channel, scores={EDFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=5_channel, scores={EDFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=5_channel, scores={EDFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=5_channel, scores={EDIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=5_channel, scores={EDJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=5_channel, scores={EDJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=5_channel, scores={EDJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=5_channel, scores={EDJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=5_channel, scores={EDGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=5_channel, scores={EDG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=5_channel, scores={EDGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=5_channel, scores={EDGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=5_channel, scores={EDFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=5_channel, scores={EDFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=5_channel, scores={EDFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=5_channel, scores={EDI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=5_channel, scores={EDI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=5_channel, scores={EDI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=5_channel, scores={EDI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=5_channel, scores={EDIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=5_channel, scores={EDIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=5_channel, scores={EDIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=5_channel, scores={EDIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

    # 6 канал
        execute as @s[tag=6_channel, scores={FAEK=99}] at @s run function spells/kon/AKAJAV
        execute as @s[tag=6_channel, scores={FAEKЗ=99}] at @s run function spells/kon/AKAJAVAD
        execute as @s[tag=6_channel, scores={FAEKЖ=99}] at @s run function spells/kon/AKAJAVAS
        execute as @s[tag=6_channel, scores={FAEKЗЖ=99}] at @s run function spells/kon/AKAJAVADAS
        execute as @s[tag=6_channel, scores={FAEKЖЗ=99}] at @s run function spells/kon/AKAJAVASAD
        execute as @s[tag=6_channel, scores={FAEKГ=99}] at @s run function spells/kon/AKAJAVAP
        execute as @s[tag=6_channel, scores={FAEKГЗ=99}] at @s run function spells/kon/AKAJAVAPAD
        execute as @s[tag=6_channel, scores={FAEKГГГ=99}] at @s run function spells/kon/AKAJAVAPAPAP
        execute as @s[tag=6_channel, scores={FAEKД=99}] at @s run function spells/kon/AKAJAVAN
        execute as @s[tag=6_channel, scores={FAEKДГ=99}] at @s run function spells/kon/AKAJAVANAP
        execute as @s[tag=6_channel, scores={FAEKSГГГ=99}] at @s run function spells/kon/AKAJAVAOAPAPAP
        execute as @s[tag=6_channel, scores={FAEL=99}] at @s run function spells/kon/AKAJAR
        execute as @s[tag=6_channel, scores={FAELГ=99}] at @s run function spells/kon/AKAJARAP
        execute as @s[tag=6_channel, scores={FAEWM=99}] at @s run function spells/kon/AKAJAFAL
        execute as @s[tag=6_channel, scores={FAEWMГ=99}] at @s run function spells/kon/AKAJAFALAP
        execute as @s[tag=6_channel, scores={FAEWMГГГ=99}] at @s run function spells/kon/AKAJAFALAPAPAP
        execute as @s[tag=6_channel, scores={FAEW=99}] at @s run function spells/kon/AKAJAF
        execute as @s[tag=6_channel, scores={FAEWГ=99}] at @s run function spells/kon/AKAJAFAP
        execute as @s[tag=6_channel, scores={FAEWЗ=99}] at @s run function spells/kon/AKAJAFAD
        execute as @s[tag=6_channel, scores={FAFW=99}] at @s run function spells/kon/AKBEAF
        execute as @s[tag=6_channel, scores={FAFWГ=99}] at @s run function spells/kon/AKBEAFAP
        execute as @s[tag=6_channel, scores={FAGЗ=99}] at @s run function spells/kon/AKAQAD
        execute as @s[tag=6_channel, scores={FAG=99}] at @s run function spells/kon/AKAQ
        execute as @s[tag=6_channel, scores={FAJ=99}] at @s run function spells/kon/AKAH
        execute as @s[tag=6_channel, scores={FAE1=99}] at @s run function spells/kon/AKAJBF
        execute as @s[tag=6_channel, scores={FAE1Г=99}] at @s run function spells/kon/AKAJBFAP
        execute as @s[tag=6_channel, scores={FAE2=99}] at @s run function spells/kon/AKAJBG
        execute as @s[tag=6_channel, scores={FAE2Г=99}] at @s run function spells/kon/AKAJBGAP
        execute as @s[tag=6_channel, scores={FBFV=99}] at @s run function spells/sin/AXBEAB
        execute as @s[tag=6_channel, scores={FBFVГ=99}] at @s run function spells/sin/AXBEABAP
        execute as @s[tag=6_channel, scores={FBEV=99}] at @s run function spells/sin/AXAJAB
        execute as @s[tag=6_channel, scores={FBEVГ=99}] at @s run function spells/sin/AXAJABAP
        execute as @s[tag=6_channel, scores={FBGЗ=99}] at @s run function spells/sin/AXAQAD
        execute as @s[tag=6_channel, scores={FBG=99}] at @s run function spells/sin/AXAQ
        execute as @s[tag=6_channel, scores={FBFQ=99}] at @s run function spells/sin/AXBEAY
        execute as @s[tag=6_channel, scores={FBFQЗ=99}] at @s run function spells/sin/AXBEAYAD
        execute as @s[tag=6_channel, scores={FBFQЖ=99}] at @s run function spells/sin/AXBEAYAS
        execute as @s[tag=6_channel, scores={FBFQГ=99}] at @s run function spells/sin/AXBEAYAP
        execute as @s[tag=6_channel, scores={FBFQГЗ=99}] at @s run function spells/sin/AXBEAYAPAD
        execute as @s[tag=6_channel, scores={FBFQГЖ=99}] at @s run function spells/sin/AXBEAYAPAS
        execute as @s[tag=6_channel, scores={FBFQГГ=99}] at @s run function spells/sin/AXBEAYAPAP
        execute as @s[tag=6_channel, scores={FBFQГГГ=99}] at @s run function spells/sin/AXBEAYAPAPAP
        execute as @s[tag=6_channel, scores={FBFБ=99}] at @s run function spells/sin/AXBEBB
        execute as @s[tag=6_channel, scores={FBFБГ=99}] at @s run function spells/sin/AXBEBBAP
        execute as @s[tag=6_channel, scores={FBFБГГГ=99}] at @s run function spells/sin/AXBEBBAPAPAP
        execute as @s[tag=6_channel, scores={FBFБZ=99}] at @s run function spells/sin/AXBEBBAU
        execute as @s[tag=6_channel, scores={FBFБZГ=99}] at @s run function spells/sin/AXBEBBAUAP
        execute as @s[tag=6_channel, scores={FBFБZГГГ=99}] at @s run function spells/sin/AXBEBBAUAPAPAP
        execute as @s[tag=6_channel, scores={FBJ=99}] at @s run function spells/sin/AXAH
        execute as @s[tag=6_channel, scores={FCFP=99}] at @s run function spells/san/ATBEAW
        execute as @s[tag=6_channel, scores={FCFPГ=99}] at @s run function spells/san/ATBEAWAP
        execute as @s[tag=6_channel, scores={FCFPГГ=99}] at @s run function spells/san/ATBEAWAPAP
        execute as @s[tag=6_channel, scores={FCFPГГГ=99}] at @s run function spells/san/ATBEAWAPAPAP
        execute as @s[tag=6_channel, scores={FCFPM=99}] at @s run function spells/san/ATBEAWAL
        execute as @s[tag=6_channel, scores={FCFPMГ=99}] at @s run function spells/san/ATBEAWALAP
        execute as @s[tag=6_channel, scores={FCFPMГГГ=99}] at @s run function spells/san/ATBEAWALAPAPAP
        execute as @s[tag=6_channel, scores={FCFPMЗ=99}] at @s run function spells/san/ATBEAWALAD
        execute as @s[tag=6_channel, scores={FCFPMГЗ=99}] at @s run function spells/san/ATBEAWALAPAD
        execute as @s[tag=6_channel, scores={FCFPMГГГЗ=99}] at @s run function spells/san/ATBEAWALAPAPAPAD
        execute as @s[tag=6_channel, scores={FCFPW=99}] at @s run function spells/san/ATBEAWAF
        execute as @s[tag=6_channel, scores={FCFPWЗ=99}] at @s run function spells/san/ATBEAWAFAD
        execute as @s[tag=6_channel, scores={FCFT=99}] at @s run function spells/san/ATBEBD
        execute as @s[tag=6_channel, scores={FCFTЖ=99}] at @s run function spells/san/ATBEBDAS
        execute as @s[tag=6_channel, scores={FCFTЗ=99}] at @s run function spells/san/ATBEBDAD
        execute as @s[tag=6_channel, scores={FCFQ=99}] at @s run function spells/san/ATBEAY
        execute as @s[tag=6_channel, scores={FCFQЖ=99}] at @s run function spells/san/ATBEAYAS
        execute as @s[tag=6_channel, scores={FCFQЗ=99}] at @s run function spells/san/ATBEAYAD
        execute as @s[tag=6_channel, scores={FCFQГ=99}] at @s run function spells/san/ATBEAYAP
        execute as @s[tag=6_channel, scores={FCFQГЗ=99}] at @s run function spells/san/ATBEAYAPAD
        execute as @s[tag=6_channel, scores={FCFZ=99}] at @s run function spells/san/ATBEAU
        execute as @s[tag=6_channel, scores={FCFZЖ=99}] at @s run function spells/san/ATBEAUAS
        execute as @s[tag=6_channel, scores={FCFZЗ=99}] at @s run function spells/san/ATBEAUAD
        execute as @s[tag=6_channel, scores={FCFO=99}] at @s run function spells/san/ATBEAI
        execute as @s[tag=6_channel, scores={FCFOЗ=99}] at @s run function spells/san/ATBEAIAD
        execute as @s[tag=6_channel, scores={FCFOЖ=99}] at @s run function spells/san/ATBEAIAS
        execute as @s[tag=6_channel, scores={FCFOГ=99}] at @s run function spells/san/ATBEAIAP
        execute as @s[tag=6_channel, scores={FCFOГЗ=99}] at @s run function spells/san/ATBEAIAPAD
        execute as @s[tag=6_channel, scores={FCFOГЖ=99}] at @s run function spells/san/ATBEAIAPAS
        execute as @s[tag=6_channel, scores={FCFOГГГ=99}] at @s run function spells/san/ATBEAIAPAPAP
        execute as @s[tag=6_channel, scores={FCFOГГГЗ=99}] at @s run function spells/san/ATBEAIAPAPAPAD
        execute as @s[tag=6_channel, scores={FCFOГГГЖ=99}] at @s run function spells/san/ATBEAIAPAPAPAS
        execute as @s[tag=6_channel, scores={FCFOQГГГ=99}] at @s run function spells/san/ATBEAIAYAPAPAP
        execute as @s[tag=6_channel, scores={FCFOQГГГЗ=99}] at @s run function spells/san/ATBEAIAYAPAPAPAD
        execute as @s[tag=6_channel, scores={FCFS=99}] at @s run function spells/san/ATBEAO
        execute as @s[tag=6_channel, scores={FCJ=99}] at @s run function spells/san/ATAH
        execute as @s[tag=6_channel, scores={FCG=99}] at @s run function spells/san/ATAQ
        execute as @s[tag=6_channel, scores={FCGЗ=99}] at @s run function spells/san/ATAQAD
        execute as @s[tag=6_channel, scores={FCF2=99}] at @s run function spells/san/ATBEBG
        execute as @s[tag=6_channel, scores={FCIU=99}] at @s run function spells/san/ATBAAG
        execute as @s[tag=6_channel, scores={FCIUГ=99}] at @s run function spells/san/ATBAAGAP
        execute as @s[tag=6_channel, scores={FCFPU=99}] at @s run function spells/san/ATBEAWAG
        execute as @s[tag=6_channel, scores={FCFPUЖ=99}] at @s run function spells/san/ATBEAWAGAS
        execute as @s[tag=6_channel, scores={FCFPUГГГЖ=99}] at @s run function spells/san/ATBEAWAGAPAPAPAS
        execute as @s[tag=6_channel, scores={FDITX=99}] at @s run function spells/din/ACBABDBC
        execute as @s[tag=6_channel, scores={FDGZЗ=99}] at @s run function spells/din/ACAQAUAD
        execute as @s[tag=6_channel, scores={FDFM=99}] at @s run function spells/din/ACBEAL
        execute as @s[tag=6_channel, scores={FDFMP=99}] at @s run function spells/din/ACBEALAW
        execute as @s[tag=6_channel, scores={FDFPZЖ=99}] at @s run function spells/din/ACBEAWAUAS
        execute as @s[tag=6_channel, scores={FDFY=99}] at @s run function spells/din/ACBEAM
        execute as @s[tag=6_channel, scores={FDFYГ=99}] at @s run function spells/din/ACBEAMAP
        execute as @s[tag=6_channel, scores={FDFYГГГ=99}] at @s run function spells/din/ACBEAMAPAPAP
        execute as @s[tag=6_channel, scores={FDEY=99}] at @s run function spells/din/ACAJAM
        execute as @s[tag=6_channel, scores={FDEYГ=99}] at @s run function spells/din/ACAJAMAP
        execute as @s[tag=6_channel, scores={FDEYГГГ=99}] at @s run function spells/din/ACAJAMAPAPAP
        execute as @s[tag=6_channel, scores={FDFБX=99}] at @s run function spells/din/ACBEBBBC
        execute as @s[tag=6_channel, scores={FDFБXK=99}] at @s run function spells/din/ACBEBBBCAV
        execute as @s[tag=6_channel, scores={FDFXY=99}] at @s run function spells/din/ACBEBCAM
        execute as @s[tag=6_channel, scores={FDFXYГ=99}] at @s run function spells/din/ACBEBCAMAP
        execute as @s[tag=6_channel, scores={FDFXYГГГ=99}] at @s run function spells/din/ACBEBCAMAPAPAP
        execute as @s[tag=6_channel, scores={FDFБ=99}] at @s run function spells/din/ACBEBB
        execute as @s[tag=6_channel, scores={FDFБS=99}] at @s run function spells/din/ACBEBBAO
        execute as @s[tag=6_channel, scores={FDFБM=99}] at @s run function spells/din/ACBEBBAL
        execute as @s[tag=6_channel, scores={FDFT=99}] at @s run function spells/din/ACBEBD
        execute as @s[tag=6_channel, scores={FDET=99}] at @s run function spells/din/ACAJBD
        execute as @s[tag=6_channel, scores={FDETГ=99}] at @s run function spells/din/ACAJBDAP
        execute as @s[tag=6_channel, scores={FDETЗ=99}] at @s run function spells/din/ACAJBDAD
        execute as @s[tag=6_channel, scores={FDETГЗ=99}] at @s run function spells/din/ACAJBDAPAD
        execute as @s[tag=6_channel, scores={FDEZ=99}] at @s run function spells/din/ACAJAU
        execute as @s[tag=6_channel, scores={FDEZГ=99}] at @s run function spells/din/ACAJAUAP
        execute as @s[tag=6_channel, scores={FDEZГГГ=99}] at @s run function spells/din/ACAJAUAPAPAP
        execute as @s[tag=6_channel, scores={FDEZЗ=99}] at @s run function spells/din/ACAJAUAD
        execute as @s[tag=6_channel, scores={FDEZГЗ=99}] at @s run function spells/din/ACAJAUAPAD
        execute as @s[tag=6_channel, scores={FDEZM=99}] at @s run function spells/din/ACAJAUAL
        execute as @s[tag=6_channel, scores={FDEZMГ=99}] at @s run function spells/din/ACAJAUALAP
        execute as @s[tag=6_channel, scores={FDEZMГГГ=99}] at @s run function spells/din/ACAJAUALAPAPAP
        execute as @s[tag=6_channel, scores={FDEZMЗ=99}] at @s run function spells/din/ACAJAUALAD
        execute as @s[tag=6_channel, scores={FDEZMГЗ=99}] at @s run function spells/din/ACAJAUALAPAD
        execute as @s[tag=6_channel, scores={FDFZ=99}] at @s run function spells/din/ACBEAU
        execute as @s[tag=6_channel, scores={FDFZГ=99}] at @s run function spells/din/ACBEAUAP
        execute as @s[tag=6_channel, scores={FDFZГГГ=99}] at @s run function spells/din/ACBEAUAPAPAP
        execute as @s[tag=6_channel, scores={FDFZMГ=99}] at @s run function spells/din/ACBEAUALAP
        execute as @s[tag=6_channel, scores={FDFZЗ=99}] at @s run function spells/din/ACBEAUAD
        execute as @s[tag=6_channel, scores={FDFZГЗ=99}] at @s run function spells/din/ACBEAUAPAD
        execute as @s[tag=6_channel, scores={FDFZГГГЗ=99}] at @s run function spells/din/ACBEAUAPAPAPAD
        execute as @s[tag=6_channel, scores={FDFZЖ=99}] at @s run function spells/din/ACBEAUAS
        execute as @s[tag=6_channel, scores={FDEN=99}] at @s run function spells/din/ACAJAE
        execute as @s[tag=6_channel, scores={FDENГ=99}] at @s run function spells/din/ACAJAEAP
        execute as @s[tag=6_channel, scores={FDENГГГ=99}] at @s run function spells/din/ACAJAEAPAPAP
        execute as @s[tag=6_channel, scores={FDFNГ=99}] at @s run function spells/din/ACBEAEAP
        execute as @s[tag=6_channel, scores={FDFNГГГ=99}] at @s run function spells/din/ACBEAEAPAPAP
        execute as @s[tag=6_channel, scores={FDHXZTUГЖЗ=99}] at @s run function spells/din/ACAABCAUBDAGAPASAD
        execute as @s[tag=6_channel, scores={FDFXMД=99}] at @s run function spells/din/ACBEBCALAN
        execute as @s[tag=6_channel, scores={FDFXMГ=99}] at @s run function spells/din/ACBEBCALAP
        execute as @s[tag=6_channel, scores={FDFXMГГ=99}] at @s run function spells/din/ACBEBCALAPAP
        execute as @s[tag=6_channel, scores={FDFXMГГГ=99}] at @s run function spells/din/ACBEBCALAPAPAP
        execute as @s[tag=6_channel, scores={FDIR=99}] at @s run function spells/din/ACBAAZ
        execute as @s[tag=6_channel, scores={FDJM=99}] at @s run function spells/din/ACAHAL
        execute as @s[tag=6_channel, scores={FDJMГ=99}] at @s run function spells/din/ACAHALAP
        execute as @s[tag=6_channel, scores={FDJ=99}] at @s run function spells/din/ACAH
        execute as @s[tag=6_channel, scores={FDJZ=99}] at @s run function spells/din/ACAHAU
        execute as @s[tag=6_channel, scores={FDGЗ=99}] at @s run function spells/din/ACAQAD
        execute as @s[tag=6_channel, scores={FDG=99}] at @s run function spells/din/ACAQ
        execute as @s[tag=6_channel, scores={FDGД=99}] at @s run function spells/din/ACAQAN
        execute as @s[tag=6_channel, scores={FDGДЗ=99}] at @s run function spells/din/ACAQANAD
        execute as @s[tag=6_channel, scores={FDFXP=99}] at @s run function spells/din/ACBEBCAW
        execute as @s[tag=6_channel, scores={FDFXPГ=99}] at @s run function spells/din/ACBEBCAWAP
        execute as @s[tag=6_channel, scores={FDFXPГГГ=99}] at @s run function spells/din/ACBEBCAWAPAPAP
        execute as @s[tag=6_channel, scores={FDI2=99}] at @s run function spells/din/ACBABG
        execute as @s[tag=6_channel, scores={FDI2K=99}] at @s run function spells/din/ACBABGAV
        execute as @s[tag=6_channel, scores={FDI2M=99}] at @s run function spells/din/ACBABGAL
        execute as @s[tag=6_channel, scores={FDI2MK=99}] at @s run function spells/din/ACBABGALAV
        execute as @s[tag=6_channel, scores={FDIU=99}] at @s run function spells/din/ACBAAG
        execute as @s[tag=6_channel, scores={FDIUЖ=99}] at @s run function spells/din/ACBAAGAS
        execute as @s[tag=6_channel, scores={FDIUГГГ=99}] at @s run function spells/din/ACBAAGAPAPAP
        execute as @s[tag=6_channel, scores={FDIUГГГЖ=99}] at @s run function spells/din/ACBAAGAPAPAPAS

# SPELL_INDEXATION



# Удаляем spell_available, если стоит невозможная для заклинания цель или заклинание запрещает снятие маны
    tag @s[tag=cant_be_casted_cus_of_target] remove spell_available
    tag @s[tag=block_mp_withdraw] remove spell_available

# Взмах
    playanimation @p[tag=self, tag=spell_available] animation.arx.staff_a
    playanimation @p[tag=self, tag=!spell_available] animation.arx.no

# Отчет о стоимости
    # Заклинание использовано (spell_available)
        tellraw @s[tag=spell_available, scores={mp_req=!-1}, tag=!drop_25, tag=!drop_50] { "rawtext": [ { "text": "§bПотрачено §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP" } ] }
        tellraw @s[tag=spell_available, scores={mp_req=!-1}, tag=drop_25] { "rawtext": [ { "text": "§bПотрачено §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP §r§a(-25%)" } ] }
        tellraw @s[tag=spell_available, scores={mp_req=!-1}, tag=drop_50] { "rawtext": [ { "text": "§bПотрачено §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP §r§a§l(-50%)" } ] }

    # Заклинание недоступно т.к. не хватает маны (!spell_available)
        tellraw @s[tag=!spell_available, scores={mp_req=!-1}, tag=!drop_25, tag=!drop_50] { "rawtext": [ { "text": "§cТребуется §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP" } ] }
        tellraw @s[tag=!spell_available, scores={mp_req=!-1}, tag=drop_25] { "rawtext": [ { "text": "§cТребуется §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP §r§a(-25%)" } ] }
        tellraw @s[tag=!spell_available, scores={mp_req=!-1}, tag=drop_50] { "rawtext": [ { "text": "§cТребуется §1§l" }, { "score": {"name": "@s", "objective": "mp_req" } }, { "text": " MP §r§a§l(-50%)" } ] }

    # Мана не списана из-за цели
        tellraw @s[tag=cant_be_casted_cus_of_target] { "rawtext": [ { "text": "§o§eМана не списана из-за некорректной цели" } ] }

    # Мана не списана из-за внутренних правил заклинания
        tellraw @s[tag=block_mp_withdraw] { "rawtext": [ { "text": "§o§eМана не списана из-за внутренних правил заклинания" } ] }

    # Заклинание не установлено
        tellraw @s[scores={mp_req=-1}] { "rawtext": [ { "text": "§cНет заготовленного заклинания" } ] }

# Чистка тегов
    tag @s remove cant_be_casted_cus_of_target
    
    tag @s remove block_mp_withdraw

    tag @s remove spell_available

    tag @p[tag=!self] remove self2

    tag @s remove staff_kon
    tag @s remove staff_sin
    tag @s remove staff_san
    tag @s remove staff_din

    tag @s remove 1_channel
    tag @s remove 2_channel
    tag @s remove 3_channel
    tag @s remove 4_channel
    tag @s remove 5_channel
    tag @s remove 6_channel

    tag @s remove drop_cost_with_staff
    tag @s remove drop_cost_with_religion
    tag @s remove drop_25
    tag @s remove drop_50

    tag @s remove staff_mono
    tag @s remove staff_duo
    tag @s remove staff_trio
    tag @s remove staff_quadro
    tag @s remove staff_quintu
    tag @s remove staff_sexto


    tag @s remove self