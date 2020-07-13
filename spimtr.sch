EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:dk_Transistors-Bipolar-BJT-Single
LIBS:ul_ics
LIBS:ul_resists
LIBS:rpihw-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "SPI MOTOR CTL DIP"
Date ""
Rev "V1"
Comp "Hobbyist Community"
Comment1 "Designed by quorten"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L L293D CR1
U 1 1 5EA79D6D
P 7200 1500
F 0 "CR1" H 8400 2000 60  0000 C CNN
F 1 "L293D" H 8400 1900 60  0000 C CNN
F 2 "rpihw:PowerDIP-16" H 8400 1840 60  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/04/ac/22/f9/20/5d/43/a1/CD00000059.pdf/files/CD00000059.pdf/jcr:content/translations/en.CD00000059.pdf" H 7200 1500 60  0001 C CNN
F 4 "497-2936-5-ND" H 7200 1500 60  0001 C CNN "Digi-Key_PN"
F 5 "L293D" H 7200 1500 60  0001 C CNN "MPN"
F 6 "STMicroelectronics" H 7200 1500 60  0001 C CNN "Manufacturer"
	1    7200 1500
	1    0    0    -1  
$EndComp
$Comp
L L293D CR2
U 1 1 5EA79DBA
P 7200 4300
F 0 "CR2" H 8400 4800 60  0000 C CNN
F 1 "L293D" H 8400 4700 60  0000 C CNN
F 2 "rpihw:PowerDIP-16" H 8400 4640 60  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/04/ac/22/f9/20/5d/43/a1/CD00000059.pdf/files/CD00000059.pdf/jcr:content/translations/en.CD00000059.pdf" H 7200 4300 60  0001 C CNN
F 4 "497-2936-5-ND" H 7200 4300 60  0001 C CNN "Digi-Key_PN"
F 5 "L293D" H 7200 4300 60  0001 C CNN "MPN"
F 6 "STMicroelectronics" H 7200 4300 60  0001 C CNN "Manufacturer"
	1    7200 4300
	1    0    0    -1  
$EndComp
$Comp
L SN74HC595N U7
U 1 1 5EA79E47
P 900 3600
F 0 "U7" H 1700 4000 60  0000 C CNN
F 1 "SN74HC595N" H 1700 3900 60  0000 C CNN
F 2 "rpihw:N16" H 1700 3840 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf?ts=1588126497782" H 900 3600 60  0001 C CNN
F 4 "296-1600-5-ND" H 900 3600 60  0001 C CNN "Digi-Key_PN"
F 5 "SN74HC595N" H 900 3600 60  0001 C CNN "MPN"
F 6 "Texas Instruments" H 900 3600 60  0001 C CNN "Manufacturer"
	1    900  3600
	1    0    0    -1  
$EndComp
$Comp
L SN74HC08N U9
U 1 1 5EA79EB5
P 5000 2100
F 0 "U9" H 5800 2500 60  0000 C CNN
F 1 "SN74HC08N" H 5800 2400 60  0000 C CNN
F 2 "rpihw:N14" H 5800 2340 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc08.pdf?ts=1588126416768" H 5000 2100 60  0001 C CNN
F 4 "296-1570-5-ND" H 5000 2100 60  0001 C CNN "Digi-Key_PN"
F 5 "SN74HC08N" H 5000 2100 60  0001 C CNN "MPN"
F 6 "Texas Instruments" H 5000 2100 60  0001 C CNN "Manufacturer"
	1    5000 2100
	1    0    0    -1  
$EndComp
$Comp
L SN74HC32N U8
U 1 1 5EA79F02
P 3100 2100
F 0 "U8" H 3900 2500 60  0000 C CNN
F 1 "SN74HC32N" H 3900 2400 60  0000 C CNN
F 2 "rpihw:N14" H 3900 2340 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc32.pdf?ts=1588126663756" H 3100 2100 60  0001 C CNN
F 4 "296-1589-5-ND" H 3100 2100 60  0001 C CNN "Digi-Key_PN"
F 5 "SN74HC32N" H 3100 2100 60  0001 C CNN "MPN"
F 6 "Texas Instruments" H 3100 2100 60  0001 C CNN "Manufacturer"
	1    3100 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4300 3450 4300
