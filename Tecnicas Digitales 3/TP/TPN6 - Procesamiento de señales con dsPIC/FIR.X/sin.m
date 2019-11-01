#!/usr/bin/octave
N=32;               %Total de muestras
x=(0:N-1);          %Vector de tiempo
y=sin(pi*1/16*x);   %Vector de salida

figure(1)
stem(x/16,y)

y=y*32767;
y=floor(y);         %Convertir a entero

 for i=1:32         %Sumo 65536 a los numeros negativos
     if y(i)<0
         y(i)=y(i)+65536;
      end
 end

figure(2)
plot(x/16,y)

st='0x';
for x=1:32
st=[st dec2hex(y(x)) ',0x'];
end

