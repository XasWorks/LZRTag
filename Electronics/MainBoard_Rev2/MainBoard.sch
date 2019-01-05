EESchema Schematic File Version 4
LIBS:MainBoard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
L RF_Module:ESP32-WROOM-32 U1
U 1 1 5C2BAF8A
P 5950 3500
F 0 "U1" H 5500 4850 50  0000 C CNN
F 1 "ESP32-WROOM-32" H 5825 3700 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 5950 2000 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 5650 3550 50  0001 C CNN
F 4 "1904-1025-1-ND" H 5950 3500 50  0001 C CNN "Digi-Key"
F 5 "ESP32-WROOM-32D (16MB)" H 5950 3500 50  0001 C CNN "MPN"
	1    5950 3500
	1    0    0    -1  
$EndComp
$Sheet
S 2800 4050 1100 450 
U 5C2BB052
F0 "PowerHandling" 50
F1 "Power.sch" 50
F2 "CHG_In" I L 2800 4250 50 
F3 "CHG_Stat" I R 3900 4250 50 
F4 "V_SENSE" I R 3900 4350 50 
F5 "FastCHG_En" I L 2800 4325 50 
$EndSheet
$Sheet
S 2800 3300 1100 550 
U 5C2BC95D
F0 "USB Connection" 50
F1 "USB_Connection.sch" 50
F2 "RST" I R 3900 3400 50 
F3 "PROG" I R 3900 3475 50 
F4 "U>E" I R 3900 3600 50 
F5 "E>U" I R 3900 3675 50 
F6 "+5V_USB" I L 2800 3675 50 
F7 "Charge_EN" I L 2800 3575 50 
$EndSheet
Wire Wire Line
	5350 2300 4950 2300
Text Label 4950 2300 0    50   ~ 0
RESET
Text Label 4300 3400 2    50   ~ 0
RESET
Wire Wire Line
	3900 3400 4300 3400
Wire Wire Line
	3900 3475 4300 3475
Text Label 4300 3475 2    50   ~ 0
GPIO0
Text Label 4300 3600 2    50   ~ 0
U>E
Text Label 4300 3675 2    50   ~ 0
E>U
Wire Wire Line
	3900 3600 4300 3600
Wire Wire Line
	3900 3675 4300 3675
Wire Wire Line
	6550 2600 6800 2600
Text Label 6800 2600 2    50   ~ 0
U>E
Text Label 6800 2400 2    50   ~ 0
E>U
Wire Wire Line
	6800 2400 6550 2400
Wire Wire Line
	6550 2300 6800 2300
Text Label 6800 2300 2    50   ~ 0
GPIO0
NoConn ~ 5350 3500
NoConn ~ 5350 3600
NoConn ~ 5350 3700
NoConn ~ 5350 3800
NoConn ~ 5350 3900
NoConn ~ 5350 4000
$Comp
L power:GND #PWR0101
U 1 1 5C2CF7EB
P 5950 4900
F 0 "#PWR0101" H 5950 4650 50  0001 C CNN
F 1 "GND" H 5955 4727 50  0000 C CNN
F 2 "" H 5950 4900 50  0001 C CNN
F 3 "" H 5950 4900 50  0001 C CNN
	1    5950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3675 2675 3675
Wire Wire Line
	2675 3675 2675 4250
Wire Wire Line
	2675 4250 2800 4250
NoConn ~ 5350 2600
NoConn ~ 5350 2500
$Comp
L power:+3.3V #PWR0102
U 1 1 5C2D544A
P 5950 1750
F 0 "#PWR0102" H 5950 1600 50  0001 C CNN
F 1 "+3.3V" H 5965 1923 50  0000 C CNN
F 2 "" H 5950 1750 50  0001 C CNN
F 3 "" H 5950 1750 50  0001 C CNN
	1    5950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1750 5950 1800
$Comp
L Device:C C1
U 1 1 5C2D5556
P 6400 1600
F 0 "C1" V 6148 1600 50  0000 C CNN
F 1 "10uF" V 6239 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6438 1450 50  0001 C CNN
F 3 "~" H 6400 1600 50  0001 C CNN
	1    6400 1600
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5C2D560A
P 6400 1800
F 0 "C2" V 6200 1900 50  0000 C CNN
F 1 "150nF" V 6300 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6400 1800 50  0001 C CNN
F 3 "~" H 6400 1800 50  0001 C CNN
	1    6400 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 1600 6250 1800
Wire Wire Line
	6250 1800 5950 1800
Connection ~ 5950 1800
Wire Wire Line
	5950 1800 5950 2100
Wire Wire Line
	6250 1800 6300 1800
Connection ~ 6250 1800
Wire Wire Line
	6500 1800 6550 1800
Wire Wire Line
	6725 1800 6725 1875
