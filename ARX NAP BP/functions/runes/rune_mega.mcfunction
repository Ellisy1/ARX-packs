tellraw @s[rx=-60] { "rawtext": [ { "text": "§bЗаписано в I канал" } ] }
tellraw @s[rxm=-60, rx=-30] { "rawtext": [ { "text": "§bЗаписано во II канал" } ] }
tellraw @s[rxm=-30, rx=0] { "rawtext": [ { "text": "§bЗаписано в III канал" } ] }
tellraw @s[rxm=0.001, rx=30] { "rawtext": [ { "text": "§bЗаписано в IV канал" } ] }
tellraw @s[rxm=30, rx=60] { "rawtext": [ { "text": "§bЗаписано в V канал" } ] }
tellraw @s[rxm=60] { "rawtext": [ { "text": "§bЗаписано в VI канал" } ] }


# Канал 1
    execute as @s[rx=-60] run scoreboard players set @s AAEK 0
    execute as @s[rx=-60] run scoreboard players set @s AAEKЗ 0
    execute as @s[rx=-60] run scoreboard players set @s AAEKЖ 0
    execute as @s[rx=-60] run scoreboard players set @s AAEKЗЖ 0
    execute as @s[rx=-60] run scoreboard players set @s AAEKЖЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГ=!3}] AAEKГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГ=3}] AAEKГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГЗ=!3}] AAEKГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГЗ=3}] AAEKГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГГГ=!3..5}] AAEKГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГГГ=5}] AAEKГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГГГ=4}] AAEKГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKГГГ=3}] AAEKГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s AAEKД 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKДГ=!4}] AAEKДГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKДГ=4}] AAEKДГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKSГГГ=!4..6}] AAEKSГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKSГГГ=6}] AAEKSГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKSГГГ=5}] AAEKSГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEKSГГГ=4}] AAEKSГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s AAEL 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAELГ=!3}] AAELГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAELГ=3}] AAELГ 99
    execute as @s[rx=-60] run scoreboard players set @s AAEWM 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГ=!4}] AAEWMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГ=4}] AAEWMГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГГГ=!4..6}] AAEWMГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГГГ=6}] AAEWMГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГГГ=5}] AAEWMГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWMГГГ=4}] AAEWMГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s AAEW 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWГ=!3}] AAEWГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAEWГ=3}] AAEWГ 99
    execute as @s[rx=-60] run scoreboard players set @s AAEWЗ 0
    execute as @s[rx=-60] run scoreboard players set @s AAFW 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAFWГ=!3}] AAFWГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAFWГ=3}] AAFWГ 99
    execute as @s[rx=-60] run scoreboard players set @s AAGЗ 0
    execute as @s[rx=-60] run scoreboard players set @s AAG 0
    execute as @s[rx=-60] run scoreboard players set @s AAJ 0
    execute as @s[rx=-60] run scoreboard players set @s AAE1 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAE1Г=!3}] AAE1Г 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAE1Г=3}] AAE1Г 99
    execute as @s[rx=-60] run scoreboard players set @s AAE2 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAE2Г=!3}] AAE2Г 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={AAE2Г=3}] AAE2Г 99
    execute as @s[rx=-60] run scoreboard players set @s ABFV 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFVГ=!3}] ABFVГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFVГ=3}] ABFVГ 99
    execute as @s[rx=-60] run scoreboard players set @s ABEV 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABEVГ=!3}] ABEVГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABEVГ=3}] ABEVГ 99
    execute as @s[rx=-60] run scoreboard players set @s ABGЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ABG 0
    execute as @s[rx=-60] run scoreboard players set @s ABFQ 0
    execute as @s[rx=-60] run scoreboard players set @s ABFQЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ABFQЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГ=!3}] ABFQГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГ=3}] ABFQГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГЗ=!3}] ABFQГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГЗ=3}] ABFQГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГЖ=!3}] ABFQГЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГЖ=3}] ABFQГЖ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГ=!3..4}] ABFQГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГ=4}] ABFQГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГ=3}] ABFQГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГГ=!3..5}] ABFQГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГГ=5}] ABFQГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГГ=4}] ABFQГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFQГГГ=3}] ABFQГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ABFБ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГ=!3}] ABFБГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГ=3}] ABFБГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГГГ=!3..5}] ABFБГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГГГ=5}] ABFБГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГГГ=4}] ABFБГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБГГГ=3}] ABFБГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ABFБZ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГ=!4}] ABFБZГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГ=4}] ABFБZГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГГГ=!4..6}] ABFБZГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГГГ=6}] ABFБZГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГГГ=5}] ABFБZГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ABFБZГГГ=4}] ABFБZГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ABJ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFP 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГ=!3}] ACFPГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГ=3}] ACFPГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГ=!3..4}] ACFPГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГ=4}] ACFPГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГ=3}] ACFPГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГГ=!3..5}] ACFPГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГГ=5}] ACFPГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГГ=4}] ACFPГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPГГГ=3}] ACFPГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ACFPM 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГ=!4}] ACFPMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГ=4}] ACFPMГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГ=!4..6}] ACFPMГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГ=6}] ACFPMГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГ=5}] ACFPMГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГ=4}] ACFPMГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ACFPMЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГЗ=!4}] ACFPMГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГЗ=4}] ACFPMГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГЗ=!4..6}] ACFPMГГГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГЗ=6}] ACFPMГГГЗ 7
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГЗ=5}] ACFPMГГГЗ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPMГГГЗ=4}] ACFPMГГГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s ACFPW 0
    execute as @s[rx=-60] run scoreboard players set @s ACFPWЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFT 0
    execute as @s[rx=-60] run scoreboard players set @s ACFTЖ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFTЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFQ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFQЖ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFQЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFQГ=!3}] ACFQГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFQГ=3}] ACFQГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFQГЗ=!3}] ACFQГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFQГЗ=3}] ACFQГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s ACFZ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFZЖ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFZЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFO 0
    execute as @s[rx=-60] run scoreboard players set @s ACFOЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ACFOЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГ=!3}] ACFOГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГ=3}] ACFOГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГЗ=!3}] ACFOГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГЗ=3}] ACFOГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГЖ=!3}] ACFOГЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГЖ=3}] ACFOГЖ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГ=!3..5}] ACFOГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГ=5}] ACFOГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГ=4}] ACFOГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГ=3}] ACFOГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЗ=!3..5}] ACFOГГГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЗ=5}] ACFOГГГЗ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЗ=4}] ACFOГГГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЗ=3}] ACFOГГГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЖ=!3..5}] ACFOГГГЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЖ=5}] ACFOГГГЖ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЖ=4}] ACFOГГГЖ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOГГГЖ=3}] ACFOГГГЖ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГ=!4..6}] ACFOQГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГ=6}] ACFOQГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГ=5}] ACFOQГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГ=4}] ACFOQГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГЗ=!4..6}] ACFOQГГГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГЗ=6}] ACFOQГГГЗ 7
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГЗ=5}] ACFOQГГГЗ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFOQГГГЗ=4}] ACFOQГГГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s ACFS 0
    execute as @s[rx=-60] run scoreboard players set @s ACJ 0
    execute as @s[rx=-60] run scoreboard players set @s ACG 0
    execute as @s[rx=-60] run scoreboard players set @s ACGЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ACF2 0
    execute as @s[rx=-60] run scoreboard players set @s ACIU 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACIUГ=!3}] ACIUГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACIUГ=3}] ACIUГ 99
    execute as @s[rx=-60] run scoreboard players set @s ACFPU 0
    execute as @s[rx=-60] run scoreboard players set @s ACFPUЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPUГГГЖ=!4..6}] ACFPUГГГЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPUГГГЖ=6}] ACFPUГГГЖ 7
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPUГГГЖ=5}] ACFPUГГГЖ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ACFPUГГГЖ=4}] ACFPUГГГЖ 5
    execute as @s[rx=-60] run scoreboard players set @s ADITX 0
    execute as @s[rx=-60] run scoreboard players set @s ADGZЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ADFM 0
    execute as @s[rx=-60] run scoreboard players set @s ADFMP 0
    execute as @s[rx=-60] run scoreboard players set @s ADFPZЖ 0
    execute as @s[rx=-60] run scoreboard players set @s ADFY 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГ=!3}] ADFYГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГ=3}] ADFYГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГГГ=!3..5}] ADFYГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГГГ=5}] ADFYГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГГГ=4}] ADFYГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFYГГГ=3}] ADFYГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ADEY 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГ=!3}] ADEYГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГ=3}] ADEYГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГГГ=!3..5}] ADEYГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГГГ=5}] ADEYГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГГГ=4}] ADEYГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEYГГГ=3}] ADEYГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ADFБX 0
    execute as @s[rx=-60] run scoreboard players set @s ADFБXK 0
    execute as @s[rx=-60] run scoreboard players set @s ADFXY 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГ=!4}] ADFXYГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГ=4}] ADFXYГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГГГ=!4..6}] ADFXYГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГГГ=6}] ADFXYГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГГГ=5}] ADFXYГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXYГГГ=4}] ADFXYГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ADFБ 0
    execute as @s[rx=-60] run scoreboard players set @s ADFБS 0
    execute as @s[rx=-60] run scoreboard players set @s ADFБM 0
    execute as @s[rx=-60] run scoreboard players set @s ADFT 0
    execute as @s[rx=-60] run scoreboard players set @s ADET 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADETГ=!3}] ADETГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADETГ=3}] ADETГ 99
    execute as @s[rx=-60] run scoreboard players set @s ADETЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADETГЗ=!3}] ADETГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADETГЗ=3}] ADETГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s ADEZ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГ=!3}] ADEZГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГ=3}] ADEZГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГГГ=!3..5}] ADEZГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГГГ=5}] ADEZГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГГГ=4}] ADEZГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГГГ=3}] ADEZГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s ADEZЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГЗ=!3}] ADEZГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZГЗ=3}] ADEZГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s ADEZM 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГ=!4}] ADEZMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГ=4}] ADEZMГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГГГ=!4..6}] ADEZMГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГГГ=6}] ADEZMГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГГГ=5}] ADEZMГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГГГ=4}] ADEZMГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ADEZMЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГЗ=!4}] ADEZMГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADEZMГЗ=4}] ADEZMГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s ADFZ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГ=!3}] ADFZГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГ=3}] ADFZГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГ=!3..5}] ADFZГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГ=5}] ADFZГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГ=4}] ADFZГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГ=3}] ADFZГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZMГ=!4}] ADFZMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZMГ=4}] ADFZMГ 99
    execute as @s[rx=-60] run scoreboard players set @s ADFZЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГЗ=!3}] ADFZГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГЗ=3}] ADFZГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГЗ=!3..5}] ADFZГГГЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГЗ=5}] ADFZГГГЗ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГЗ=4}] ADFZГГГЗ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFZГГГЗ=3}] ADFZГГГЗ 4
    execute as @s[rx=-60] run scoreboard players set @s ADFZЖ 0
    execute as @s[rx=-60] run scoreboard players set @s ADEN 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГ=!3}] ADENГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГ=3}] ADENГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГГГ=!3..5}] ADENГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГГГ=5}] ADENГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГГГ=4}] ADENГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADENГГГ=3}] ADENГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГ=!3}] ADFNГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГ=3}] ADFNГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГГГ=!3..5}] ADFNГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГГГ=5}] ADFNГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГГГ=4}] ADFNГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFNГГГ=3}] ADFNГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADHXZTUГЖЗ=!6}] ADHXZTUГЖЗ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADHXZTUГЖЗ=6}] ADHXZTUГЖЗ 7
    execute as @s[rx=-60] run scoreboard players set @s ADFXMД 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГ=!4}] ADFXMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГ=4}] ADFXMГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГ=!4..5}] ADFXMГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГ=5}] ADFXMГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГ=4}] ADFXMГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГГ=!4..6}] ADFXMГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГГ=6}] ADFXMГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГГ=5}] ADFXMГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXMГГГ=4}] ADFXMГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ADIR 0
    execute as @s[rx=-60] run scoreboard players set @s ADJM 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADJMГ=!3}] ADJMГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADJMГ=3}] ADJMГ 99
    execute as @s[rx=-60] run scoreboard players set @s ADJ 0
    execute as @s[rx=-60] run scoreboard players set @s ADJZ 0
    execute as @s[rx=-60] run scoreboard players set @s ADGЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ADG 0
    execute as @s[rx=-60] run scoreboard players set @s ADGД 0
    execute as @s[rx=-60] run scoreboard players set @s ADGДЗ 0
    execute as @s[rx=-60] run scoreboard players set @s ADFXP 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГ=!4}] ADFXPГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГ=4}] ADFXPГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГГГ=!4..6}] ADFXPГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГГГ=6}] ADFXPГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГГГ=5}] ADFXPГГГ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADFXPГГГ=4}] ADFXPГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s ADI2 0
    execute as @s[rx=-60] run scoreboard players set @s ADI2K 0
    execute as @s[rx=-60] run scoreboard players set @s ADI2M 0
    execute as @s[rx=-60] run scoreboard players set @s ADI2MK 0
    execute as @s[rx=-60] run scoreboard players set @s ADIU 0
    execute as @s[rx=-60] run scoreboard players set @s ADIUЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГ=!3..5}] ADIUГГГ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГ=5}] ADIUГГГ 99
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГ=4}] ADIUГГГ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГ=3}] ADIUГГГ 4
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГЖ=!3..5}] ADIUГГГЖ 0
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГЖ=5}] ADIUГГГЖ 6
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГЖ=4}] ADIUГГГЖ 5
    execute as @s[rx=-60] run scoreboard players set @s[scores={ADIUГГГЖ=3}] ADIUГГГЖ 4
    execute as @s[rx=-60] run scoreboard players set @s ADHZД 0

