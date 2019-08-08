#!/usr/bin/octave

pkg load control signal

clear all;
close all;
clc;
%Constantes
n_fft = 2000;
k_fft = (n_fft/2);

%Condicion del fpB, fc del fpb > fc del fpa, para que al solaparse se
%genere una banda de paso
fc1 = 0.1;			%Frecuencia de corte del fpa
fc2 = 0.2;			%Frecuencia de corte del fpb
B	= 0.01;			%Banda de transicion

%Frec de transicion
ft_pb =	fc2+(B/2);
ft_pa =	fc1+(B/2);

%Calculo de taps
M =	(12/B)+1; %Para hanning

%Calculo del kernel
n =	(1:1:M);
hpb	= ft_pb*sinc(ft_pb.*(n-((M-1)/2)));
hpa	= ft_pa*sinc(ft_pa.*(n-((M-1)/2)));
%Ventana
W =	blackman(length(hpb))'; %Se verificaron el ventaneo rectangular, hanning, hamming y blackman. Siendo blackman el que obtuvo una atenuancion de banda de rechazo menor a 60dB 

%Fpb
hfpb	=	W.*hpb;
hfpb_pa	= W.*hpa;

%Filtro pasa alto por inversion del espectro
D			  =	zeros(1,M);
D(1,(M-1)/2)  =	1;
hfpa		  = D-hfpb_pa;

%Filtro pasa banda
hfpB  =	conv(hfpa, hfpb);
%Rta en frec
HfpB  =fft(hfpB, n_fft );
HfpB  =mag2db(abs(HfpB(1:k_fft)));
fd=(0:1/(k_fft-1):1);

%Gráfica
plot(fd, HfpB);
title('Filtro pasa banda')
xlabel('Frecuencia Normalizada');
ylabel('Amplitud [dB]');
grid on

pause