Wire Wire Line
	6550 1600 6550 1800
Connection ~ 6550 1800
Wire Wire Line
	6550 1800 6725 1800
$Comp
L power:GND #PWR0103
U 1 1 5C2D5E9C
P 6725 1875
F 0 "#PWR0103" H 6725 1625 50  0001 C CNN
F 1 "GND" H 6730 1702 50  0000 C CNN
F 2 "" H 6725 1875 50  0001 C CNN
F 3 "" H 6725 1875 50  0001 C CNN
	1    6725 1875
	1    0    0    -1  
$EndComp
NoConn ~ 6550 2900
$Sheet
S 8050 2425 1525 650 
U 5C2D6974
F0 "Peripheral Devices" 50
F1 "Peripherals.sch" 50
F2 "WS2812B_In" I L 8050 2625 50 
F3 "WS2812B_Out" I R 9575 2900 50 
F4 "BTN_In" I L 8050 2725 50 
F5 "Vibrate" I L 8050 2800 50 
F6 "IR_OUT" I L 8050 2925 50 
F7 "Audio_In" I L 8050 3000 50 
$EndSheet
Wire Wire Line
	2800 3575 2600 3575
Wire Wire Line
	2600 3575 2600 4325
Wire Wire Line
	2600 4325 2800 4325
$Comp
L Connector:DB9_Female J2
U 1 1 5C2ECDD0
P 9300 4750
F 0 "J2" H 9479 4796 50  0000 L CNN
F 1 "DB9_Female" H 9479 4705 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 9300 4750 50  0001 C CNN
F 3 " ~" H 9300 4750 50  0001 C CNN
F 4 "AE10921-ND" H 9300 4750 50  0001 C CNN "Digi-Key"
F 5 "A-DF 09 A/KG-T2S" H 9300 4750 50  0001 C CNN "MPN"
	1    9300 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4350 8950 4350
$Comp
L power:GND #PWR0104
U 1 1 5C2ED471
P 8950 4350
F 0 "#PWR0104" H 8950 4100 50  0001 C CNN
F 1 "GND" H 8955 4177 50  0000 C CNN
F 2 "" H 8950 4350 50  0001 C CNN
F 3 "" H 8950 4350 50  0001 C CNN
	1    8950 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 4450 8725 4450
Wire Wire Line
	8725 4450 8725 4350
$Comp
L power:+3.3V #PWR0105
U 1 1 5C2EDA7D
P 8725 4350
F 0 "#PWR0105" H 8725 4200 50  0001 C CNN
F 1 "+3.3V" H 8740 4523 50  0000 C CNN
F 2 "" H 8725 4350 50  0001 C CNN
F 3 "" H 8725 4350 50  0001 C CNN
	1    8725 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4550 8500 4550
Wire Wire Line
	8500 4550 8500 4350
$Comp
L power:+BATT #PWR0106
U 1 1 5C2EE3FD
P 8500 4350
F 0 "#PWR0106" H 8500 4200 50  0001 C CNN
F 1 "+BATT" H 8515 4523 50  0000 C CNN
F 2 "" H 8500 4350 50  0001 C CNN
F 3 "" H 8500 4350 50  0001 C CNN
	1    8500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4000 6900 4000
Text Label 6900 4000 2    50   ~ 0
AUDIO
Text Label 7725 3000 0    50   ~ 0
AUDIO
Wire Wire Line
	7725 3000 8050 3000
Wire Wire Line
	6550 4100 6900 4100
Text Label 6900 4100 2    50   ~ 0
IR_OUT
Text Label 7725 2925 0    50   ~ 0
IR_OUT
Wire Wire Line
	7725 2925 8050 2925
Wire Wire Line
	6550 4200 6900 4200
Text Label 6900 4200 2    50   ~ 0
LED_1
Wire Wire Line
	8050 2625 7725 2625
Text Label 7725 2625 0    50   ~ 0
LED_1
Text Label 9850 2900 2    50   ~ 0
LED_2
Wire Wire Line
	9575 2900 9850 2900
Wire Wire Line
	9000 4650 8500 4650
Text Label 8500 4650 0    50   ~ 0
LED_2
Text Label 6900 4400 2    50   ~ 0
V_SENSE
Wire Wire Line
	3900 4350 4300 4350
Text Label 4300 4350 2    50   ~ 0
V_SENSE
Wire Wire Line
	6900 4400 6550 4400
Wire Wire Line
	6550 3000 6800 3000
Text Label 6800 3000 2    50   ~ 0
VBRT
Text Label 7725 2800 0    50   ~ 0
VBRT
Wire Wire Line
	7725 2800 8050 2800
Wire Wire Line
	8050 2725 7725 2725
