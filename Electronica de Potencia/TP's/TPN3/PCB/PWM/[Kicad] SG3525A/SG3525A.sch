EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L lib_sch:SG3525 U1
U 1 1 5CD57FF5
P 5500 3250
F 0 "U1" H 5150 3900 50  0000 C CNN
F 1 "SG3525" H 5750 2600 50  0000 C CNN
F 2 "lib_fp:DIP-16_W7.62mm_LongPads" H 5500 3250 50  0001 C CNN
F 3 "www.st.com/resource/en/datasheet/sg3525.pdf" H 5500 3250 50  0001 C CNN
	1    5500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2550 5500 2450
Wire Wire Line
	5500 2450 5550 2450
Wire Wire Line
	5600 2450 5600 2550
$Comp
L lib_sch:+12V #PWR08
U 1 1 5CD58884
P 5550 2300
F 0 "#PWR08" H 5550 2150 50  0001 C CNN
F 1 "+12V" H 5565 2473 50  0000 C CNN
F 2 "" H 5550 2300 50  0001 C CNN
F 3 "" H 5550 2300 50  0001 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2300 5550 2450
Connection ~ 5550 2450
Wire Wire Line
	5550 2450 5600 2450
$Comp
L lib_sch:R_US R1
U 1 1 5CD58FB7
P 3600 2600
F 0 "R1" H 3532 2554 50  0000 R CNN
F 1 "10k" H 3532 2645 50  0000 R CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3640 2590 50  0001 C CNN
F 3 "~" H 3600 2600 50  0001 C CNN
	1    3600 2600
	-1   0    0    1   
$EndComp
$Comp
L lib_sch:R_US R2
U 1 1 5CD5AAD5
P 3600 3400
F 0 "R2" H 3532 3354 50  0000 R CNN
F 1 "10k" H 3532 3445 50  0000 R CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3640 3390 50  0001 C CNN
F 3 "~" H 3600 3400 50  0001 C CNN
	1    3600 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 3250 3600 3100
$Comp
L lib_sch:R_US R4
U 1 1 5CD5B04C
P 4100 3100
F 0 "R4" V 4150 3300 50  0000 C CNN
F 1 "1k" V 4000 3100 50  0000 C CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4140 3090 50  0001 C CNN
F 3 "~" H 4100 3100 50  0001 C CNN
	1    4100 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 3100 3600 3100
Connection ~ 3600 3100
Wire Wire Line
	3600 3100 3600 2750
Wire Wire Line
	5000 3050 4900 3050
Wire Wire Line
	4900 3050 4900 2350
Wire Wire Line
	4900 2350 3600 2350
Wire Wire Line
	3600 2350 3600 2450
Wire Wire Line
	3600 3550 3600 4100
Wire Wire Line
	4250 3100 4400 3100
Wire Wire Line
	4400 3100 4400 2750
Wire Wire Line
	4400 2750 5000 2750
$Comp
L lib_sch:R_POT_TRIM_US RV1
U 1 1 5CD5D84E
P 3200 2850
F 0 "RV1" H 3132 2896 50  0000 R CNN
F 1 "10k" H 3132 2805 50  0000 R CNN
F 2 "lib_fp:Potentiometer_Bourns_3266Y_Vertical" H 3200 2850 50  0001 C CNN
F 3 "~" H 3200 2850 50  0001 C CNN
	1    3200 2850
	1    0    0    -1  
$EndComp
$Comp
L lib_sch:R_US R3
U 1 1 5CD5DC21
P 4100 2850
F 0 "R3" V 4150 3050 50  0000 C CNN
F 1 "1k" V 4000 2850 50  0000 C CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4140 2840 50  0001 C CNN
F 3 "~" H 4100 2850 50  0001 C CNN
	1    4100 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 2850 4450 2850
Wire Wire Line
	3350 2850 3950 2850
Wire Wire Line
	3200 2700 3200 2350
Wire Wire Line
	3200 2350 3600 2350
Connection ~ 3600 2350
$Comp
L lib_sch:Earth #PWR01
U 1 1 5CD60B72
P 3200 4100
F 0 "#PWR01" H 3200 3850 50  0001 C CNN
F 1 "Earth" H 3200 3950 50  0001 C CNN
F 2 "" H 3200 4100 50  0001 C CNN
F 3 "~" H 3200 4100 50  0001 C CNN
	1    3200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4100 3200 3000
$Comp
L lib_sch:Earth #PWR02
U 1 1 5CD613E5
P 3600 4100
F 0 "#PWR02" H 3600 3850 50  0001 C CNN
F 1 "Earth" H 3600 3950 50  0001 C CNN
F 2 "" H 3600 4100 50  0001 C CNN
F 3 "~" H 3600 4100 50  0001 C CNN
	1    3600 4100
	1    0    0    -1  
$EndComp
$Comp
L lib_sch:R_US R6
U 1 1 5CD65FBC
P 4700 2950
F 0 "R6" V 4750 3100 50  0000 C CNN
F 1 "1k" V 4600 2950 50  0000 C CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4740 2940 50  0001 C CNN
F 3 "~" H 4700 2950 50  0001 C CNN
	1    4700 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 2950 5000 2950
