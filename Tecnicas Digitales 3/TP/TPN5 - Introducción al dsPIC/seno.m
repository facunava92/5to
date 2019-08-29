#!/usr/bin/octave

A	= 32767;		%Amplitud maxima del DAC
fd	= 1/16;			%Frecuencia digital del ejercicio
N	= 32;           %Total de muestras
x	= [0:1:N-1];	%Vector de tiempo 

y = floor(A * sin( pi * fd * x));
figure(1)
stem(x,y);

for i=1 : length(x)
	if y(i) < 0
		y(i) = y(i) + 65536; 
	end
end

figure(2)
stem(x,y);

Y(1)= "{";
for i=1 : length(x)-1
  Y = strcat(Y,["0x"],[dec2hex(y(i),4)],[","]);
end
  Y = strcat(Y,["0x"],[dec2hex(y(32),4)],["};"]);


printf("unsigned int LeftBufferA [32]__attribute__((space(dma))) = %s \n",Y);
printf("unsigned int LeftBufferB [32]__attribute__((space(dma))) = %s \n",Y);

pause
