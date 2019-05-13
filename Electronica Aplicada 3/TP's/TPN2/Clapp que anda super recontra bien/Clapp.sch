<Qucs Schematic 0.0.19>
<Properties>
  <View=-75,-43,1504,865,0.673302,32,0>
  <Grid=10,10,1>
  <DataSet=Clapp.dat>
  <DataDisplay=Clapp.dpl>
  <OpenDisplay=1>
  <Script=Clapp.m>
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
  <GND * 1 610 820 0 0 0 0>
  <R R3 1 990 670 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <_BJT MPSH10_1 1 640 360 8 -26 0 0 "npn" 0 "6.928e-17" 0 "1" 0 "1" 0 "22.83m" 0 "0" 0 "100" 0 "0" 0 "6.928e-17" 0 "1.197" 0 "0" 0 "2" 0 "308.6" 0 "1.11" 0 "0" 0 "0" 0 "4" 0 "0" 0 "10" 0 "1.52p" 0 "0.75" 0 "0.3223" 0 "1.042p" 0 "0.75" 0 "0.2468" 0 "1" 0 "0" 0 "0.75" 0 "0" 0 "0.5" 0 "135.8p" 0 "30" 0 "10" 0 "0.27" 0 "1.558n" 0 "26.85" 0 "0" 0 "1" 0 "1" 0 "0" 0 "1" 0 "1" 0 "0" 0 "1.5" 0 "3" 0 "1.11" 0 "26.85" 0 "1" 0>
  <C C1 1 220 570 17 -26 0 1 "36 pF" 1 "" 0 "neutral" 0>
  <L L3 1 330 360 -26 10 0 0 "0.12888 uH" 1 "" 0>
  <C C5 1 550 510 17 -26 0 1 "68 pF" 1 "" 0 "neutral" 0>
  <C C6 1 550 670 17 -26 0 1 "68 pF" 1 "" 0 "neutral" 0>
  <Vdc V1 1 180 330 18 -26 0 1 "12 V" 1>
  <L L4 1 550 130 -26 10 0 0 "0.43947 uH" 1 "" 0>
  <R R4 1 640 670 15 -26 0 1 "200 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Eqn Eqn1 1 220 20 -32 16 0 0 "y=Time2Freq(Vout.Vt,time)" 1 "yes" 0>
  <R R1 1 450 240 15 -26 0 1 "2700 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R5 1 450 580 15 -26 0 1 "235 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <.TR TR1 1 860 0 0 71 0 0 "lin" 1 "6 us" 1 "6.5 us" 1 "2000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <C C2 1 840 290 -26 17 0 0 "5.2 pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn2 1 510 10 -31 16 0 0 "Pot=((rms(Vout.Vt)^2)/50)*1000" 1 "yes" 0>
</Components>
<Wires>
  <610 780 610 820 "" 0 0 0 "">
  <990 700 990 780 "" 0 0 0 "">
  <450 360 550 360 "" 0 0 0 "">
  <360 360 450 360 "" 0 0 0 "">
  <610 780 640 780 "" 0 0 0 "">
  <640 780 990 780 "" 0 0 0 "">
  <640 700 640 780 "" 0 0 0 "">
  <640 580 640 640 "" 0 0 0 "">
  <550 580 640 580 "" 0 0 0 "">
  <550 780 610 780 "" 0 0 0 "">
  <450 780 550 780 "" 0 0 0 "">
  <550 580 550 640 "" 0 0 0 "">
  <550 700 550 780 "" 0 0 0 "">
  <640 390 640 580 "" 0 0 0 "">
  <640 290 640 330 "" 0 0 0 "">
  <550 360 610 360 "" 0 0 0 "">
  <550 360 550 480 "" 0 0 0 "">
  <550 540 550 580 "" 0 0 0 "">
  <220 360 300 360 "" 0 0 0 "">
  <220 360 220 540 "" 0 0 0 "">
  <220 780 450 780 "" 0 0 0 "">
  <220 600 220 780 "" 0 0 0 "">
  <990 290 990 640 "" 0 0 0 "">
  <870 290 990 290 "" 0 0 0 "">
  <640 290 810 290 "" 0 0 0 "">
  <180 780 220 780 "" 0 0 0 "">
  <180 360 180 780 "" 0 0 0 "">
  <180 130 450 130 "" 0 0 0 "">
  <180 130 180 300 "" 0 0 0 "">
  <640 130 640 290 "" 0 0 0 "">
  <580 130 640 130 "" 0 0 0 "">
  <450 130 520 130 "" 0 0 0 "">
  <450 130 450 210 "" 0 0 0 "">
  <450 270 450 360 "" 0 0 0 "">
  <450 360 450 550 "" 0 0 0 "">
  <450 610 450 780 "" 0 0 0 "">
  <990 290 990 290 "Vout" 1020 260 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