Wire Wire Line
	4550 2950 4450 2950
Wire Wire Line
	4450 2950 4450 2850
Connection ~ 4450 2850
Wire Wire Line
	4450 2850 4250 2850
$Comp
L lib_sch:R_POT_TRIM_US RV2
U 1 1 5CD6710D
P 3900 3750
F 0 "RV2" H 3833 3796 50  0000 R CNN
F 1 "250k" H 3833 3705 50  0000 R CNN
F 2 "lib_fp:Potentiometer_Bourns_3266Y_Vertical" H 3900 3750 50  0001 C CNN
F 3 "~" H 3900 3750 50  0001 C CNN
	1    3900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3450 3900 3450
Wire Wire Line
	3900 3450 3900 3550
$Comp
L lib_sch:Earth #PWR03
U 1 1 5CD68909
P 3900 4100
F 0 "#PWR03" H 3900 3850 50  0001 C CNN
F 1 "Earth" H 3900 3950 50  0001 C CNN
F 2 "" H 3900 4100 50  0001 C CNN
F 3 "~" H 3900 4100 50  0001 C CNN
	1    3900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4100 3900 3900
Wire Wire Line
	4050 3750 4100 3750
Wire Wire Line
	4100 3750 4100 3550
Wire Wire Line
	4100 3550 3900 3550
Connection ~ 3900 3550
Wire Wire Line
	3900 3550 3900 3600
$Comp
L lib_sch:CP_Small C2
U 1 1 5CD69A34
P 4800 3950
F 0 "C2" H 4888 3996 50  0000 L CNN
F 1 "10uF" H 4888 3905 50  0000 L CNN
F 2 "lib_fp:C_Radial_D5.0mm_H11.0mm_P2.00mm" H 4800 3950 50  0001 C CNN
F 3 "~" H 4800 3950 50  0001 C CNN
	1    4800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3550 4300 3550
$Comp
L lib_sch:Earth #PWR04
U 1 1 5CD6BC1F
P 4300 4100
F 0 "#PWR04" H 4300 3850 50  0001 C CNN
F 1 "Earth" H 4300 3950 50  0001 C CNN
F 2 "" H 4300 4100 50  0001 C CNN
F 3 "~" H 4300 4100 50  0001 C CNN
	1    4300 4100
	1    0    0    -1  
$EndComp
$Comp
L lib_sch:C_Small C1
U 1 1 5CD69FD1
P 4300 3950
F 0 "C1" H 4050 4000 50  0000 L CNN
F 1 "1nF" H 4050 3900 50  0000 L CNN
F 2 "lib_fp:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 4300 3950 50  0001 C CNN
F 3 "~" H 4300 3950 50  0001 C CNN
	1    4300 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4050 4300 4100
$Comp
L lib_sch:R_US R5
U 1 1 5CD6F8DB
P 4550 3650
F 0 "R5" V 4600 3550 50  0000 R CNN
F 1 "330" V 4450 3700 50  0000 R CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4590 3640 50  0001 C CNN
F 3 "~" H 4550 3650 50  0001 C CNN
	1    4550 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 3650 4700 3650
Wire Wire Line
	4800 3850 4800 3750
Wire Wire Line
	4800 3750 5000 3750
$Comp
L lib_sch:Earth #PWR06
U 1 1 5CD78E97
P 4800 4100
F 0 "#PWR06" H 4800 3850 50  0001 C CNN
F 1 "Earth" H 4800 3950 50  0001 C CNN
F 2 "" H 4800 4100 50  0001 C CNN
F 3 "~" H 4800 4100 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4100 4800 4050
$Comp
L lib_sch:R_US R7
U 1 1 5CD7A63B
P 4700 3150
F 0 "R7" V 4750 3300 50  0000 C CNN
F 1 "100" V 4600 3150 50  0000 C CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4740 3140 50  0001 C CNN
F 3 "~" H 4700 3150 50  0001 C CNN
	1    4700 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 3150 4850 3150
$Comp
L lib_sch:Earth #PWR05
U 1 1 5CD7B767
P 4500 3200
F 0 "#PWR05" H 4500 2950 50  0001 C CNN
F 1 "Earth" H 4500 3050 50  0001 C CNN
F 2 "" H 4500 3200 50  0001 C CNN
F 3 "~" H 4500 3200 50  0001 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3200 4500 3150
Wire Wire Line
	4500 3150 4550 3150
NoConn ~ 5000 3250
NoConn ~ 5000 3350
$Comp
L lib_sch:Earth #PWR07
U 1 1 5CD7E1A1
P 5500 4100
F 0 "#PWR07" H 5500 3850 50  0001 C CNN
F 1 "Earth" H 5500 3950 50  0001 C CNN
F 2 "" H 5500 4100 50  0001 C CNN
F 3 "~" H 5500 4100 50  0001 C CNN
	1    5500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4100 5500 3950