Text Label 7725 2725 0    50   ~ 0
TRIGGER
Text Label 6900 3200 2    50   ~ 0
TRIGGER
Wire Wire Line
	6900 3200 6550 3200
$Comp
L Device:R_Small R2
U 1 1 5C2F2FEB
P 7875 3475
F 0 "R2" V 7725 3450 50  0000 C CNN
F 1 "2.2k" V 7800 3475 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7875 3475 50  0001 C CNN
F 3 "~" H 7875 3475 50  0001 C CNN
	1    7875 3475
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5C2F305A
P 7875 3675
F 0 "R3" V 7800 3650 50  0000 C CNN
F 1 "2.2k" V 7950 3675 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7875 3675 50  0001 C CNN
F 3 "~" H 7875 3675 50  0001 C CNN
	1    7875 3675
	0    1    1    0   
$EndComp
Wire Wire Line
	7975 3675 8050 3675
Wire Wire Line
	7975 3475 8050 3475
$Comp
L power:+3.3V #PWR0139
U 1 1 5C2F44E2
P 8800 3575
F 0 "#PWR0139" H 8800 3425 50  0001 C CNN
F 1 "+3.3V" H 8815 3748 50  0000 C CNN
F 2 "" H 8800 3575 50  0001 C CNN
F 3 "" H 8800 3575 50  0001 C CNN
	1    8800 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3575 8800 3575
$Comp
L Device:LED D7
U 1 1 5C2F536F
P 8375 4000
F 0 "D7" H 8350 4100 50  0000 C CNN
F 1 "LED" H 8525 4050 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 8375 4000 50  0001 C CNN
F 3 "~" H 8375 4000 50  0001 C CNN
F 4 "1830-1068-1-ND" H 8375 4000 50  0001 C CNN "Digi-Key"
F 5 "IN-S63BT5B" H 8375 4000 50  0001 C CNN "MPN"
	1    8375 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8525 4000 8800 4000
Wire Wire Line
	8800 4000 8800 3575
Connection ~ 8800 3575
Wire Wire Line
	8225 4000 7975 4000
$Comp
L Device:R_Small R4
U 1 1 5C2F6A6B
P 7875 4000
F 0 "R4" V 7800 3975 50  0000 C CNN
F 1 "220" V 7950 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7875 4000 50  0001 C CNN
F 3 "~" H 7875 4000 50  0001 C CNN
	1    7875 4000
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Dual_AACC D6
U 1 1 5C2F7544
P 8350 3575
F 0 "D6" H 8350 3228 50  0000 C CNN
F 1 "LED_Dual_AACC" H 8350 3319 50  0000 C CNN
F 2 "LED_SMD:LED_RGB_1210" H 8350 3320 50  0001 C CNN
F 3 "~" H 8380 3575 50  0001 C CNN
F 4 "160-1172-1-ND" H 8350 3575 50  0001 C CNN "Digi-Key"
F 5 "LTST-C155GEKT" H 8350 3575 50  0001 C CNN "MPN"
	1    8350 3575
	-1   0    0    1   
$EndComp
Wire Wire Line
	8650 3575 8650 3475
Wire Wire Line
	8650 3575 8650 3675
Connection ~ 8650 3575
$Comp
L Mechanical:MountingHole H1
U 1 1 5C2FA7DC
P 5250 1375
F 0 "H1" H 5350 1421 50  0000 L CNN
F 1 "MountingHole" H 5350 1330 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5250 1375 50  0001 C CNN
F 3 "~" H 5250 1375 50  0001 C CNN
	1    5250 1375
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5C2FB30A
P 5250 1575
F 0 "H2" H 5350 1621 50  0000 L CNN
F 1 "MountingHole" H 5350 1530 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 5250 1575 50  0001 C CNN
F 3 "~" H 5250 1575 50  0001 C CNN
	1    5250 1575
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4750 8500 4750
Text Label 8500 4750 0    50   ~ 0
IR_IN
Text Label 8500 4850 0    50   ~ 0
SDA
Text Label 8500 4950 0    50   ~ 0
SCL
Wire Wire Line
	6550 2500 6800 2500
Text Label 6800 2500 2    50   ~ 0
IR_IN
Wire Wire Line
	6550 3300 6800 3300
Wire Wire Line
	6550 3400 6800 3400
Text Label 6800 3300 2    50   ~ 0
SDA
Text Label 6800 3400 2    50   ~ 0
SCL
$Comp
L Device:R_Small R6
U 1 1 5C3068A7
P 8225 4750
F 0 "R6" H 8284 4796 50  0000 L CNN
F 1 "2.2k" H 8284 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8225 4750 50  0001 C CNN
F 3 "~" H 8225 4750 50  0001 C CNN
	1    8225 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5C30692F