Wire Wire Line
	2600 4300 2600 2100
Wire Wire Line
	2600 2100 3100 2100
Wire Wire Line
	2500 4200 3350 4200
Wire Wire Line
	2650 4200 2650 2200
Wire Wire Line
	2650 2200 3100 2200
Wire Wire Line
	2500 4100 3250 4100
Wire Wire Line
	2700 4100 2700 2300
Wire Wire Line
	2700 2300 3100 2300
Wire Wire Line
	2500 4000 3150 4000
Wire Wire Line
	2750 4000 2750 2400
Wire Wire Line
	2750 2400 3100 2400
Wire Wire Line
	2500 3900 2800 3900
Wire Wire Line
	2800 2500 2800 4350
Wire Wire Line
	2800 2500 3100 2500
Wire Wire Line
	2500 3800 2850 3800
Wire Wire Line
	2850 2600 2850 4400
Wire Wire Line
	2850 2600 3100 2600
Wire Wire Line
	2500 3700 2900 3700
Wire Wire Line
	2900 2700 2900 4500
Wire Wire Line
	2900 2700 3100 2700
Wire Wire Line
	2500 3600 2950 3600
Wire Wire Line
	2950 2800 2950 4600
Wire Wire Line
	2950 2800 3100 2800
Wire Wire Line
	4700 2100 4850 2100
Wire Wire Line
	4850 2100 4850 2200
Wire Wire Line
	4850 2200 5000 2200
Wire Wire Line
	4700 2200 4800 2200
Wire Wire Line
	4800 2200 4800 2400
Wire Wire Line
	4800 2400 5000 2400
Wire Wire Line
	4700 2300 4750 2300
Wire Wire Line
	4750 2300 4750 2600
Wire Wire Line
	4750 2600 5000 2600
Wire Wire Line
	4700 2400 4700 2700
Wire Wire Line
	4700 2700 4850 2700
Wire Wire Line
	4850 2700 4850 2800
Wire Wire Line
	4850 2800 5000 2800
Wire Wire Line
	4950 2700 5000 2700
Wire Wire Line
	4950 1300 4950 2700
Wire Wire Line
	5000 2500 4950 2500
Connection ~ 4950 2500
Wire Wire Line
	5000 2300 4950 2300
Connection ~ 4950 2300
Wire Wire Line
	5000 2100 4950 2100
Connection ~ 4950 2100
Wire Wire Line
	6600 2200 6800 2200
Wire Wire Line
	6800 2200 6800 900 
Wire Wire Line
	6800 900  9800 900 
Wire Wire Line
	9800 900  9800 1500
Wire Wire Line
	9800 1500 9600 1500
Wire Wire Line
	6700 800  9700 800 
Wire Wire Line
	9700 800  9700 1400
Wire Wire Line
	9700 1400 9600 1400
Wire Wire Line
	6700 800  6700 2100
Wire Wire Line
	6700 2100 6600 2100
Wire Wire Line
	6600 2300 6800 2300
Wire Wire Line
	6800 2300 6800 3600
Wire Wire Line
	6800 3600 9800 3600
Wire Wire Line
	9800 3600 9800 4200
Wire Wire Line
	9800 4200 9600 4200
Wire Wire Line
	6600 2400 6700 2400
Wire Wire Line
	6700 2400 6700 3700
Wire Wire Line
	6700 3700 9700 3700
Wire Wire Line
	9700 3700 9700 4300
Wire Wire Line
	9700 4300 9600 4300
Wire Wire Line
	6900 4200 6900 1500
Wire Wire Line
	6900 1500 7200 1500
Connection ~ 2600 4300
Wire Wire Line
	6950 4100 6950 1600