# Канал 2
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEK 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEKЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEKЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEKЗЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEKЖЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГ=!3}] BAEKГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГ=3}] BAEKГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГЗ=!3}] BAEKГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГЗ=3}] BAEKГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГГГ=!3..5}] BAEKГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГГГ=5}] BAEKГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГГГ=4}] BAEKГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKГГГ=3}] BAEKГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEKД 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKДГ=!4}] BAEKДГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKДГ=4}] BAEKДГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKSГГГ=!4..6}] BAEKSГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKSГГГ=6}] BAEKSГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKSГГГ=5}] BAEKSГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEKSГГГ=4}] BAEKSГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEL 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAELГ=!3}] BAELГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAELГ=3}] BAELГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEWM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГ=!4}] BAEWMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГ=4}] BAEWMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГГГ=!4..6}] BAEWMГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГГГ=6}] BAEWMГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГГГ=5}] BAEWMГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWMГГГ=4}] BAEWMГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEW 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWГ=!3}] BAEWГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAEWГ=3}] BAEWГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAEWЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAFW 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAFWГ=!3}] BAFWГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAFWГ=3}] BAFWГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAGЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAG 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAJ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAE1 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAE1Г=!3}] BAE1Г 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAE1Г=3}] BAE1Г 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BAE2 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAE2Г=!3}] BAE2Г 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BAE2Г=3}] BAE2Г 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFV 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFVГ=!3}] BBFVГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFVГ=3}] BBFVГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBEV 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBEVГ=!3}] BBEVГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBEVГ=3}] BBEVГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBGЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBG 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFQ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFQЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFQЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГ=!3}] BBFQГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГ=3}] BBFQГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГЗ=!3}] BBFQГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГЗ=3}] BBFQГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГЖ=!3}] BBFQГЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГЖ=3}] BBFQГЖ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГ=!3..4}] BBFQГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГ=4}] BBFQГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГ=3}] BBFQГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГГ=!3..5}] BBFQГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГГ=5}] BBFQГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГГ=4}] BBFQГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFQГГГ=3}] BBFQГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFБ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГ=!3}] BBFБГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГ=3}] BBFБГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГГГ=!3..5}] BBFБГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГГГ=5}] BBFБГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГГГ=4}] BBFБГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБГГГ=3}] BBFБГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBFБZ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГ=!4}] BBFБZГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГ=4}] BBFБZГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГГГ=!4..6}] BBFБZГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГГГ=6}] BBFБZГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГГГ=5}] BBFБZГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BBFБZГГГ=4}] BBFБZГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BBJ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFP 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГ=!3}] BCFPГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГ=3}] BCFPГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГ=!3..4}] BCFPГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГ=4}] BCFPГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГ=3}] BCFPГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГГ=!3..5}] BCFPГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГГ=5}] BCFPГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГГ=4}] BCFPГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPГГГ=3}] BCFPГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГ=!4}] BCFPMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГ=4}] BCFPMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГ=!4..6}] BCFPMГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГ=6}] BCFPMГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГ=5}] BCFPMГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГ=4}] BCFPMГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPMЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГЗ=!4}] BCFPMГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГЗ=4}] BCFPMГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГЗ=!4..6}] BCFPMГГГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГЗ=6}] BCFPMГГГЗ 7
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГЗ=5}] BCFPMГГГЗ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPMГГГЗ=4}] BCFPMГГГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPW 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPWЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFT 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFTЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFTЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFQ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFQЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFQЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFQГ=!3}] BCFQГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFQГ=3}] BCFQГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFQГЗ=!3}] BCFQГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFQГЗ=3}] BCFQГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFZ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFZЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFZЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFO 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFOЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFOЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГ=!3}] BCFOГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГ=3}] BCFOГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГЗ=!3}] BCFOГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГЗ=3}] BCFOГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГЖ=!3}] BCFOГЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГЖ=3}] BCFOГЖ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГ=!3..5}] BCFOГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГ=5}] BCFOГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГ=4}] BCFOГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГ=3}] BCFOГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЗ=!3..5}] BCFOГГГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЗ=5}] BCFOГГГЗ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЗ=4}] BCFOГГГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЗ=3}] BCFOГГГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЖ=!3..5}] BCFOГГГЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЖ=5}] BCFOГГГЖ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЖ=4}] BCFOГГГЖ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOГГГЖ=3}] BCFOГГГЖ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГ=!4..6}] BCFOQГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГ=6}] BCFOQГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГ=5}] BCFOQГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГ=4}] BCFOQГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГЗ=!4..6}] BCFOQГГГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГЗ=6}] BCFOQГГГЗ 7
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГЗ=5}] BCFOQГГГЗ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFOQГГГЗ=4}] BCFOQГГГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFS 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCJ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCG 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCGЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCF2 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCIU 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCIUГ=!3}] BCIUГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCIUГ=3}] BCIUГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPU 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BCFPUЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPUГГГЖ=!4..6}] BCFPUГГГЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPUГГГЖ=6}] BCFPUГГГЖ 7
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPUГГГЖ=5}] BCFPUГГГЖ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BCFPUГГГЖ=4}] BCFPUГГГЖ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDITX 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDGZЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFMP 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFPZЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFY 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГ=!3}] BDFYГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГ=3}] BDFYГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГГГ=!3..5}] BDFYГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГГГ=5}] BDFYГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГГГ=4}] BDFYГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFYГГГ=3}] BDFYГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEY 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГ=!3}] BDEYГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГ=3}] BDEYГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГГГ=!3..5}] BDEYГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГГГ=5}] BDEYГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГГГ=4}] BDEYГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEYГГГ=3}] BDEYГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFБX 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFБXK 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFXY 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГ=!4}] BDFXYГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГ=4}] BDFXYГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГГГ=!4..6}] BDFXYГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГГГ=6}] BDFXYГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГГГ=5}] BDFXYГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXYГГГ=4}] BDFXYГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFБ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFБS 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFБM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFT 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDET 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDETГ=!3}] BDETГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDETГ=3}] BDETГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDETЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDETГЗ=!3}] BDETГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDETГЗ=3}] BDETГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEZ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГ=!3}] BDEZГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГ=3}] BDEZГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГГГ=!3..5}] BDEZГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГГГ=5}] BDEZГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГГГ=4}] BDEZГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГГГ=3}] BDEZГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEZЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГЗ=!3}] BDEZГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZГЗ=3}] BDEZГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEZM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГ=!4}] BDEZMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГ=4}] BDEZMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГГГ=!4..6}] BDEZMГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГГГ=6}] BDEZMГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГГГ=5}] BDEZMГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГГГ=4}] BDEZMГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEZMЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГЗ=!4}] BDEZMГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDEZMГЗ=4}] BDEZMГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFZ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГ=!3}] BDFZГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГ=3}] BDFZГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГ=!3..5}] BDFZГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГ=5}] BDFZГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГ=4}] BDFZГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГ=3}] BDFZГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZMГ=!4}] BDFZMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZMГ=4}] BDFZMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFZЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГЗ=!3}] BDFZГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГЗ=3}] BDFZГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГЗ=!3..5}] BDFZГГГЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГЗ=5}] BDFZГГГЗ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГЗ=4}] BDFZГГГЗ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFZГГГЗ=3}] BDFZГГГЗ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFZЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDEN 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГ=!3}] BDENГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГ=3}] BDENГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГГГ=!3..5}] BDENГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГГГ=5}] BDENГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГГГ=4}] BDENГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDENГГГ=3}] BDENГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГ=!3}] BDFNГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГ=3}] BDFNГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГГГ=!3..5}] BDFNГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГГГ=5}] BDFNГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГГГ=4}] BDFNГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFNГГГ=3}] BDFNГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDHXZTUГЖЗ=!6}] BDHXZTUГЖЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDHXZTUГЖЗ=6}] BDHXZTUГЖЗ 7
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFXMД 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГ=!4}] BDFXMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГ=4}] BDFXMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГ=!4..5}] BDFXMГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГ=5}] BDFXMГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГ=4}] BDFXMГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГГ=!4..6}] BDFXMГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГГ=6}] BDFXMГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГГ=5}] BDFXMГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXMГГГ=4}] BDFXMГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDIR 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDJM 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDJMГ=!3}] BDJMГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDJMГ=3}] BDJMГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDJ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDJZ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDGЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDG 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDGД 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDGДЗ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDFXP 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГ=!4}] BDFXPГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГ=4}] BDFXPГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГГГ=!4..6}] BDFXPГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГГГ=6}] BDFXPГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГГГ=5}] BDFXPГГГ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDFXPГГГ=4}] BDFXPГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDI2 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDI2K 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDI2M 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDI2MK 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDIU 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDIUЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГ=!3..5}] BDIUГГГ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГ=5}] BDIUГГГ 99
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГ=4}] BDIUГГГ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГ=3}] BDIUГГГ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГЖ=!3..5}] BDIUГГГЖ 0
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГЖ=5}] BDIUГГГЖ 6
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГЖ=4}] BDIUГГГЖ 5
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s[scores={BDIUГГГЖ=3}] BDIUГГГЖ 4
    execute as @s[rxm=-60, rx=-30] run scoreboard players set @s BDHZД 0