$Comp
L lib_sch:Screw_Terminal_01x02 J1
U 1 1 5CD7FE23
P 7150 2900
F 0 "J1" H 7150 2700 50  0000 C CNN
F 1 "Vin" H 7150 3050 50  0000 C CNN
F 2 "lib_fp:TerminalBlock_bornier-2_P5.08mm" H 7150 2900 50  0001 C CNN
F 3 "~" H 7150 2900 50  0001 C CNN
	1    7150 2900
	-1   0    0    1   
$EndComp
$Comp
L lib_sch:+12V #PWR09
U 1 1 5CD80D70
P 7500 2800
F 0 "#PWR09" H 7500 2650 50  0001 C CNN
F 1 "+12V" H 7515 2973 50  0000 C CNN
F 2 "" H 7500 2800 50  0001 C CNN
F 3 "" H 7500 2800 50  0001 C CNN
	1    7500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2800 7350 2800
$Comp
L lib_sch:Earth #PWR010
U 1 1 5CD820E1
P 7500 2950
F 0 "#PWR010" H 7500 2700 50  0001 C CNN
F 1 "Earth" H 7500 2800 50  0001 C CNN
F 2 "" H 7500 2950 50  0001 C CNN
F 3 "~" H 7500 2950 50  0001 C CNN
	1    7500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2950 7500 2900
Wire Wire Line
	7500 2900 7350 2900
Wire Wire Line
	7500 3750 7350 3750
Text Label 6150 3150 0    50   ~ 0
PWM_A
Wire Wire Line
	6150 3150 6000 3150
Text Label 7500 3750 0    50   ~ 0
PWM_A
Text Label 7500 3950 0    50   ~ 0
PWM_B
Text Label 6150 3350 0    50   ~ 0
PWM_B
Wire Wire Line
	6150 3350 6000 3350
Wire Wire Line
	4300 3550 4300 3650
Wire Wire Line
	4400 3650 4300 3650
Connection ~ 4300 3650
Wire Wire Line
	4300 3650 4300 3850
$Comp
L lib_sch:LED D1
U 1 1 5CDA220C
P 6650 3100
F 0 "D1" V 6689 2983 50  0000 R CNN
F 1 "LED" V 6598 2983 50  0000 R CNN
F 2 "lib_fp:LED_D3.0mm_Clear" H 6650 3100 50  0001 C CNN
F 3 "~" H 6650 3100 50  0001 C CNN
	1    6650 3100
	0    -1   -1   0   
$EndComp
$Comp
L lib_sch:R_US R8
U 1 1 5CDA34C2
P 6650 3700
F 0 "R8" H 6750 3550 50  0000 C CNN
F 1 "1k" V 6550 3700 50  0000 C CNN
F 2 "lib_fp:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6690 3690 50  0001 C CNN
F 3 "~" H 6650 3700 50  0001 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3550 6650 3250
$Comp
L lib_sch:Earth #PWR012
U 1 1 5CDA5019
P 6650 4050
F 0 "#PWR012" H 6650 3800 50  0001 C CNN
F 1 "Earth" H 6650 3900 50  0001 C CNN
F 2 "" H 6650 4050 50  0001 C CNN
F 3 "~" H 6650 4050 50  0001 C CNN
	1    6650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4050 6650 3850
$Comp
L lib_sch:+12V #PWR011
U 1 1 5CDA7B7F
P 6650 2700
F 0 "#PWR011" H 6650 2550 50  0001 C CNN
F 1 "+12V" H 6665 2873 50  0000 C CNN
F 2 "" H 6650 2700 50  0001 C CNN
F 3 "" H 6650 2700 50  0001 C CNN
	1    6650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2950 6650 2700
$Comp
L lib_sch:logo G1
U 1 1 5CDC8733
P 5800 2550
F 0 "G1" H 5800 2520 60  0001 C CNN
F 1 "logo" H 5800 2580 60  0001 C CNN
F 2 "lib_fp:logo_utn_fsilk_small" H 5800 2550 50  0001 C CNN
F 3 "" H 5800 2550 50  0001 C CNN
	1    5800 2550
	1    0    0    -1  
$EndComp
$Comp
L lib_sch:Screw_Terminal_01x03 J2
U 1 1 5CE35FD9
P 7150 3850
F 0 "J2" H 7150 4050 50  0000 C CNN
F 1 "PWM_out" H 7100 3600 50  0000 C CNN
F 2 "lib_fp:TerminalBlock_bornier-3_P5.08mm" H 7150 3850 50  0001 C CNN
F 3 "~" H 7150 3850 50  0001 C CNN
	1    7150 3850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 3950 7350 3950
$Comp
L lib_sch:Earth #PWR013
U 1 1 5CE3A862
P 7800 3850
F 0 "#PWR013" H 7800 3600 50  0001 C CNN
F 1 "Earth" H 7800 3700 50  0001 C CNN
F 2 "" H 7800 3850 50  0001 C CNN
F 3 "~" H 7800 3850 50  0001 C CNN
	1    7800 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 3850 7800 3850
$EndSCHEMATC
