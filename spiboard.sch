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
Sheet 4 5
Title "RPI SPI BOARD DIP"
Date ""
Rev "V1"
Comp "Hobbyist Community"
Comment1 "Designed by quorten"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP1 C14
U 1 1 5F065474
P 6200 2350
F 0 "C14" H 6225 2450 50  0000 L CNN
F 1 "100uF" H 6225 2250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 6200 2350 50  0001 C CNN
F 3 "" H 6200 2350 50  0000 C CNN
F 4 "493-10975-1-ND" H 6200 2350 60  0001 C CNN "Digi-Key_PN"
F 5 "UFW1C101MDD1TD" H 6200 2350 60  0001 C CNN "MPN"
F 6 "Nichicon" H 6200 2350 60  0001 C CNN "Manufacturer"
	1    6200 2350
	1    0    0    -1  
$EndComp
$Comp
L TVS D1
U 1 1 5F0662BB
P 6850 2400
F 0 "D1" H 6850 2550 50  0000 C CNN
F 1 "5V 9.2V" H 6850 2250 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-35_SOD27_Horizontal_RM10" H 6850 2400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88378/sa5a.pdf" H 6850 2400 50  0001 C CNN
F 4 "SA5.0CA-E3/54GICT-ND" H 6850 2400 60  0001 C CNN "Digi-Key_PN"
F 5 "SA5.0CA-E3/54" H 6850 2150 50  0000 C CNN "MPN"
F 6 "Vishay Semiconductor Diodes Division" H 6850 2400 60  0001 C CNN "Manufacturer"
	1    6850 2400
	0    1    1    0   
$EndComp
$Comp
L TVS D2
U 1 1 5F0662EE
P 6850 3200
F 0 "D2" H 6850 3350 50  0000 C CNN
F 1 "33V 53.3V" H 6850 3050 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-201AD_Horizontal_RM15" H 6850 3200 50  0001 C CNN
F 3 "https://www.mccsemi.com/pdf/Products/5KP5.0(C)%20~5KP110(C)A%20(R-6).pdf" H 6850 3200 50  0001 C CNN
F 4 "5KP33CA-TPMSCT-ND" H 6850 3200 60  0001 C CNN "Digi-Key_PN"
F 5 "5KP33CA-TP" H 6850 2950 50  0000 C CNN "MPN"
F 6 "Micro Commercial Co" H 6850 3200 60  0001 C CNN "Manufacturer"
	1    6850 3200
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 5F066319
P 8750 2550
F 0 "P1" H 8750 2700 50  0000 C CNN
F 1 "CONN_01X02" V 8850 2550 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 8750 2550 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705430036_sd.pdf" H 8750 2550 50  0001 C CNN
F 4 "WM4824-ND" H 8750 2550 60  0001 C CNN "Digi-Key_PN"
F 5 "0705430036" V 8900 2550 50  0000 C CNN "MPN"
F 6 "Molex" H 8750 2550 60  0001 C CNN "Manufacturer"
	1    8750 2550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 5F066370
P 8750 2950
F 0 "P2" H 8750 3100 50  0000 C CNN
F 1 "CONN_01X02" V 8850 2950 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 8750 2950 50  0001 C CNN
F 3 "https://www.molex.com/pdm_docs/sd/705430036_sd.pdf" H 8750 2950 50  0001 C CNN
F 4 "WM4824-ND" H 8750 2950 60  0001 C CNN "Digi-Key_PN"
F 5 "0705430036" H 8750 2950 60  0001 C CNN "MPN"
F 6 "Molex" H 8750 2950 60  0001 C CNN "Manufacturer"
	1    8750 2950
	1    0    0    -1  
$EndComp
$Comp
L F_Small F1
U 1 1 5F0663AF
P 7450 2100
F 0 "F1" H 7410 2160 50  0000 L CNN
F 1 "16V 2A" H 7300 2000 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 7450 2100 50  0001 C CNN
F 3 "https://www.bourns.com/docs/product-datasheets/mfrht.pdf" H 7450 2100 50  0001 C CNN
F 4 "MF-RHT200-2CT-ND" H 7450 2100 60  0001 C CNN "Digi-Key_PN"
F 5 "MF-RHT200-2" H 7400 1900 50  0000 C CNN "MPN"
F 6 "Bourns Inc." H 7450 2100 60  0001 C CNN "Manufacturer"
	1    7450 2100
	1    0    0    -1  
