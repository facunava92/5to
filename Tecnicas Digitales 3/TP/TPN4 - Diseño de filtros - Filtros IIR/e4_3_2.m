#!/usr/bin/octave
close all
clear all

pkg load signal

%Constantes
n_fft = 2000;
k_fft = (n_fft/2);

%Especificaciones de diseno

fpass_analog = 3000;
fstop_analog = 4000;
fs= 44100;

fpass = (2*fpass_analog)/fs	;  %Normalizo de acuerdo a la guia 
fstop = (2*fstop_analog)/fs;

B = fstop - fpass;			  %B = Ancho de banda de transicion
printf('fp = %g , fs = %g B = %g \n',fpass,fstop,B);

fstop = 1 - fpass;
fpass = fstop - B;
printf('fp = %g , fs = %g B = %g \n',fpass,fstop,B);

%Diseno de filtro (siguiendo la guia)
ft = (fpass + fstop)/2;		  %Promedio entre la frecuencia de paso y la de rechazo. ft = frecuencia de corte ideal

%Segun las especificaciones de ripple y atenuacion tengo que elegir una ventana => "Hanning".
M = ceil(8/B);				  %Cantidad de taps para ventana hanning
n = (0:(M-1));				  %Vector para pasar a una funcion causal y finita

h_sinc_pb	= ft * sinc (ft * (n - ((M-1)/2)));	  %Funcion sinc deacuerdo a las especif de diseno (M,n,ft)
h_sinc_pa	= h_sinc_pb;
h_sinc_pa(1:2:end) = h_sinc_pa(1:2:end) * -1;

window = hamming(M);
for i=1 : M
  h_pa(i) = h_sinc_pa(i) * window(i);
  h_pb(i) = h_sinc_pb(i) * window(i);
end

H_pa	= fft(h_pa,n_fft);
H_pb	= fft(h_pb,n_fft);
HdB_pa = mag2db(abs(H_pa(1:k_fft)));
HdB_pb = mag2db(abs(H_pb(1:k_fft)));
fd	= (0:1/(k_fft -1):1);

figure(1)
plot(fd, HdB_pa);
hold on
plot(fd,HdB_pb);
title('Filtro pasa alto por reversion del espectro')
xlabel('Frecuencia Normalizada');
ylabel('Amplitud [dB]');
grid on
legend('Filtro PA', 'Filtro PB')
hold off;

pause