# Канал 3
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEK 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEKЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEKЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEKЗЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEKЖЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГ=!3}] CAEKГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГ=3}] CAEKГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГЗ=!3}] CAEKГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГЗ=3}] CAEKГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГГГ=!3..5}] CAEKГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГГГ=5}] CAEKГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГГГ=4}] CAEKГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKГГГ=3}] CAEKГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEKД 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKДГ=!4}] CAEKДГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKДГ=4}] CAEKДГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKSГГГ=!4..6}] CAEKSГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKSГГГ=6}] CAEKSГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKSГГГ=5}] CAEKSГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEKSГГГ=4}] CAEKSГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEL 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAELГ=!3}] CAELГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAELГ=3}] CAELГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEWM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГ=!4}] CAEWMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГ=4}] CAEWMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГГГ=!4..6}] CAEWMГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГГГ=6}] CAEWMГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГГГ=5}] CAEWMГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWMГГГ=4}] CAEWMГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEW 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWГ=!3}] CAEWГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAEWГ=3}] CAEWГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAEWЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAFW 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAFWГ=!3}] CAFWГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAFWГ=3}] CAFWГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAGЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAG 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAJ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAE1 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAE1Г=!3}] CAE1Г 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAE1Г=3}] CAE1Г 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CAE2 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAE2Г=!3}] CAE2Г 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CAE2Г=3}] CAE2Г 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFV 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFVГ=!3}] CBFVГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFVГ=3}] CBFVГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBEV 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBEVГ=!3}] CBEVГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBEVГ=3}] CBEVГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBGЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBG 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFQ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFQЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFQЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГ=!3}] CBFQГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГ=3}] CBFQГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГЗ=!3}] CBFQГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГЗ=3}] CBFQГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГЖ=!3}] CBFQГЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГЖ=3}] CBFQГЖ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГ=!3..4}] CBFQГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГ=4}] CBFQГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГ=3}] CBFQГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГГ=!3..5}] CBFQГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГГ=5}] CBFQГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГГ=4}] CBFQГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFQГГГ=3}] CBFQГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFБ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГ=!3}] CBFБГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГ=3}] CBFБГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГГГ=!3..5}] CBFБГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГГГ=5}] CBFБГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГГГ=4}] CBFБГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБГГГ=3}] CBFБГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBFБZ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГ=!4}] CBFБZГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГ=4}] CBFБZГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГГГ=!4..6}] CBFБZГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГГГ=6}] CBFБZГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГГГ=5}] CBFБZГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CBFБZГГГ=4}] CBFБZГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CBJ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFP 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГ=!3}] CCFPГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГ=3}] CCFPГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГ=!3..4}] CCFPГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГ=4}] CCFPГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГ=3}] CCFPГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГГ=!3..5}] CCFPГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГГ=5}] CCFPГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГГ=4}] CCFPГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPГГГ=3}] CCFPГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГ=!4}] CCFPMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГ=4}] CCFPMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГ=!4..6}] CCFPMГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГ=6}] CCFPMГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГ=5}] CCFPMГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГ=4}] CCFPMГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPMЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГЗ=!4}] CCFPMГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГЗ=4}] CCFPMГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГЗ=!4..6}] CCFPMГГГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГЗ=6}] CCFPMГГГЗ 7
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГЗ=5}] CCFPMГГГЗ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPMГГГЗ=4}] CCFPMГГГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPW 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPWЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFT 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFTЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFTЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFQ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFQЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFQЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFQГ=!3}] CCFQГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFQГ=3}] CCFQГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFQГЗ=!3}] CCFQГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFQГЗ=3}] CCFQГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFZ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFZЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFZЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFO 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFOЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFOЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГ=!3}] CCFOГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГ=3}] CCFOГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГЗ=!3}] CCFOГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГЗ=3}] CCFOГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГЖ=!3}] CCFOГЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГЖ=3}] CCFOГЖ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГ=!3..5}] CCFOГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГ=5}] CCFOГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГ=4}] CCFOГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГ=3}] CCFOГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЗ=!3..5}] CCFOГГГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЗ=5}] CCFOГГГЗ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЗ=4}] CCFOГГГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЗ=3}] CCFOГГГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЖ=!3..5}] CCFOГГГЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЖ=5}] CCFOГГГЖ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЖ=4}] CCFOГГГЖ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOГГГЖ=3}] CCFOГГГЖ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГ=!4..6}] CCFOQГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГ=6}] CCFOQГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГ=5}] CCFOQГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГ=4}] CCFOQГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГЗ=!4..6}] CCFOQГГГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГЗ=6}] CCFOQГГГЗ 7
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГЗ=5}] CCFOQГГГЗ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFOQГГГЗ=4}] CCFOQГГГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFS 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCJ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCG 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCGЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCF2 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCIU 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCIUГ=!3}] CCIUГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCIUГ=3}] CCIUГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPU 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CCFPUЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPUГГГЖ=!4..6}] CCFPUГГГЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPUГГГЖ=6}] CCFPUГГГЖ 7
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPUГГГЖ=5}] CCFPUГГГЖ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CCFPUГГГЖ=4}] CCFPUГГГЖ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDITX 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDGZЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFMP 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFPZЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFY 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГ=!3}] CDFYГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГ=3}] CDFYГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГГГ=!3..5}] CDFYГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГГГ=5}] CDFYГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГГГ=4}] CDFYГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFYГГГ=3}] CDFYГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEY 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГ=!3}] CDEYГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГ=3}] CDEYГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГГГ=!3..5}] CDEYГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГГГ=5}] CDEYГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГГГ=4}] CDEYГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEYГГГ=3}] CDEYГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFБX 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFБXK 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFXY 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГ=!4}] CDFXYГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГ=4}] CDFXYГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГГГ=!4..6}] CDFXYГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГГГ=6}] CDFXYГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГГГ=5}] CDFXYГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXYГГГ=4}] CDFXYГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFБ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFБS 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFБM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFT 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDET 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDETГ=!3}] CDETГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDETГ=3}] CDETГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDETЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDETГЗ=!3}] CDETГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDETГЗ=3}] CDETГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEZ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГ=!3}] CDEZГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГ=3}] CDEZГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГГГ=!3..5}] CDEZГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГГГ=5}] CDEZГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГГГ=4}] CDEZГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГГГ=3}] CDEZГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEZЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГЗ=!3}] CDEZГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZГЗ=3}] CDEZГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEZM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГ=!4}] CDEZMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГ=4}] CDEZMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГГГ=!4..6}] CDEZMГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГГГ=6}] CDEZMГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГГГ=5}] CDEZMГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГГГ=4}] CDEZMГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEZMЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГЗ=!4}] CDEZMГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDEZMГЗ=4}] CDEZMГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFZ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГ=!3}] CDFZГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГ=3}] CDFZГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГ=!3..5}] CDFZГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГ=5}] CDFZГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГ=4}] CDFZГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГ=3}] CDFZГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZMГ=!4}] CDFZMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZMГ=4}] CDFZMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFZЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГЗ=!3}] CDFZГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГЗ=3}] CDFZГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГЗ=!3..5}] CDFZГГГЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГЗ=5}] CDFZГГГЗ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГЗ=4}] CDFZГГГЗ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFZГГГЗ=3}] CDFZГГГЗ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFZЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDEN 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГ=!3}] CDENГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГ=3}] CDENГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГГГ=!3..5}] CDENГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГГГ=5}] CDENГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГГГ=4}] CDENГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDENГГГ=3}] CDENГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГ=!3}] CDFNГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГ=3}] CDFNГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГГГ=!3..5}] CDFNГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГГГ=5}] CDFNГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГГГ=4}] CDFNГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFNГГГ=3}] CDFNГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDHXZTUГЖЗ=!6}] CDHXZTUГЖЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDHXZTUГЖЗ=6}] CDHXZTUГЖЗ 7
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFXMД 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГ=!4}] CDFXMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГ=4}] CDFXMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГ=!4..5}] CDFXMГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГ=5}] CDFXMГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГ=4}] CDFXMГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГГ=!4..6}] CDFXMГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГГ=6}] CDFXMГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГГ=5}] CDFXMГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXMГГГ=4}] CDFXMГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDIR 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDJM 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDJMГ=!3}] CDJMГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDJMГ=3}] CDJMГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDJ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDJZ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDGЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDG 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDGД 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDGДЗ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDFXP 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГ=!4}] CDFXPГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГ=4}] CDFXPГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГГГ=!4..6}] CDFXPГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГГГ=6}] CDFXPГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГГГ=5}] CDFXPГГГ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDFXPГГГ=4}] CDFXPГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDI2 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDI2K 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDI2M 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDI2MK 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDIU 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDIUЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГ=!3..5}] CDIUГГГ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГ=5}] CDIUГГГ 99
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГ=4}] CDIUГГГ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГ=3}] CDIUГГГ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГЖ=!3..5}] CDIUГГГЖ 0
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГЖ=5}] CDIUГГГЖ 6
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГЖ=4}] CDIUГГГЖ 5
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s[scores={CDIUГГГЖ=3}] CDIUГГГЖ 4
    execute as @s[rxm=-30, rx=0] run scoreboard players set @s CDHZД 0