Wire Wire Line
	6950 1600 7200 1600
Connection ~ 2650 4200
Wire Wire Line
	7000 4000 7000 1700
Wire Wire Line
	7000 1700 7200 1700
Connection ~ 2700 4100
Wire Wire Line
	7050 3900 7050 1800
Wire Wire Line
	7050 1800 7200 1800
Connection ~ 2750 4000
Wire Wire Line
	3150 4000 3150 3900
Wire Wire Line
	3150 3900 7050 3900
Wire Wire Line
	3250 4100 3250 4000
Wire Wire Line
	3250 4000 7000 4000
Wire Wire Line
	3350 4200 3350 4100
Wire Wire Line
	3350 4100 6950 4100
Wire Wire Line
	3450 4300 3450 4200
Wire Wire Line
	3450 4200 6900 4200
Wire Wire Line
	2800 4350 3600 4350
Wire Wire Line
	3600 4350 3600 4300
Wire Wire Line
	3600 4300 7200 4300
Connection ~ 2800 3900
Wire Wire Line
	2850 4400 7200 4400
Connection ~ 2850 3800
Wire Wire Line
	2900 4500 7200 4500
Connection ~ 2900 3700
Wire Wire Line
	2950 4600 7200 4600
Connection ~ 2950 3600
Wire Wire Line
	6600 2800 6600 3500
Wire Wire Line
	10000 3500 6100 3500
Wire Wire Line
	9600 3000 10000 3000
Wire Wire Line
	10000 5800 9600 5800
Connection ~ 10000 3500
Wire Wire Line
	9600 3200 9700 3200
Wire Wire Line
	9700 3200 9700 3450
Wire Wire Line
	3050 3450 10100 3450
Wire Wire Line
	4900 3450 4900 3200
Wire Wire Line
	4900 3200 5000 3200
Wire Wire Line
	3050 3450 3050 3200
Wire Wire Line
	3050 3200 3100 3200
Connection ~ 4900 3450
Wire Wire Line
	10100 3450 10100 6100
Connection ~ 9700 3450
Wire Wire Line
	6100 3500 6100 3700
Wire Wire Line
	6100 3700 4800 3700
Wire Wire Line
	4800 4800 4800 2800
Wire Wire Line
	4800 2800 4700 2800
Connection ~ 6600 3500
Wire Wire Line
	2500 4800 4800 4800
Connection ~ 4800 3700
Wire Wire Line
	4700 5100 4700 3450
Wire Wire Line
	800  5100 4700 5100
Wire Wire Line
	800  4400 800  5300
Wire Wire Line
	800  4400 900  4400
Connection ~ 4700 3450
Wire Wire Line
	7200 2300 7150 2300
Wire Wire Line
	7150 2300 7150 5600
Wire Wire Line
	7150 5100 7200 5100
Connection ~ 7150 5100
Text HLabel 9600 1700 2    60   Output ~ 0
OUT1
Text HLabel 9600 1900 2    60   Output ~ 0
OUT2
Text HLabel 9600 2100 2    60   Output ~ 0
OUT3
Text HLabel 9600 2300 2    60   Output ~ 0
OUT4
Text HLabel 9600 4500 2    60   Output ~ 0
OUT5
Text HLabel 9600 4700 2    60   Output ~ 0
OUT6
Text HLabel 9600 4900 2    60   Output ~ 0
OUT7
Text HLabel 9600 5100 2    60   Output ~ 0
OUT8
Text HLabel 900  2600 1    60   Input ~ 0
*RST
Text HLabel 600  2600 1    60   Input ~ 0
SCLK
Text HLabel 700  2600 1    60   Input ~ 0
MOSI
Text HLabel 800  2600 1    60   Input ~ 0
SS
Wire Wire Line
	900  3600 550  3600
Wire Wire Line
	550  3600 550  5300
Wire Wire Line
	550  5050 2700 5050
Wire Wire Line
	2700 5050 2700 4800
