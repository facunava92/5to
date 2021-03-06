EESchema Schematic File Version 4
LIBS:osciladores-cache
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
L Device:R R1
U 1 1 5CAD5D4A
P 4975 2975
F 0 "R1" H 5045 3021 50  0000 L CNN
F 1 "R" H 5045 2930 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4905 2975 50  0001 C CNN
F 3 "~" H 4975 2975 50  0001 C CNN
	1    4975 2975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CAD5E5F
P 5525 2975
F 0 "R2" H 5595 3021 50  0000 L CNN
F 1 "R" H 5595 2930 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5455 2975 50  0001 C CNN
F 3 "~" H 5525 2975 50  0001 C CNN
	1    5525 2975
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5CAD5FE2
P 5425 3375
F 0 "Q1" H 5616 3421 50  0000 L CNN
F 1 "2N3904" H 5616 3330 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Horizontal2" H 5625 3300 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5425 3375 50  0001 L CNN
	1    5425 3375
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CAD603F
P 6125 3175
F 0 "C3" V 5873 3175 50  0000 C CNN
F 1 "C" V 5964 3175 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 6163 3025 50  0001 C CNN
F 3 "~" H 6125 3175 50  0001 C CNN
	1    6125 3175
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5CAD60ED
P 5925 3825
F 0 "C1" H 6040 3871 50  0000 L CNN
F 1 "C" H 6040 3780 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5963 3675 50  0001 C CNN
F 3 "~" H 5925 3825 50  0001 C CNN
	1    5925 3825
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CAD6145
P 5975 4525
F 0 "C2" V 5723 4525 50  0000 C CNN
F 1 "C" V 5814 4525 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 6013 4375 50  0001 C CNN
F 3 "~" H 5975 4525 50  0001 C CNN
	1    5975 4525
	0    1    1    0   
$EndComp
Wire Wire Line
	5225 3375 4975 3375
Wire Wire Line
	4975 3375 4975 3125
Connection ~ 4975 3375
Wire Wire Line
	5525 3175 5525 3125
Wire Wire Line
	5525 2825 5525 2625
Wire Wire Line
	4975 2625 4975 2825
Wire Wire Line
	5925 3675 5925 3575
Wire Wire Line
	5925 3575 5525 3575
Wire Wire Line
	5925 3975 5925 4075
Wire Wire Line
	5975 3175 5525 3175
Connection ~ 5525 3175
Connection ~ 5925 4075
Wire Wire Line
	6475 3175 6375 3175
Wire Wire Line
	4725 4525 4725 3375
Wire Wire Line
	4725 3375 4975 3375
Wire Wire Line
	4725 4525 5825 4525
$Comp
L Device:L L1
U 1 1 5CAD8F60
P 6375 3625
F 0 "L1" H 6225 3675 50  0000 L CNN
F 1 "L" H 6225 3575 50  0000 L CNN
F 2 "Inductor_THT:L_Axial_L16.0mm_D6.3mm_P20.32mm_Horizontal_Fastron_VHBCC" H 6375 3625 50  0001 C CNN
F 3 "~" H 6375 3625 50  0001 C CNN
	1    6375 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:L L2
U 1 1 5CAD8FD8
P 6875 3625
F 0 "L2" H 6928 3671 50  0000 L CNN
F 1 "L" H 6928 3580 50  0000 L CNN
F 2 "Inductor_THT:L_Axial_L16.0mm_D6.3mm_P20.32mm_Horizontal_Fastron_VHBCC" H 6875 3625 50  0001 C CNN
F 3 "~" H 6875 3625 50  0001 C CNN
	1    6875 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 3475 6375 3175
Connection ~ 6375 3175
Wire Wire Line
	6125 4525 7175 4525
Wire Wire Line
	7175 4525 7175 3175
Wire Wire Line
	6375 3775 6375 4075
Wire Wire Line
	6875 3775 6875 4075
Connection ~ 6375 4075
Wire Wire Line
	6775 3175 6875 3175
Connection ~ 6875 3175
Wire Wire Line
	6875 3175 7175 3175
Wire Wire Line
	4275 2625 4975 2625
Connection ~ 4975 2625
Wire Wire Line
	4975 2625 5275 2625
$Comp
L Connector:Conn_01x01_Female J1
U 1 1 5CAFFFF2
P 3925 3075
F 0 "J1" H 3819 2850 50  0000 C CNN
F 1 "Conn_01x01_Female" H 3819 2941 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Horizontal" H 3925 3075 50  0001 C CNN
F 3 "~" H 3925 3075 50  0001 C CNN
	1    3925 3075
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5CB0005A
P 3925 3175
F 0 "J2" H 3819 2950 50  0000 C CNN
F 1 "Conn_01x01_Female" H 3819 3041 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Horizontal" H 3925 3175 50  0001 C CNN
F 3 "~" H 3925 3175 50  0001 C CNN
	1    3925 3175
	-1   0    0    1   
$EndComp
Wire Wire Line
	4125 3075 4275 3075
Wire Wire Line
	4275 2625 4275 3075