# Канал 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEK 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEKЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEKЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEKЗЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEKЖЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГ=!3}] DAEKГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГ=3}] DAEKГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГЗ=!3}] DAEKГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГЗ=3}] DAEKГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГГГ=!3..5}] DAEKГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГГГ=5}] DAEKГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГГГ=4}] DAEKГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKГГГ=3}] DAEKГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEKД 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKДГ=!4}] DAEKДГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKДГ=4}] DAEKДГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKSГГГ=!4..6}] DAEKSГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKSГГГ=6}] DAEKSГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKSГГГ=5}] DAEKSГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEKSГГГ=4}] DAEKSГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEL 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAELГ=!3}] DAELГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAELГ=3}] DAELГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEWM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГ=!4}] DAEWMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГ=4}] DAEWMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГГГ=!4..6}] DAEWMГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГГГ=6}] DAEWMГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГГГ=5}] DAEWMГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWMГГГ=4}] DAEWMГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEW 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWГ=!3}] DAEWГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAEWГ=3}] DAEWГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAEWЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAFW 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAFWГ=!3}] DAFWГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAFWГ=3}] DAFWГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAGЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAG 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAJ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAE1 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAE1Г=!3}] DAE1Г 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAE1Г=3}] DAE1Г 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DAE2 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAE2Г=!3}] DAE2Г 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DAE2Г=3}] DAE2Г 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFV 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFVГ=!3}] DBFVГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFVГ=3}] DBFVГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBEV 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBEVГ=!3}] DBEVГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBEVГ=3}] DBEVГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBGЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBG 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFQ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFQЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFQЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГ=!3}] DBFQГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГ=3}] DBFQГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГЗ=!3}] DBFQГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГЗ=3}] DBFQГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГЖ=!3}] DBFQГЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГЖ=3}] DBFQГЖ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГ=!3..4}] DBFQГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГ=4}] DBFQГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГ=3}] DBFQГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГГ=!3..5}] DBFQГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГГ=5}] DBFQГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГГ=4}] DBFQГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFQГГГ=3}] DBFQГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFБ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГ=!3}] DBFБГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГ=3}] DBFБГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГГГ=!3..5}] DBFБГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГГГ=5}] DBFБГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГГГ=4}] DBFБГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБГГГ=3}] DBFБГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBFБZ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГ=!4}] DBFБZГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГ=4}] DBFБZГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГГГ=!4..6}] DBFБZГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГГГ=6}] DBFБZГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГГГ=5}] DBFБZГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DBFБZГГГ=4}] DBFБZГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DBJ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFP 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГ=!3}] DCFPГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГ=3}] DCFPГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГ=!3..4}] DCFPГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГ=4}] DCFPГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГ=3}] DCFPГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГГ=!3..5}] DCFPГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГГ=5}] DCFPГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГГ=4}] DCFPГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPГГГ=3}] DCFPГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГ=!4}] DCFPMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГ=4}] DCFPMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГ=!4..6}] DCFPMГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГ=6}] DCFPMГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГ=5}] DCFPMГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГ=4}] DCFPMГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPMЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГЗ=!4}] DCFPMГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГЗ=4}] DCFPMГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГЗ=!4..6}] DCFPMГГГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГЗ=6}] DCFPMГГГЗ 7
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГЗ=5}] DCFPMГГГЗ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPMГГГЗ=4}] DCFPMГГГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPW 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPWЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFT 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFTЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFTЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFQ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFQЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFQЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFQГ=!3}] DCFQГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFQГ=3}] DCFQГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFQГЗ=!3}] DCFQГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFQГЗ=3}] DCFQГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFZ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFZЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFZЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFO 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFOЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFOЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГ=!3}] DCFOГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГ=3}] DCFOГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГЗ=!3}] DCFOГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГЗ=3}] DCFOГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГЖ=!3}] DCFOГЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГЖ=3}] DCFOГЖ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГ=!3..5}] DCFOГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГ=5}] DCFOГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГ=4}] DCFOГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГ=3}] DCFOГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЗ=!3..5}] DCFOГГГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЗ=5}] DCFOГГГЗ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЗ=4}] DCFOГГГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЗ=3}] DCFOГГГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЖ=!3..5}] DCFOГГГЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЖ=5}] DCFOГГГЖ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЖ=4}] DCFOГГГЖ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOГГГЖ=3}] DCFOГГГЖ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГ=!4..6}] DCFOQГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГ=6}] DCFOQГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГ=5}] DCFOQГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГ=4}] DCFOQГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГЗ=!4..6}] DCFOQГГГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГЗ=6}] DCFOQГГГЗ 7
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГЗ=5}] DCFOQГГГЗ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFOQГГГЗ=4}] DCFOQГГГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFS 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCJ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCG 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCGЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCF2 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCIU 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCIUГ=!3}] DCIUГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCIUГ=3}] DCIUГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPU 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DCFPUЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPUГГГЖ=!4..6}] DCFPUГГГЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPUГГГЖ=6}] DCFPUГГГЖ 7
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPUГГГЖ=5}] DCFPUГГГЖ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DCFPUГГГЖ=4}] DCFPUГГГЖ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDITX 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDGZЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFMP 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFPZЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFY 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГ=!3}] DDFYГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГ=3}] DDFYГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГГГ=!3..5}] DDFYГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГГГ=5}] DDFYГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГГГ=4}] DDFYГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFYГГГ=3}] DDFYГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEY 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГ=!3}] DDEYГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГ=3}] DDEYГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГГГ=!3..5}] DDEYГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГГГ=5}] DDEYГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГГГ=4}] DDEYГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEYГГГ=3}] DDEYГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFБX 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFБXK 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFXY 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГ=!4}] DDFXYГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГ=4}] DDFXYГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГГГ=!4..6}] DDFXYГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГГГ=6}] DDFXYГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГГГ=5}] DDFXYГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXYГГГ=4}] DDFXYГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFБ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFБS 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFБM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFT 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDET 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDETГ=!3}] DDETГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDETГ=3}] DDETГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDETЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDETГЗ=!3}] DDETГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDETГЗ=3}] DDETГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEZ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГ=!3}] DDEZГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГ=3}] DDEZГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГГГ=!3..5}] DDEZГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГГГ=5}] DDEZГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГГГ=4}] DDEZГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГГГ=3}] DDEZГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEZЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГЗ=!3}] DDEZГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZГЗ=3}] DDEZГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEZM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГ=!4}] DDEZMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГ=4}] DDEZMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГГГ=!4..6}] DDEZMГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГГГ=6}] DDEZMГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГГГ=5}] DDEZMГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГГГ=4}] DDEZMГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEZMЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГЗ=!4}] DDEZMГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDEZMГЗ=4}] DDEZMГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFZ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГ=!3}] DDFZГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГ=3}] DDFZГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГ=!3..5}] DDFZГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГ=5}] DDFZГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГ=4}] DDFZГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГ=3}] DDFZГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZMГ=!4}] DDFZMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZMГ=4}] DDFZMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFZЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГЗ=!3}] DDFZГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГЗ=3}] DDFZГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГЗ=!3..5}] DDFZГГГЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГЗ=5}] DDFZГГГЗ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГЗ=4}] DDFZГГГЗ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFZГГГЗ=3}] DDFZГГГЗ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFZЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDEN 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГ=!3}] DDENГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГ=3}] DDENГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГГГ=!3..5}] DDENГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГГГ=5}] DDENГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГГГ=4}] DDENГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDENГГГ=3}] DDENГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГ=!3}] DDFNГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГ=3}] DDFNГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГГГ=!3..5}] DDFNГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГГГ=5}] DDFNГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГГГ=4}] DDFNГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFNГГГ=3}] DDFNГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDHXZTUГЖЗ=!6}] DDHXZTUГЖЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDHXZTUГЖЗ=6}] DDHXZTUГЖЗ 7
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFXMД 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГ=!4}] DDFXMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГ=4}] DDFXMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГ=!4..5}] DDFXMГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГ=5}] DDFXMГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГ=4}] DDFXMГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГГ=!4..6}] DDFXMГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГГ=6}] DDFXMГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГГ=5}] DDFXMГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXMГГГ=4}] DDFXMГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDIR 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDJM 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDJMГ=!3}] DDJMГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDJMГ=3}] DDJMГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDJ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDJZ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDGЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDG 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDGД 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDGДЗ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDFXP 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГ=!4}] DDFXPГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГ=4}] DDFXPГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГГГ=!4..6}] DDFXPГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГГГ=6}] DDFXPГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГГГ=5}] DDFXPГГГ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDFXPГГГ=4}] DDFXPГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDI2 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDI2K 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDI2M 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDI2MK 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDIU 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDIUЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГ=!3..5}] DDIUГГГ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГ=5}] DDIUГГГ 99
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГ=4}] DDIUГГГ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГ=3}] DDIUГГГ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГЖ=!3..5}] DDIUГГГЖ 0
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГЖ=5}] DDIUГГГЖ 6
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГЖ=4}] DDIUГГГЖ 5
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s[scores={DDIUГГГЖ=3}] DDIUГГГЖ 4
    execute as @s[rxm=0.001, rx=30] run scoreboard players set @s DDHZД 0