P 8025 4850
F 0 "R5" H 8084 4896 50  0000 L CNN
F 1 "2.2k" H 8084 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 8025 4850 50  0001 C CNN
F 3 "~" H 8025 4850 50  0001 C CNN
	1    8025 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8225 4850 9000 4850
Wire Wire Line
	8025 4950 9000 4950
Wire Wire Line
	8025 4750 8025 4650
Wire Wire Line
	8025 4650 8125 4650
Wire Wire Line
	8125 4650 8125 4600
Connection ~ 8125 4650
Wire Wire Line
	8125 4650 8225 4650
$Comp
L power:+3.3V #PWR0140
U 1 1 5C30BB36
P 8125 4600
F 0 "#PWR0140" H 8125 4450 50  0001 C CNN
F 1 "+3.3V" H 8140 4773 50  0000 C CNN
F 2 "" H 8125 4600 50  0001 C CNN
F 3 "" H 8125 4600 50  0001 C CNN
	1    8125 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 5C30C249
P 8600 5550
F 0 "J1" H 8627 5526 50  0000 L CNN
F 1 "Conn_01x04_Female" H 8627 5435 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 8600 5550 50  0001 C CNN
F 3 "~" H 8600 5550 50  0001 C CNN
	1    8600 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5C30C452
P 8325 5450
F 0 "#PWR0141" H 8325 5200 50  0001 C CNN
F 1 "GND" H 8330 5277 50  0000 C CNN
F 2 "" H 8325 5450 50  0001 C CNN
F 3 "" H 8325 5450 50  0001 C CNN
	1    8325 5450
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0142
U 1 1 5C30C51C
P 8100 5550
F 0 "#PWR0142" H 8100 5400 50  0001 C CNN
F 1 "+3.3V" H 8115 5723 50  0000 C CNN
F 2 "" H 8100 5550 50  0001 C CNN
F 3 "" H 8100 5550 50  0001 C CNN
	1    8100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8325 5450 8400 5450
Wire Wire Line
	8400 5550 8100 5550
Wire Wire Line
	8400 5650 8100 5650
Text Label 8100 5650 0    50   ~ 0
SCL
Text Label 8100 5750 0    50   ~ 0
SDA
Wire Wire Line
	8100 5750 8400 5750
$Comp
L Mechanical:MountingHole H3
U 1 1 5C311733
P 1600 6200
F 0 "H3" H 1700 6246 50  0000 L CNN
F 1 "MountingHole" H 1700 6155 50  0000 L CNN
F 2 "Symbol:KiCad-Logo_5mm_SolderMask" H 1600 6200 50  0001 C CNN
F 3 "~" H 1600 6200 50  0001 C CNN
	1    1600 6200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5C3117A8
P 1600 6425
F 0 "H4" H 1700 6471 50  0000 L CNN
F 1 "MountingHole" H 1700 6380 50  0000 L CNN
F 2 "Symbol:OSHW-Logo_5.7x6mm_SilkScreen" H 1600 6425 50  0001 C CNN
F 3 "~" H 1600 6425 50  0001 C CNN
	1    1600 6425
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5C311B5D
P 1600 6650
F 0 "H5" H 1700 6696 50  0000 L CNN
F 1 "MountingHole" H 1700 6605 50  0000 L CNN
F 2 "MainBoard_Rev2:QR_Link" H 1600 6650 50  0001 C CNN
F 3 "~" H 1600 6650 50  0001 C CNN
	1    1600 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3700 6925 3700
Text Label 6925 3700 2    50   ~ 0
CONN_IND
Wire Wire Line
	7775 4000 7375 4000
Text Label 7375 4000 0    50   ~ 0
CONN_IND
Wire Wire Line
	7775 3675 7475 3675
Wire Wire Line
	7775 3475 7475 3475
Text Label 7475 3475 0    50   ~ 0
CHG_R
Text Label 7475 3675 0    50   ~ 0
CHG_G
Wire Wire Line
	6550 3500 6850 3500
Wire Wire Line
	6550 3600 6850 3600
Text Label 6850 3500 2    50   ~ 0
CHG_R
Text Label 6850 3600 2    50   ~ 0
CHG_G
$Comp
L Mechanical:MountingHole H6
U 1 1 5C31EBF4
P 1600 6875
F 0 "H6" H 1700 6921 50  0000 L CNN
F 1 "MountingHole" H 1700 6830 50  0000 L CNN
F 2 "MainBoard_Rev2:DragonIcon" H 1600 6875 50  0001 C CNN
F 3 "~" H 1600 6875 50  0001 C CNN
	1    1600 6875
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2700 6925 2700
Text Label 6925 2700 2    50   ~ 0
CHG_STAT
Wire Wire Line
	3900 4250 4300 4250
Text Label 4300 4250 2    50   ~ 0
CHG_STAT
$EndSCHEMATC
