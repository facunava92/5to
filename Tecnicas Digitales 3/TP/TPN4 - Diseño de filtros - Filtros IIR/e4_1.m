#!/usr/bin/octave -qf

pkg load control

close all
clear all

% Guia 4- Ejercicio 1

N = 1000;					  %Cantidad de puntos para la FFT
K = N/2;					  %Usamos la mitad posiva, por eso dividmos N en 2

h = load('low_pass.dat');	  %Cargo los coeficientres del filtro
stem(h); grid on			  %Grafico los coeficientes dados

H = fft(h,N);				  %Transformada discreta de Fourier de N puntos
HdB = mag2db(abs(H(1:K)));	  %Paso a dB el valor absoluto de los primero 500 elementos de H (frecuencias positivas)

fd = (0:1/(K-1):1);			  %Eje X, frecuencias digitales(fd), por convencion de 0 a casi 1.

plot(fd,HdB);				  %Grafico filtro

% Puntos de Interes
  % *Ganancia en continua
  Gp = HdB(1);				  %La ganancia en continua es el primer elemento

  %Frecuencia de corte
  for i=1 : K
	if HdB(i) <= (Gp - 3)	  %Busco de 0 a N/2 elementos el primero que caiga 3dB, en esa posicion estara la frecuencia de corte
	  HdBc	= HdB(i);		  %Guardo el valor de Amplitud q corresponde a HdB-3dB a esa frecuencia de corte
	  fc	= fd(i);		  %Asigno a frecuencia de corte (fc) el valor correspondiente del eje X (frecuencia digital en la posicion "i")
	  Kfc	= i;
	  break;
	end
  end

  %Ripple de la banda de paso
  for i=1 : Kfc
	if HdB(i+1) < Hd::B(i)
	  A=0;
	end
  end
	%Atenuacion en la banda de rechazo
  for i=Kfc : K				  %Desde la fc los Db iran descendiendo hasta un punto de inflexion en donde volvera aumentar en el segundo lobulo 
	if HdB(i+1) > HdB(i)
	  Kf1 = i+1;			  %encuentro el punto de inflexion
	  break;
	end
  end

  for i=Kf1 : K				%Desde el punto de inflexion busco el maximo del segundo lobulo 
	if HdB(i) < HdB(i-1)
	  Hba = HdB(i);
	  break;
	end
  end

  Sba = Gp - Hba;

% Figura de salida
figure;
plot(fd,HdB); grid on
title('Respuesta en frecuencia de un filtro FIR PB');
ylabel('Amplitud en dB');
xlabel('Frecuencia digital');

hold on
f1 = plot(fc,HdBc,'r*');
f2 = plot(0,Gp,'g*');
hold off

legend([f1 f2], sprintf ('fc = %f', fc), sprintf ('Gp = %f', Gp))
txtRp = ['Rp = ' num2str(Rp)]
txtSb = ['Sba = ' num2str(Sba)]
text(0.24, 9  ,txtRp)
text(0.75, -11,txtSb)
pause