# Канал 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEK 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEKЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEKЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEKЗЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEKЖЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГ=!3}] EAEKГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГ=3}] EAEKГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГЗ=!3}] EAEKГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГЗ=3}] EAEKГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГГГ=!3..5}] EAEKГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГГГ=5}] EAEKГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГГГ=4}] EAEKГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKГГГ=3}] EAEKГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEKД 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKДГ=!4}] EAEKДГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKДГ=4}] EAEKДГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKSГГГ=!4..6}] EAEKSГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKSГГГ=6}] EAEKSГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKSГГГ=5}] EAEKSГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEKSГГГ=4}] EAEKSГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEL 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAELГ=!3}] EAELГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAELГ=3}] EAELГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEWM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГ=!4}] EAEWMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГ=4}] EAEWMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГГГ=!4..6}] EAEWMГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГГГ=6}] EAEWMГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГГГ=5}] EAEWMГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWMГГГ=4}] EAEWMГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEW 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWГ=!3}] EAEWГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAEWГ=3}] EAEWГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAEWЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAFW 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAFWГ=!3}] EAFWГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAFWГ=3}] EAFWГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAGЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAG 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAJ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAE1 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAE1Г=!3}] EAE1Г 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAE1Г=3}] EAE1Г 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EAE2 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAE2Г=!3}] EAE2Г 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EAE2Г=3}] EAE2Г 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFV 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFVГ=!3}] EBFVГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFVГ=3}] EBFVГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBEV 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBEVГ=!3}] EBEVГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBEVГ=3}] EBEVГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBGЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBG 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFQ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFQЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFQЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГ=!3}] EBFQГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГ=3}] EBFQГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГЗ=!3}] EBFQГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГЗ=3}] EBFQГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГЖ=!3}] EBFQГЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГЖ=3}] EBFQГЖ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГ=!3..4}] EBFQГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГ=4}] EBFQГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГ=3}] EBFQГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГГ=!3..5}] EBFQГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГГ=5}] EBFQГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГГ=4}] EBFQГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFQГГГ=3}] EBFQГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFБ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГ=!3}] EBFБГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГ=3}] EBFБГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГГГ=!3..5}] EBFБГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГГГ=5}] EBFБГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГГГ=4}] EBFБГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБГГГ=3}] EBFБГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBFБZ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГ=!4}] EBFБZГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГ=4}] EBFБZГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГГГ=!4..6}] EBFБZГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГГГ=6}] EBFБZГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГГГ=5}] EBFБZГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EBFБZГГГ=4}] EBFБZГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EBJ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFP 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГ=!3}] ECFPГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГ=3}] ECFPГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГ=!3..4}] ECFPГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГ=4}] ECFPГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГ=3}] ECFPГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГГ=!3..5}] ECFPГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГГ=5}] ECFPГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГГ=4}] ECFPГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPГГГ=3}] ECFPГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГ=!4}] ECFPMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГ=4}] ECFPMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГ=!4..6}] ECFPMГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГ=6}] ECFPMГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГ=5}] ECFPMГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГ=4}] ECFPMГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPMЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГЗ=!4}] ECFPMГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГЗ=4}] ECFPMГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГЗ=!4..6}] ECFPMГГГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГЗ=6}] ECFPMГГГЗ 7
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГЗ=5}] ECFPMГГГЗ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPMГГГЗ=4}] ECFPMГГГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPW 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPWЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFT 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFTЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFTЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFQ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFQЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFQЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFQГ=!3}] ECFQГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFQГ=3}] ECFQГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFQГЗ=!3}] ECFQГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFQГЗ=3}] ECFQГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFZ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFZЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFZЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFO 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFOЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFOЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГ=!3}] ECFOГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГ=3}] ECFOГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГЗ=!3}] ECFOГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГЗ=3}] ECFOГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГЖ=!3}] ECFOГЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГЖ=3}] ECFOГЖ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГ=!3..5}] ECFOГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГ=5}] ECFOГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГ=4}] ECFOГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГ=3}] ECFOГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЗ=!3..5}] ECFOГГГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЗ=5}] ECFOГГГЗ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЗ=4}] ECFOГГГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЗ=3}] ECFOГГГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЖ=!3..5}] ECFOГГГЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЖ=5}] ECFOГГГЖ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЖ=4}] ECFOГГГЖ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOГГГЖ=3}] ECFOГГГЖ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГ=!4..6}] ECFOQГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГ=6}] ECFOQГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГ=5}] ECFOQГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГ=4}] ECFOQГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГЗ=!4..6}] ECFOQГГГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГЗ=6}] ECFOQГГГЗ 7
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГЗ=5}] ECFOQГГГЗ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFOQГГГЗ=4}] ECFOQГГГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFS 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECJ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECG 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECGЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECF2 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECIU 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECIUГ=!3}] ECIUГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECIUГ=3}] ECIUГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPU 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s ECFPUЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPUГГГЖ=!4..6}] ECFPUГГГЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPUГГГЖ=6}] ECFPUГГГЖ 7
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPUГГГЖ=5}] ECFPUГГГЖ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={ECFPUГГГЖ=4}] ECFPUГГГЖ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDITX 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDGZЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFMP 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFPZЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFY 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГ=!3}] EDFYГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГ=3}] EDFYГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГГГ=!3..5}] EDFYГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГГГ=5}] EDFYГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГГГ=4}] EDFYГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFYГГГ=3}] EDFYГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEY 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГ=!3}] EDEYГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГ=3}] EDEYГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГГГ=!3..5}] EDEYГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГГГ=5}] EDEYГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГГГ=4}] EDEYГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEYГГГ=3}] EDEYГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFБX 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFБXK 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFXY 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГ=!4}] EDFXYГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГ=4}] EDFXYГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГГГ=!4..6}] EDFXYГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГГГ=6}] EDFXYГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГГГ=5}] EDFXYГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXYГГГ=4}] EDFXYГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFБ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFБS 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFБM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFT 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDET 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDETГ=!3}] EDETГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDETГ=3}] EDETГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDETЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDETГЗ=!3}] EDETГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDETГЗ=3}] EDETГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEZ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГ=!3}] EDEZГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГ=3}] EDEZГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГГГ=!3..5}] EDEZГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГГГ=5}] EDEZГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГГГ=4}] EDEZГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГГГ=3}] EDEZГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEZЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГЗ=!3}] EDEZГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZГЗ=3}] EDEZГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEZM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГ=!4}] EDEZMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГ=4}] EDEZMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГГГ=!4..6}] EDEZMГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГГГ=6}] EDEZMГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГГГ=5}] EDEZMГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГГГ=4}] EDEZMГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEZMЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГЗ=!4}] EDEZMГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDEZMГЗ=4}] EDEZMГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFZ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГ=!3}] EDFZГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГ=3}] EDFZГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГ=!3..5}] EDFZГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГ=5}] EDFZГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГ=4}] EDFZГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГ=3}] EDFZГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZMГ=!4}] EDFZMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZMГ=4}] EDFZMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFZЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГЗ=!3}] EDFZГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГЗ=3}] EDFZГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГЗ=!3..5}] EDFZГГГЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГЗ=5}] EDFZГГГЗ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГЗ=4}] EDFZГГГЗ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFZГГГЗ=3}] EDFZГГГЗ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFZЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDEN 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГ=!3}] EDENГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГ=3}] EDENГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГГГ=!3..5}] EDENГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГГГ=5}] EDENГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГГГ=4}] EDENГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDENГГГ=3}] EDENГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГ=!3}] EDFNГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГ=3}] EDFNГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГГГ=!3..5}] EDFNГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГГГ=5}] EDFNГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГГГ=4}] EDFNГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFNГГГ=3}] EDFNГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDHXZTUГЖЗ=!6}] EDHXZTUГЖЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDHXZTUГЖЗ=6}] EDHXZTUГЖЗ 7
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFXMД 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГ=!4}] EDFXMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГ=4}] EDFXMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГ=!4..5}] EDFXMГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГ=5}] EDFXMГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГ=4}] EDFXMГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГГ=!4..6}] EDFXMГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГГ=6}] EDFXMГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГГ=5}] EDFXMГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXMГГГ=4}] EDFXMГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDIR 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDJM 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDJMГ=!3}] EDJMГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDJMГ=3}] EDJMГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDJ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDJZ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDGЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDG 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDGД 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDGДЗ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDFXP 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГ=!4}] EDFXPГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГ=4}] EDFXPГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГГГ=!4..6}] EDFXPГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГГГ=6}] EDFXPГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГГГ=5}] EDFXPГГГ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDFXPГГГ=4}] EDFXPГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDI2 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDI2K 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDI2M 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDI2MK 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDIU 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDIUЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГ=!3..5}] EDIUГГГ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГ=5}] EDIUГГГ 99
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГ=4}] EDIUГГГ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГ=3}] EDIUГГГ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГЖ=!3..5}] EDIUГГГЖ 0
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГЖ=5}] EDIUГГГЖ 6
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГЖ=4}] EDIUГГГЖ 5
    execute as @s[rxm=30, rx=60] run scoreboard players set @s[scores={EDIUГГГЖ=3}] EDIUГГГЖ 4
    execute as @s[rxm=30, rx=60] run scoreboard players set @s EDHZД 0

