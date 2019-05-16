<Qucs Schematic 0.0.19>
<Properties>
  <View=0,-37,883,618,1,0,0>
  <Grid=10,10,1>
  <DataSet=tp1Res.dat>
  <DataDisplay=tp1Res.dpl>
  <OpenDisplay=1>
  <Script=tp1Res.m>
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
  <GND * 1 110 320 0 0 0 0>
  <Vac V1 1 110 280 18 -26 0 1 "1 V" 1 "1 Hz" 0 "0" 0 "0" 0>
  <Eqn Eqn1 1 680 60 -31 16 0 0 "XL=2*pi*acfrequency*L1.L*i" 1 "yes" 0>
  <Eqn Eqn2 1 680 160 -31 16 0 0 "XC=1/(2*pi*acfrequency*C1.C*i)" 1 "yes" 0>
  <Eqn Eqn3 1 700 480 -31 16 0 0 "modZ=abs(ZT)" 1 "yes" 0>
  <Eqn Eqn5 1 690 370 -31 16 0 0 "ZT=Zs*XC/(Zs+XC)" 1 "yes" 0>
  <GND * 1 560 360 0 0 0 0>
  <C C1 1 340 310 -26 17 0 0 "0.1 pF" 1 "" 0 "neutral" 0>
  <L L1 1 290 220 -26 10 0 0 "1 nH" 1 "" 0>
  <L L2 1 510 220 -26 10 0 0 "1 nH" 1 "" 0>
  <R R1 1 400 220 -26 15 0 0 "51 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Eqn Eqn4 1 690 260 -31 16 0 0 "Zs=R1.R+(2*XL)" 1 "yes" 0>
  <.AC AC1 1 130 450 0 39 0 0 "lin" 1 "0 Hz" 1 "30 GHz" 1 "1000" 1 "no" 0>
</Components>
<Wires>
  <110 310 110 320 "" 0 0 0 "">
  <560 220 560 310 "" 0 0 0 "">
  <110 220 110 250 "" 0 0 0 "">
  <220 310 310 310 "" 0 0 0 "">
  <110 220 220 220 "" 0 0 0 "">
  <220 220 260 220 "" 0 0 0 "">
  <220 220 220 310 "" 0 0 0 "">
  <540 220 560 220 "" 0 0 0 "">
  <370 310 560 310 "" 0 0 0 "">
  <430 220 480 220 "" 0 0 0 "">
  <320 220 370 220 "" 0 0 0 "">
  <560 310 560 360 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