Connection ~ 2700 4800
Text HLabel 4950 1300 1    60   Input ~ 0
PWM
Wire Wire Line
	900  2600 900  3700
Wire Wire Line
	800  3800 900  3800
Wire Wire Line
	800  2600 800  3800
Wire Wire Line
	900  3900 700  3900
Wire Wire Line
	700  3900 700  2600
Wire Wire Line
	600  4000 900  4000
Wire Wire Line
	600  2600 600  4000
Text HLabel 1300 2600 1    60   Output ~ 0
SCLK_D
Text HLabel 1400 2600 1    60   Output ~ 0
MOSI_D
Text HLabel 1500 2600 1    60   Output ~ 0
SS_D
Text HLabel 1600 2600 1    60   Output ~ 0
*RST_D
Wire Wire Line
	2500 4400 2500 3100
Wire Wire Line
	2500 3100 1400 3100
Wire Wire Line
	1400 3100 1400 2600
Wire Wire Line
	600  2700 1300 2700
Wire Wire Line
	1300 2700 1300 2600
Connection ~ 600  2700
Wire Wire Line
	800  2800 1500 2800
Wire Wire Line
	1500 2800 1500 2600
Connection ~ 800  2800
Wire Wire Line
	900  2900 1600 2900
Wire Wire Line
	1600 2900 1600 2600
Connection ~ 900  2900
Text HLabel 7150 5600 3    60   Input ~ 0
VS
Connection ~ 800  5100
Connection ~ 550  5050
Text HLabel 800  5300 3    60   Input ~ 0
VCC
Text HLabel 550  5300 3    60   Input ~ 0
GND
$Comp
L C C7
U 1 1 5EA848F3
P 2900 4950
F 0 "C7" H 2925 5050 50  0000 L CNN
F 1 "100nF" H 2925 4850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4_W2.5_P2.5" H 2938 4800 50  0001 C CNN
F 3 "" H 2900 4950 50  0000 C CNN
F 4 "399-9859-1-ND" H 2900 4950 60  0001 C CNN "Digi-Key_PN"
F 5 "C315C104M5U5TA7303" H 2900 4950 60  0001 C CNN "MPN"
F 6 "KEMET" H 2900 4950 60  0001 C CNN "Manufacturer"
	1    2900 4950
	1    0    0    -1  
$EndComp
Connection ~ 2900 4800
Connection ~ 2900 5100
$Comp
L C C8
U 1 1 5EA84CF5
P 4700 3300
F 0 "C8" H 4550 3400 50  0000 L CNN
F 1 "100nF" H 4400 3200 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4_W2.5_P2.5" H 4738 3150 50  0001 C CNN
F 3 "" H 4700 3300 50  0000 C CNN
F 4 "399-9859-1-ND" H 4700 3300 60  0001 C CNN "Digi-Key_PN"
F 5 "C315C104M5U5TA7303" H 4700 3300 60  0001 C CNN "MPN"
F 6 "KEMET" H 4700 3300 60  0001 C CNN "Manufacturer"
	1    4700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3150 4700 3050
Wire Wire Line
	4700 3050 4800 3050
Connection ~ 4800 3050
$Comp
L C C9
U 1 1 5EA851B7
P 6500 3300
F 0 "C9" H 6350 3400 50  0000 L CNN
F 1 "100nF" H 6350 3200 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4_W2.5_P2.5" H 6538 3150 50  0001 C CNN
F 3 "" H 6500 3300 50  0000 C CNN
F 4 "399-9859-1-ND" H 6500 3300 60  0001 C CNN "Digi-Key_PN"
F 5 "C315C104M5U5TA7303" H 6500 3300 60  0001 C CNN "MPN"
F 6 "KEMET" H 6500 3300 60  0001 C CNN "Manufacturer"
	1    6500 3300
	1    0    0    -1  
$EndComp
Connection ~ 6500 3450
Wire Wire Line
	6500 3150 6500 3050
