<Qucs Schematic 0.0.19>
<Properties>
  <View=0,26,915,618,1,0,59>
  <Grid=10,10,1>
  <DataSet=tp1Cap.dat>
  <DataDisplay=tp1Cap.dpl>
  <OpenDisplay=1>
  <Script=tp1Cap.m>
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
  <GND * 1 560 330 0 0 0 0>
  <GND * 1 110 320 0 0 0 0>
  <Vac V1 1 110 280 18 -26 0 1 "1 V" 1 "1 Hz" 0 "0" 0 "0" 0>
  <R R1 1 300 220 -26 15 0 0 "10 mOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Eqn Eqn1 1 680 60 -31 16 0 0 "XL=2*pi*acfrequency*L1.L*i" 1 "yes" 0>
  <Eqn Eqn2 1 680 160 -31 16 0 0 "XC=1/(2*pi*acfrequency*C1.C*i)" 1 "yes" 0>
  <Eqn Eqn3 1 690 270 -31 16 0 0 "Zp=R2.R*XC/(R2.R+XC)" 1 "yes" 0>
  <Eqn Eqn4 1 690 380 -31 16 0 0 "ZT=Zp+R1.R+XL" 1 "yes" 0>
  <Eqn Eqn5 1 700 480 -31 16 0 0 "modZ=abs(ZT)" 1 "yes" 0>
  <L L1 1 180 220 -26 10 0 0 "10 nH" 1 "" 0>
  <C C1 1 480 280 -26 17 0 0 "50 uF" 1 "" 0 "neutral" 0>
  <.AC AC1 1 130 450 0 39 0 0 "lin" 1 "0 kHz" 1 "1 MHz" 1 "1000" 1 "no" 0>
  <R R2 1 480 160 -26 15 0 0 "10 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
</Components>
<Wires>
  <330 220 400 220 "" 0 0 0 "">
  <210 220 270 220 "" 0 0 0 "">
  <400 280 450 280 "" 0 0 0 "">
  <400 220 400 280 "" 0 0 0 "">
  <400 160 450 160 "" 0 0 0 "">
  <400 160 400 220 "" 0 0 0 "">
  <560 160 560 280 "" 0 0 0 "">
  <510 160 560 160 "" 0 0 0 "">
  <560 280 560 330 "" 0 0 0 "">
  <510 280 560 280 "" 0 0 0 "">
  <110 220 110 250 "" 0 0 0 "">
  <110 220 150 220 "" 0 0 0 "">
  <110 310 110 320 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
