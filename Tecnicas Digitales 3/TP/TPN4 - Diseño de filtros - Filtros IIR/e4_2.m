#!/usr/bin/octave -qf

pkg load signal
pkg load control

close all
clear all

%Constantes
n_fft = 1000;
k_fft = (n_fft/2);

%Especificaciones de diseno
fpass = 0.1
fstop = 0.2

%Diseno de filtro (siguiendo la guia)
ft = (fpass + fstop)/2;			  %Promedio entre la frecuencia de paso y la de rechazo
							  %ft = frecuencia de corte ideal
B = fstop - fpass;				  %B = Ancho de banda de transicion
M = 4/B;					  %Cantidad de taps para ventana rectangular
n = (0:(M-1));				  %Vector para pasar a una funcion causal y finita

h_sinc	= ft * sinc (ft * (n - ((M-1)/2)));	  %Funcion sinc deacuerdo a las especif.
											  %de diseno (M,n,ft)
window = rectwin(M);
for i=1 : M
  h(i) = h_sinc(i) * window(i);
end

H	= fft(h,n_fft);
HdB = mag2db(abs(H(1:k_fft)));
fd	= (0:1/(k_fft -1):1);

figure(1)

plot(fd, HdB);
xlabel('Frecuencia Normalizada');
ylabel('Amplitud [dB]');
grid on

input('Presione Enter para continuar');

close all
clear all

%Constantes
n_fft = 1000;
k_fft = (n_fft/2);

%Especificaciones de diseno

fpass_analog = 3000;
fstop_analog = 4000;
fs= 44100;

fpass = (2*fpass_analog)/fs	  %Normalizo de acuerdo a la guia 
fstop = (2*fstop_analog)/fs

%Diseno de filtro (siguiendo la guia)
ft = (fpass + fstop)/2;		  %Promedio entre la frecuencia de paso y la de rechazo. ft = frecuencia de corte ideal
B = fstop - fpass;			  %B = Ancho de banda de transicion

%Segun las especificaciones de ripple y atenuacion tengo que elegir una ventana => "Hanning".
M = ceil(8/B);				  %Cantidad de taps para ventana rectangular
n = (0:(M-1));				  %Vector para pasar a una funcion causal y finita

h_sinc	= ft * sinc (ft * (n - ((M-1)/2)));	  %Funcion sinc deacuerdo a las especif de diseno (M,n,ft)
window = hann(M);
for i=1 : M
  h(i) = h_sinc(i) * window(i);
end

H	= fft(h,n_fft);
HdB = mag2db(abs(H(1:k_fft)));
fd	= (0:1/(k_fft -1):1);

figure(1)

plot(fd, HdB);
xlabel('Frecuencia Normalizada');
ylabel('Amplitud [dB]');
grid on

pause