$EndComp
$Comp
L F_Small F2
U 1 1 5F0663E0
P 7450 2900
F 0 "F2" H 7410 2960 50  0000 L CNN
F 1 "60V 1.1A" H 7300 2800 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 7450 2900 50  0001 C CNN
F 3 "https://www.littelfuse.com/~/media/electronics/product_specifications/resettable_ptcs/littelfuse_ptc_rkef110_product_specification.pdf.pdf" H 7450 2900 50  0001 C CNN
F 4 "RKEF110HF-ND" H 7450 2900 60  0001 C CNN "Digi-Key_PN"
F 5 "RKEF110" H 7450 2700 50  0000 C CNN "MPN"
F 6 "Littelfuse Inc." H 7450 2900 60  0001 C CNN "Manufacturer"
	1    7450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2100 7350 2100
Wire Wire Line
	5900 2900 7350 2900
Wire Wire Line
	6500 3500 8550 3500
Connection ~ 6850 2100
Wire Wire Line
	6200 2500 6200 2700
Wire Wire Line
	6500 2700 8550 2700
Connection ~ 6850 2700
$Comp
L D_Schottky D3
U 1 1 5F07B28F
P 6350 2700
F 0 "D3" H 6350 2800 50  0000 C CNN
F 1 "5A" H 6350 2600 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-201AD_Horizontal_RM15" H 6350 2700 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/SB580-D.pdf" H 6350 2700 50  0001 C CNN
F 4 "SB540FSCT-ND" H 6350 2700 60  0001 C CNN "Digi-Key_PN"
F 5 "SB540" H 6350 2700 60  0001 C CNN "MPN"
F 6 "ON Semiconductor" H 6350 2700 60  0001 C CNN "Manufacturer"
	1    6350 2700
	-1   0    0    1   
$EndComp
$Comp
L D_Schottky D4
U 1 1 5F07B2EE
P 6350 3500
F 0 "D4" H 6350 3600 50  0000 C CNN
F 1 "5A" H 6350 3400 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-201AD_Horizontal_RM15" H 6350 3500 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/SB580-D.pdf" H 6350 3500 50  0001 C CNN
F 4 "SB540FSCT-ND" H 6350 3500 60  0001 C CNN "Digi-Key_PN"
F 5 "SB540" H 6350 3500 60  0001 C CNN "MPN"
F 6 "ON Semiconductor" H 6350 3500 60  0001 C CNN "Manufacturer"
	1    6350 3500
	-1   0    0    1   
$EndComp
Connection ~ 6850 3500
Wire Wire Line
	6200 2700 5900 2700
Wire Wire Line
	6200 3500 5900 3500
Connection ~ 6850 2900
Text HLabel 5900 2100 0    60   Output ~ 0
VCC_LGIC
Text HLabel 5900 2700 0    60   Output ~ 0
GND_LGIC
Text HLabel 5900 2900 0    60   Output ~ 0
VS_MTR
Text HLabel 5900 3500 0    60   Output ~ 0
GND_MTR
Wire Wire Line
	6200 2200 6200 2100
Connection ~ 6200 2100
Wire Wire Line
	8550 2700 8550 2600
Wire Wire Line
	8350 2900 8550 2900
Wire Wire Line
	8550 3500 8550 3000
$Comp
L CONN_02X20 P3
U 1 1 5F07EA22
P 4250 3950
F 0 "P3" H 4250 5000 50  0000 C CNN
F 1 "CONN_02X20" V 4250 3950 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 4250 3000 50  0001 C CNN
F 3 "https://s3.amazonaws.com/catalogspreads-pdf/PAGE122%20.100%20SBH11%20SERIES%20MALE%20BOX%20HDR%20ST%20RA%20SMT.pdf" H 4250 3000 50  0001 C CNN
F 4 "S9175-ND" H 4250 3950 60  0001 C CNN "Digi-Key_PN"
F 5 "SBH11-PBPC-D20-ST-BK" V 4250 3950 50  0000 C CNN "MPN"
F 6 "Sullins Connector Solutions" H 4250 3950 60  0001 C CNN "Manufacturer"
	1    4250 3950
	0    -1   -1   0   
$EndComp
$Comp
L Switch_DPST SW1
U 1 1 5F0A18E2
P 8050 2700
F 0 "SW1" H 8050 3050 50  0000 C CNN
F 1 "DPST 6A" H 8050 2400 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_4xSquare_0-8mmDrill" H 8050 2700 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1433/s.pdf" H 8050 2700 50  0001 C CNN
F 4 "CKN9891-ND" H 8050 2700 60  0001 C CNN "Digi-Key_PN"
F 5 "S201031MS02Q" H 8050 2400 50  0001 C CNN "MPN"
F 6 "C&K" H 8050 2700 60  0001 C CNN "Manufacturer"
	1    8050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2900 7750 2900
Wire Wire Line
	7750 2500 7750 2100
Wire Wire Line
	7750 2100 7550 2100
Wire Wire Line
	8550 2500 8350 2500
$EndSCHEMATC
