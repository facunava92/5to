<Qucs Schematic 0.0.19>
<Properties>
  <View=0,26,873,740,1,0,0>
  <Grid=10,10,1>
  <DataSet=tp1Cab.dat>
  <DataDisplay=tp1Cab.dpl>
  <OpenDisplay=1>
  <Script=tp1Cab.m>
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
  <GND * 1 100 320 0 0 0 0>
  <Vac V1 1 100 280 18 -26 0 1 "1 V" 1 "1 Hz" 0 "0" 0 "0" 0>
  <GND * 1 550 360 0 0 0 0>
  <.AC AC1 1 120 450 0 39 0 0 "lin" 1 "0 Hz" 1 "30 GHz" 1 "1000" 1 "no" 0>
  <R R1 1 390 220 -26 15 0 0 "2.63 mOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <L L1 1 280 220 -26 10 0 0 "50 nH" 1 "" 0>
  <Eqn Eqn3 1 690 380 -31 16 0 0 "modZ=abs(ZT)" 1 "yes" 0>
  <Eqn Eqn1 1 680 180 -31 16 0 0 "XL=2*pi*acfrequency*L1.L*i" 1 "yes" 0>
  <Eqn Eqn5 1 680 270 -31 16 0 0 "ZT=R1.R+XL" 1 "yes" 0>
</Components>
<Wires>
  <100 310 100 320 "" 0 0 0 "">
  <550 220 550 360 "" 0 0 0 "">
  <100 220 100 250 "" 0 0 0 "">
  <100 220 250 220 "" 0 0 0 "">
  <310 220 360 220 "" 0 0 0 "">
  <420 220 550 220 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