Wire Wire Line
	6375 2825 6375 3175
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5CB033E1
P 7825 2975
F 0 "J4" H 7852 3001 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7852 2910 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Horizontal" H 7825 2975 50  0001 C CNN
F 3 "~" H 7825 2975 50  0001 C CNN
	1    7825 2975
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5CB000E8
P 7825 2825
F 0 "J3" H 7852 2851 50  0000 L CNN
F 1 "Conn_01x01_Female" H 7852 2760 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Horizontal" H 7825 2825 50  0001 C CNN
F 3 "~" H 7825 2825 50  0001 C CNN
	1    7825 2825
	1    0    0    -1  
$EndComp
Wire Wire Line
	6875 3175 6875 3475
Wire Wire Line
	6875 4075 6375 4075
Wire Wire Line
	6275 3175 6375 3175
Wire Wire Line
	5925 4075 6225 4075
Wire Wire Line
	4975 3725 4975 3375
Wire Wire Line
	5525 3725 5525 3575
Connection ~ 5525 3575
$Comp
L Device:C C4
U 1 1 5CD70F78
P 6625 2825
F 0 "C4" V 6373 2825 50  0000 C CNN
F 1 "C" V 6464 2825 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 6663 2675 50  0001 C CNN
F 3 "~" H 6625 2825 50  0001 C CNN
	1    6625 2825
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5CD714D8
P 6225 4175
F 0 "#PWR03" H 6225 3925 50  0001 C CNN
F 1 "GND" H 6230 4002 50  0000 C CNN
F 2 "" H 6225 4175 50  0001 C CNN
F 3 "" H 6225 4175 50  0001 C CNN
	1    6225 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	6225 4175 6225 4075
Connection ~ 6225 4075
Wire Wire Line
	6225 4075 6375 4075
Wire Wire Line
	6375 2825 6475 2825
$Comp
L power:GND #PWR01
U 1 1 5CD7414E
P 4275 3175
F 0 "#PWR01" H 4275 2925 50  0001 C CNN
F 1 "GND" H 4280 3002 50  0000 C CNN
F 2 "" H 4275 3175 50  0001 C CNN
F 3 "" H 4275 3175 50  0001 C CNN
	1    4275 3175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4275 3175 4125 3175
$Comp
L Device:R R3
U 1 1 5CD76265
P 7475 3675
F 0 "R3" H 7545 3721 50  0000 L CNN
F 1 "R" H 7545 3630 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7405 3675 50  0001 C CNN
F 3 "~" H 7475 3675 50  0001 C CNN
	1    7475 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7475 3525 7475 2825
Wire Wire Line
	6775 2825 7475 2825
$Comp
L power:GND #PWR04
U 1 1 5CD7719F
P 7475 4175
F 0 "#PWR04" H 7475 3925 50  0001 C CNN
F 1 "GND" H 7480 4002 50  0000 C CNN
F 2 "" H 7475 4175 50  0001 C CNN
F 3 "" H 7475 4175 50  0001 C CNN
	1    7475 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	7475 4175 7475 3825
Wire Wire Line
	7625 2825 7475 2825
Connection ~ 7475 2825
$Comp
L power:GND #PWR05
U 1 1 5CD7ACDE
P 7625 3025
F 0 "#PWR05" H 7625 2775 50  0001 C CNN
F 1 "GND" H 7630 2852 50  0000 C CNN
F 2 "" H 7625 3025 50  0001 C CNN
F 3 "" H 7625 3025 50  0001 C CNN
	1    7625 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	7625 3025 7625 2975
$Comp
L Device:C C5
U 1 1 5CD7C2B9
P 6625 3175
F 0 "C5" V 6475 3175 50  0000 C CNN
F 1 "C" V 6550 3275 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 6663 3025 50  0001 C CNN
F 3 "~" H 6625 3175 50  0001 C CNN
	1    6625 3175
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5CD7C66E
P 6625 3425
F 0 "C6" V 6775 3425 50  0000 C CNN
F 1 "C" V 6675 3525 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 6663 3275 50  0001 C CNN
F 3 "~" H 6625 3425 50  0001 C CNN
	1    6625 3425
	0    1    1    0   
$EndComp
Wire Wire Line
	6475 3425 6475 3175
Connection ~ 6475 3175
Wire Wire Line
	6775 3425 6775 3175
Connection ~ 6775 3175
$Comp
L power:+12V #PWR02
U 1 1 5CD8D5E5
P 5275 2450
F 0 "#PWR02" H 5275 2300 50  0001 C CNN
F 1 "+12V" H 5290 2623 50  0000 C CNN
F 2 "" H 5275 2450 50  0001 C CNN
F 3 "" H 5275 2450 50  0001 C CNN
	1    5275 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 2450 5275 2625
Connection ~ 5275 2625
Wire Wire Line
	5275 2625 5525 2625
$Comp
L Device:R R?
U 1 1 5CDBE2EA
P 4975 3900
F 0 "R?" H 5045 3946 50  0000 L CNN
F 1 "R" H 5045 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4905 3900 50  0001 C CNN
F 3 "~" H 4975 3900 50  0001 C CNN
	1    4975 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5CDBEAEB
P 5525 3900
F 0 "R?" H 5595 3946 50  0000 L CNN
F 1 "R" H 5595 3855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5455 3900 50  0001 C CNN
F 3 "~" H 5525 3900 50  0001 C CNN
	1    5525 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4975 4050 4975 4075
Wire Wire Line
	4975 4075 5525 4075
Wire Wire Line
	5525 4050 5525 4075
Connection ~ 5525 4075
Wire Wire Line
	5525 4075 5925 4075
$EndSCHEMATC
