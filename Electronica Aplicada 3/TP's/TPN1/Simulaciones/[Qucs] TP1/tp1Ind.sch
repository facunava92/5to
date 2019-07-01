<Qucs Schematic 0.0.19>
<Properties>
  <View=0,6,883,658,1,0,119>
  <Grid=10,10,1>
  <DataSet=tp1Ind.dat>
  <DataDisplay=tp1Ind.dpl>
  <OpenDisplay=1>
  <Script=tp1Ind.m>
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
  <GND * 1 560 310 0 0 0 0>
  <GND * 1 110 300 0 0 0 0>
  <Vac V1 1 110 260 18 -26 0 1 "1 V" 1 "1 Hz" 0 "0" 0 "0" 0>
  <Eqn Eqn1 1 680 40 -31 16 0 0 "XL=2*pi*acfrequency*L1.L*i" 1 "yes" 0>
  <Eqn Eqn2 1 680 140 -31 16 0 0 "XC=1/(2*pi*acfrequency*C1.C*i)" 1 "yes" 0>
  <Eqn Eqn5 1 700 460 -31 16 0 0 "modZ=abs(ZT)" 1 "yes" 0>
  <L L1 1 290 200 -26 10 0 0 "1 mH" 1 "" 0>
  <R R1 1 410 200 -26 15 0 0 "173 mOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C1 1 340 290 -26 17 0 0 "39.57 pF" 1 "" 0 "neutral" 0>
  <Eqn Eqn4 1 690 240 -31 16 0 0 "Zs=R1.R+XL" 1 "yes" 0>
  <Eqn Eqn3 1 690 350 -31 16 0 0 "ZT=Zs*XC/(Zs+XC)" 1 "yes" 0>
  <.AC AC1 1 130 430 0 39 0 0 "lin" 1 "0 kHz" 1 "2 MHz" 1 "1000" 1 "no" 0>
</Components>
<Wires>
  <110 290 110 300 "" 0 0 0 "">
  <560 200 560 310 "" 0 0 0 "">
  <440 200 490 200 "" 0 0 0 "">
  <320 200 380 200 "" 0 0 0 "">
  <110 200 110 230 "" 0 0 0 "">
  <110 200 220 200 "" 0 0 0 "">
  <220 290 310 290 "" 0 0 0 "">
  <220 200 260 200 "" 0 0 0 "">
  <220 200 220 290 "" 0 0 0 "">
  <370 290 490 290 "" 0 0 0 "">
  <490 200 560 200 "" 0 0 0 "">
  <490 200 490 290 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
