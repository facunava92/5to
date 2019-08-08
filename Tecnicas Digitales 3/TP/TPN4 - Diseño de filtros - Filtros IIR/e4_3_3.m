#!/usr/bin/octave -qf
pkg load signal
pkg load control

close all
clear all

%Constantes
n_fft = 1000;
k_fft = (n_fft/2);

%Especificaciones de diseno

fpass_analog = 6000;
fstop_analog = 6100;
fs= 44100;

fpass = (2*fpass_analog)/fs	  %Normalizo de acuerdo a la guia 
fstop = (2*fstop_analog)/fs

%Diseno de filtro (siguiendo la guia)
ft = (fpass + fstop)/2;		  %Promedio entre la frecuencia de paso y la de rechazo. ft = frecuencia de corte ideal
B = fstop - fpass;			  %B = Ancho de banda de transicion

%Segun las especificaciones de ripple y atenuacion tengo que elegir una ventana => "Hanning".
M = ceil(8/B);				  %Cantidad de taps para ventana rectangular
if (rem(M,2)) == 0			  %Fuerzo a M ser impar, si no lo fuese
	M = M+1;
end
n = (0:(M-1));				  %Vector para pasar a una funcion causal y finita

D = zeros(M,1);				  %Para hacer la inversion de espectro necesito tener un vector de M elementos 
D((M+1)/2) = 1;				  %cuyo elemento medio sea igual a 1.

h_sinc	= ft * sinc (ft * (n - ((M-1)/2)));	  %Funcion sinc deacuerdo a las especif de diseno (M,n,ft)
window = blackman(M);
for i=1 : M
  h_pb(i) = h_sinc(i) * window(i);			  %Multiplico la funcion sinc por la ventana
end

for i=1 : M		
  h_pa(i) = D(i) - h_pb(i);					  %El pasa altos se forma con la diferencia del pasatodo (impulso retardado) 
end											  %y el pasabajos

H_pa	= fft(h_pa,n_fft);
H_pb	= fft(h_pb,n_fft);
HdB_pa = mag2db(abs(H_pa(1:k_fft)));
HdB_pb = mag2db(abs(H_pb(1:k_fft)));
fd	= (0:1/(k_fft -1):1);

figure(1)
plot(fd, HdB_pa);
hold on
plot(fd,HdB_pb);
title('Filtro pasa alto por inversion del espectro')
xlabel('Frecuencia Normalizada');
ylabel('Amplitud [dB]');
grid on
legend('Filtro PA', 'Filtro PB')
hold off;

figure(2)
f	= (fs/2) * fd;
plot(f,HdB_pa);
hold on
plot(f,HdB_pb);

pause