# Канал 6
    execute as @s[rxm=60] run scoreboard players set @s FAEK 0
    execute as @s[rxm=60] run scoreboard players set @s FAEKЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FAEKЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FAEKЗЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FAEKЖЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГ=!3}] FAEKГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГ=3}] FAEKГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГЗ=!3}] FAEKГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГЗ=3}] FAEKГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГГГ=!3..5}] FAEKГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГГГ=5}] FAEKГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГГГ=4}] FAEKГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKГГГ=3}] FAEKГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FAEKД 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKДГ=!4}] FAEKДГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKДГ=4}] FAEKДГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKSГГГ=!4..6}] FAEKSГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKSГГГ=6}] FAEKSГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKSГГГ=5}] FAEKSГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEKSГГГ=4}] FAEKSГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FAEL 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAELГ=!3}] FAELГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAELГ=3}] FAELГ 99
    execute as @s[rxm=60] run scoreboard players set @s FAEWM 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГ=!4}] FAEWMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГ=4}] FAEWMГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГГГ=!4..6}] FAEWMГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГГГ=6}] FAEWMГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГГГ=5}] FAEWMГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWMГГГ=4}] FAEWMГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FAEW 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWГ=!3}] FAEWГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAEWГ=3}] FAEWГ 99
    execute as @s[rxm=60] run scoreboard players set @s FAEWЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FAFW 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAFWГ=!3}] FAFWГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAFWГ=3}] FAFWГ 99
    execute as @s[rxm=60] run scoreboard players set @s FAGЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FAG 0
    execute as @s[rxm=60] run scoreboard players set @s FAJ 0
    execute as @s[rxm=60] run scoreboard players set @s FAE1 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAE1Г=!3}] FAE1Г 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAE1Г=3}] FAE1Г 99
    execute as @s[rxm=60] run scoreboard players set @s FAE2 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAE2Г=!3}] FAE2Г 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FAE2Г=3}] FAE2Г 99
    execute as @s[rxm=60] run scoreboard players set @s FBFV 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFVГ=!3}] FBFVГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFVГ=3}] FBFVГ 99
    execute as @s[rxm=60] run scoreboard players set @s FBEV 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBEVГ=!3}] FBEVГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBEVГ=3}] FBEVГ 99
    execute as @s[rxm=60] run scoreboard players set @s FBGЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FBG 0
    execute as @s[rxm=60] run scoreboard players set @s FBFQ 0
    execute as @s[rxm=60] run scoreboard players set @s FBFQЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FBFQЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГ=!3}] FBFQГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГ=3}] FBFQГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГЗ=!3}] FBFQГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГЗ=3}] FBFQГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГЖ=!3}] FBFQГЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГЖ=3}] FBFQГЖ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГ=!3..4}] FBFQГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГ=4}] FBFQГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГ=3}] FBFQГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГГ=!3..5}] FBFQГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГГ=5}] FBFQГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГГ=4}] FBFQГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFQГГГ=3}] FBFQГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FBFБ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГ=!3}] FBFБГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГ=3}] FBFБГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГГГ=!3..5}] FBFБГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГГГ=5}] FBFБГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГГГ=4}] FBFБГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБГГГ=3}] FBFБГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FBFБZ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГ=!4}] FBFБZГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГ=4}] FBFБZГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГГГ=!4..6}] FBFБZГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГГГ=6}] FBFБZГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГГГ=5}] FBFБZГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FBFБZГГГ=4}] FBFБZГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FBJ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFP 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГ=!3}] FCFPГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГ=3}] FCFPГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГ=!3..4}] FCFPГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГ=4}] FCFPГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГ=3}] FCFPГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГГ=!3..5}] FCFPГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГГ=5}] FCFPГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГГ=4}] FCFPГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPГГГ=3}] FCFPГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FCFPM 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГ=!4}] FCFPMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГ=4}] FCFPMГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГ=!4..6}] FCFPMГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГ=6}] FCFPMГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГ=5}] FCFPMГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГ=4}] FCFPMГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FCFPMЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГЗ=!4}] FCFPMГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГЗ=4}] FCFPMГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГЗ=!4..6}] FCFPMГГГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГЗ=6}] FCFPMГГГЗ 7
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГЗ=5}] FCFPMГГГЗ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPMГГГЗ=4}] FCFPMГГГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s FCFPW 0
    execute as @s[rxm=60] run scoreboard players set @s FCFPWЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFT 0
    execute as @s[rxm=60] run scoreboard players set @s FCFTЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFTЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFQ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFQЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFQЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFQГ=!3}] FCFQГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFQГ=3}] FCFQГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFQГЗ=!3}] FCFQГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFQГЗ=3}] FCFQГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s FCFZ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFZЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFZЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFO 0
    execute as @s[rxm=60] run scoreboard players set @s FCFOЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FCFOЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГ=!3}] FCFOГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГ=3}] FCFOГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГЗ=!3}] FCFOГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГЗ=3}] FCFOГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГЖ=!3}] FCFOГЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГЖ=3}] FCFOГЖ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГ=!3..5}] FCFOГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГ=5}] FCFOГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГ=4}] FCFOГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГ=3}] FCFOГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЗ=!3..5}] FCFOГГГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЗ=5}] FCFOГГГЗ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЗ=4}] FCFOГГГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЗ=3}] FCFOГГГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЖ=!3..5}] FCFOГГГЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЖ=5}] FCFOГГГЖ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЖ=4}] FCFOГГГЖ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOГГГЖ=3}] FCFOГГГЖ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГ=!4..6}] FCFOQГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГ=6}] FCFOQГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГ=5}] FCFOQГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГ=4}] FCFOQГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГЗ=!4..6}] FCFOQГГГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГЗ=6}] FCFOQГГГЗ 7
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГЗ=5}] FCFOQГГГЗ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFOQГГГЗ=4}] FCFOQГГГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s FCFS 0
    execute as @s[rxm=60] run scoreboard players set @s FCJ 0
    execute as @s[rxm=60] run scoreboard players set @s FCG 0
    execute as @s[rxm=60] run scoreboard players set @s FCGЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FCF2 0
    execute as @s[rxm=60] run scoreboard players set @s FCIU 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCIUГ=!3}] FCIUГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCIUГ=3}] FCIUГ 99
    execute as @s[rxm=60] run scoreboard players set @s FCFPU 0
    execute as @s[rxm=60] run scoreboard players set @s FCFPUЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPUГГГЖ=!4..6}] FCFPUГГГЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPUГГГЖ=6}] FCFPUГГГЖ 7
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPUГГГЖ=5}] FCFPUГГГЖ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FCFPUГГГЖ=4}] FCFPUГГГЖ 5
    execute as @s[rxm=60] run scoreboard players set @s FDITX 0
    execute as @s[rxm=60] run scoreboard players set @s FDGZЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FDFM 0
    execute as @s[rxm=60] run scoreboard players set @s FDFMP 0
    execute as @s[rxm=60] run scoreboard players set @s FDFPZЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FDFY 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГ=!3}] FDFYГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГ=3}] FDFYГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГГГ=!3..5}] FDFYГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГГГ=5}] FDFYГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГГГ=4}] FDFYГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFYГГГ=3}] FDFYГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FDEY 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГ=!3}] FDEYГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГ=3}] FDEYГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГГГ=!3..5}] FDEYГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГГГ=5}] FDEYГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГГГ=4}] FDEYГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEYГГГ=3}] FDEYГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FDFБX 0
    execute as @s[rxm=60] run scoreboard players set @s FDFБXK 0
    execute as @s[rxm=60] run scoreboard players set @s FDFXY 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГ=!4}] FDFXYГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГ=4}] FDFXYГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГГГ=!4..6}] FDFXYГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГГГ=6}] FDFXYГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГГГ=5}] FDFXYГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXYГГГ=4}] FDFXYГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FDFБ 0
    execute as @s[rxm=60] run scoreboard players set @s FDFБS 0
    execute as @s[rxm=60] run scoreboard players set @s FDFБM 0
    execute as @s[rxm=60] run scoreboard players set @s FDFT 0
    execute as @s[rxm=60] run scoreboard players set @s FDET 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDETГ=!3}] FDETГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDETГ=3}] FDETГ 99
    execute as @s[rxm=60] run scoreboard players set @s FDETЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDETГЗ=!3}] FDETГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDETГЗ=3}] FDETГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s FDEZ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГ=!3}] FDEZГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГ=3}] FDEZГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГГГ=!3..5}] FDEZГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГГГ=5}] FDEZГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГГГ=4}] FDEZГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГГГ=3}] FDEZГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s FDEZЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГЗ=!3}] FDEZГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZГЗ=3}] FDEZГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s FDEZM 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГ=!4}] FDEZMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГ=4}] FDEZMГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГГГ=!4..6}] FDEZMГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГГГ=6}] FDEZMГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГГГ=5}] FDEZMГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГГГ=4}] FDEZMГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FDEZMЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГЗ=!4}] FDEZMГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDEZMГЗ=4}] FDEZMГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s FDFZ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГ=!3}] FDFZГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГ=3}] FDFZГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГ=!3..5}] FDFZГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГ=5}] FDFZГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГ=4}] FDFZГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГ=3}] FDFZГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZMГ=!4}] FDFZMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZMГ=4}] FDFZMГ 99
    execute as @s[rxm=60] run scoreboard players set @s FDFZЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГЗ=!3}] FDFZГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГЗ=3}] FDFZГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГЗ=!3..5}] FDFZГГГЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГЗ=5}] FDFZГГГЗ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГЗ=4}] FDFZГГГЗ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFZГГГЗ=3}] FDFZГГГЗ 4
    execute as @s[rxm=60] run scoreboard players set @s FDFZЖ 0
    execute as @s[rxm=60] run scoreboard players set @s FDEN 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГ=!3}] FDENГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГ=3}] FDENГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГГГ=!3..5}] FDENГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГГГ=5}] FDENГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГГГ=4}] FDENГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDENГГГ=3}] FDENГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГ=!3}] FDFNГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГ=3}] FDFNГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГГГ=!3..5}] FDFNГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГГГ=5}] FDFNГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГГГ=4}] FDFNГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFNГГГ=3}] FDFNГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDHXZTUГЖЗ=!6}] FDHXZTUГЖЗ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDHXZTUГЖЗ=6}] FDHXZTUГЖЗ 7
    execute as @s[rxm=60] run scoreboard players set @s FDFXMД 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГ=!4}] FDFXMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГ=4}] FDFXMГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГ=!4..5}] FDFXMГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГ=5}] FDFXMГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГ=4}] FDFXMГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГГ=!4..6}] FDFXMГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГГ=6}] FDFXMГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГГ=5}] FDFXMГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXMГГГ=4}] FDFXMГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FDIR 0
    execute as @s[rxm=60] run scoreboard players set @s FDJM 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDJMГ=!3}] FDJMГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDJMГ=3}] FDJMГ 99
    execute as @s[rxm=60] run scoreboard players set @s FDJ 0
    execute as @s[rxm=60] run scoreboard players set @s FDJZ 0
    execute as @s[rxm=60] run scoreboard players set @s FDGЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FDG 0
    execute as @s[rxm=60] run scoreboard players set @s FDGД 0
    execute as @s[rxm=60] run scoreboard players set @s FDGДЗ 0
    execute as @s[rxm=60] run scoreboard players set @s FDFXP 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГ=!4}] FDFXPГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГ=4}] FDFXPГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГГГ=!4..6}] FDFXPГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГГГ=6}] FDFXPГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГГГ=5}] FDFXPГГГ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDFXPГГГ=4}] FDFXPГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s FDI2 0
    execute as @s[rxm=60] run scoreboard players set @s FDI2K 0
    execute as @s[rxm=60] run scoreboard players set @s FDI2M 0
    execute as @s[rxm=60] run scoreboard players set @s FDI2MK 0
    execute as @s[rxm=60] run scoreboard players set @s FDIU 0
    execute as @s[rxm=60] run scoreboard players set @s FDIUЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГ=!3..5}] FDIUГГГ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГ=5}] FDIUГГГ 99
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГ=4}] FDIUГГГ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГ=3}] FDIUГГГ 4
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГЖ=!3..5}] FDIUГГГЖ 0
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГЖ=5}] FDIUГГГЖ 6
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГЖ=4}] FDIUГГГЖ 5
    execute as @s[rxm=60] run scoreboard players set @s[scores={FDIUГГГЖ=3}] FDIUГГГЖ 4
    execute as @s[rxm=60] run scoreboard players set @s FDHZД 0
