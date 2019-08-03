
%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Filtro Pasabanda
%ejercicio 5.1
pkg load signal

fs = 44100; %frecuencia de muestreo
fstop_real = (1050+ 950)/2; %frecuencia de stop

%como se desea hacer un elimina banda. Condicion: fc2 < fc1
%todas estas frecuencias estan en Hz

B = 0.01; %ancho de banda de transicion

%se determinan las frecuencias digitales de los filtros

fpass1 = 950 / (fs/2); %frecuencia digital 1, igual a 0.0431
fpass2 = 1050 / (fs/2); %frecuencia digital 2, igual a 0.0476
fstop = fstop_real / (fs/2); %frecuencia digital de stop, igual a 0.0454


%se determinan las frecuencias de transicion de los filtros

ftran1 = (fpass1 + fstop) / 2; %frecuencia de transicion del filtro pasa altos
ftran2 = (fpass2 + fstop) / 2; %frecuencia de transicion del filtro pasa bajos


M = 8/B; %uso ventana Hamming

M = ceil(M) + 1; %es igual a 801, lo fuerzo a que sea impar

h_sinc1 = zeros(M , 1); %se inicializa a ceros, la respuesta sinc para el pasa altos
h_sinc2 = zeros(M , 1); %se inicializa a ceros, la respuesta sinc para el pasa bajos

retardoD = zeros(M , 1); %se inicializa a ceros, el vector de retardo(o filtro pasa todo)
retardoD(ceil(M/2)) = 1; %se coloca el impulso en la posicion 401

%se contruye el filtro pasa bajo
for n=0 : (M-1) 
	h_sinc2(n+1) = ftran2 * sinc(ftran2 *(n - ((M-1)/2)));
end
filtro_pb = h_sinc2 .* hamming(M); %obtengo los coeficientes del pasa bajo


%se construye el filtro pasa alto
for n=0 : (M-1) 
	h_sinc1(n+1) = ftran1 * sinc(ftran1 *(n - ((M-1)/2)));
end
filtro_pb_aux = h_sinc1 .* hamming(M); %obtengo los coeficientes del pasa bajo auxiliar

filtro_pa = retardoD - filtro_pb_aux; %se realiza la inversion espectral, se obtiene el pasa altos

%se obtiene el filtro elimina banda
filtro_eb = filtro_pb - filtro_pa; %se crea el filtro elimina banda, mediante la suma de los coeficientes del filtro pasa bajos y el filtro pasa altos

resolucion = M*1000; %se define la resolucion a utilizar en la FFT
f_eb = fft(filtro_eb, resolucion); %se pasan las respuesta del filtro elimina banda al dominio de la frecuencia
f_eb_db = mag2db(abs(f_eb));

x = [0 : (resolucion/2)-1]; %creo un vector auxiliar que me permite crear luego los valores de frecuencias digitales
fd = x / ((resolucion/2)-1); %vector con valores de frecuencias digitales

figure()
plot(fd, f_eb_db(1 : (resolucion/2))) %grafico la respuesta del filtro elimina banda
grid on
xlabel('Frecuencia digital.')
ylabel('Amplitud [dB]')
title('PUNTO 5.1. Espectro de filtro elimina banda (con metodo de inversion espectral).')
legend('Espectro elimina banda.')

[Y, Fs] = audioread('numeros_humm.wav'); %se carga el audio con interferencia de 1KHz
z = filter (filtro_eb, 1, Y); %se aplica el filtro elimina banda al audio
sound(z, Fs) %se reproduce el audio filtrado