Wire Wire Line
	6500 3050 6600 3050
Connection ~ 6600 3050
$Comp
L C C10
U 1 1 5EA856DD
P 9850 3200
F 0 "C10" H 9875 3300 50  0000 L CNN
F 1 "100nF" H 9875 3100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4_W2.5_P2.5" H 9888 3050 50  0001 C CNN
F 3 "" H 9850 3200 50  0000 C CNN
F 4 "399-9859-1-ND" H 9850 3200 60  0001 C CNN "Digi-Key_PN"
F 5 "C315C104M5U5TA7303" H 9850 3200 60  0001 C CNN "MPN"
F 6 "KEMET" H 9850 3200 60  0001 C CNN "Manufacturer"
	1    9850 3200
	0    1    1    0   
$EndComp
$Comp
L C C11
U 1 1 5EA85AC2
P 9750 5950
F 0 "C11" H 9775 6050 50  0000 L CNN
F 1 "100nF" H 9775 5850 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4_W2.5_P2.5" H 9788 5800 50  0001 C CNN
F 3 "" H 9750 5950 50  0000 C CNN
F 4 "399-9859-1-ND" H 9750 5950 60  0001 C CNN "Digi-Key_PN"
F 5 "C315C104M5U5TA7303" H 9750 5950 60  0001 C CNN "MPN"
F 6 "KEMET" H 9750 5950 60  0001 C CNN "Manufacturer"
	1    9750 5950
	1    0    0    -1  
$EndComp
Connection ~ 10000 3200
Wire Wire Line
	10100 6100 9600 6100
Wire Wire Line
	9600 6100 9600 6000
Connection ~ 9750 6100
Connection ~ 9750 5800
Wire Wire Line
	10000 3000 10000 5800
Wire Wire Line
	7150 3850 10200 3850
Connection ~ 7150 3850
$Comp
L CP1 C13
U 1 1 5EA8FB1A
P 10200 5350
F 0 "C13" H 10150 5100 50  0000 L CNN
F 1 "220uF" H 10150 5000 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D8_L11.5_P3.5" H 10200 5350 50  0001 C CNN
F 3 "" H 10200 5350 50  0000 C CNN
F 4 "P16296-ND" H 10200 5350 60  0001 C CNN "Digi-Key_PN"
F 5 "16SEPC220MD" H 10200 5350 60  0001 C CNN "MPN"
F 6 "Panasonic Electronic Components" H 10200 5350 60  0001 C CNN "Manufacturer"
	1    10200 5350
	1    0    0    -1  
$EndComp
$Comp
L CP1 C12
U 1 1 5EA90670
P 10200 2850
F 0 "C12" H 10225 2950 50  0000 L CNN
F 1 "220uF" H 10225 2750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D8_L11.5_P3.5" H 10200 2850 50  0001 C CNN
F 3 "" H 10200 2850 50  0000 C CNN
F 4 "P16296-ND" H 10200 2850 60  0001 C CNN "Digi-Key_PN"
F 5 "16SEPC220MD" H 10400 2600 60  0000 C CNN "MPN"
F 6 "Panasonic Electronic Components" H 10200 2850 60  0001 C CNN "Manufacturer"
	1    10200 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	10200 3000 10200 5200
Connection ~ 10200 3850
Wire Wire Line
	9600 2700 10300 2700
Wire Wire Line
	9600 5500 10300 5500
Wire Wire Line
	10300 2700 10300 5800
Connection ~ 10200 5500
Connection ~ 10200 2700
Connection ~ 10300 5500
Text HLabel 10300 5800 3    60   Input ~ 0
GND_S
Wire Wire Line
	1000 2600 1000 3000
Wire Wire Line
	1000 3000 1700 3000
Wire Wire Line
	1700 3000 1700 2600
Text HLabel 1000 2600 1    60   Output ~ 0
MISO
Text HLabel 1700 2600 1    60   Input ~ 0
MISO_D
$EndSCHEMATC
