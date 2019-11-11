<Qucs Schematic 0.0.19>
<Properties>
  <View=0,72,1353,1695,0.909091,0,0>
  <Grid=10,10,1>
  <DataSet=ask.dat>
  <DataDisplay=ask.dpl>
  <OpenDisplay=1>
  <Script=ask.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Título>
  <FrameText1=Dibujado por:>
  <FrameText2=Fecha:>
  <FrameText3=Revisión:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Lib QNT1 1 820 250 -19 21 0 0 "Ideal" 0 "Quantizer" 0 "0" 1 "1" 1 "16" 1>
  <Lib LP2F1 1 600 240 -20 24 0 0 "Ideal" 0 "LP2" 0 "1E3" 1 "1.4142" 0 "1" 0 "0" 1>
  <Diode D_1N4001_2 1 420 250 -26 -64 0 2 "76.9p" 1 "1.45" 1 "39.8p" 0 "0.333" 0 "0.7" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "42m" 0 "4.32u" 0 "0" 0 "0" 0 "1" 0 "1" 0 "50" 0 "5u" 0 "26.85" 0 "3.0" 0 "1.11" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "0.0" 0 "26.85" 0 "1.0" 0 "normal" 0>
  <R R1 1 510 380 15 -26 0 1 "1 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Lib MUL1 1 260 320 -20 24 0 0 "Ideal" 0 "Mul" 0>
  <GND * 1 120 360 0 0 0 0>
  <GND * 1 170 490 0 0 0 0>
  <GND * 1 510 450 0 0 0 0>
  <Amp X1 1 690 250 -26 27 0 0 "25" 1 "50 Ohm" 0 "50 Ohm" 0 "0 dB" 0>
  <Vrect V2 1 170 420 18 -26 0 1 "1 V" 1 "1 ms" 1 "1 ms" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <Vac V1 1 120 290 18 -26 0 1 "1 V" 1 "1.9 kHz" 0 "0" 0 "0" 0>
  <.TR TR1 1 1160 260 0 78 0 0 "lin" 1 "0" 1 "10 ms" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <120 320 120 360 "" 0 0 0 "">
  <120 240 120 260 "" 0 0 0 "">
  <120 240 260 240 "Vport" 200 210 50 "">
  <260 240 260 290 "" 0 0 0 "">
  <170 320 230 320 "Vinfo" 230 290 30 "">
  <170 320 170 390 "" 0 0 0 "">
  <170 450 170 490 "" 0 0 0 "">
  <290 250 290 320 "" 0 0 0 "">
  <290 250 390 250 "Vmod" 330 220 9 "">
  <450 240 450 250 "" 0 0 0 "">
  <450 240 510 240 "" 0 0 0 "">
  <630 240 630 250 "" 0 0 0 "">
  <630 250 660 250 "" 0 0 0 "">
  <720 250 790 250 "Vfiltr" 780 220 25 "">
  <850 250 900 250 "" 0 0 0 "">
  <510 240 570 240 "" 0 0 0 "">
  <510 240 510 350 "" 0 0 0 "">
  <510 410 510 450 "" 0 0 0 "">
  <510 240 510 240 "Vrectif" 540 210 0 "">
  <900 250 900 250 "Vdemod" 930 220 0 "">
</Wires>
<Diagrams>
  <Rect 80 786 950 236 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "">
	<"Vinfo.Vt" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 80 1327 967 227 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "">
	<"Vmod.Vt" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 80 1058 961 218 3 #c0c0c0 1 00 1 0 0.0005 0.01 1 -1.2 1 1.2 1 -1 0.5 1 315 0 225 "" "" "">
	<"Vport.Vt" #0000ff 0 3 0 0 0>
  </Rect>
  <Rect 80 1589 972 199 3 #c0c0c0 1 00 1 0 0.2 1 1 -0.1 0.5 1.1 1 -0.1 0.5 1.1 315 0 225 "" "" "">
	<"Vdemod.Vt" #0000ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
