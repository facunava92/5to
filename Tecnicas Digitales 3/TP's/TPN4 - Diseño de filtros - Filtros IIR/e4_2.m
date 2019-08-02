%5R2 2019
%Amaya, Lamas, Navarro, Veron
%PUNTO 2.1
pkg load signal

fpass = 0.1; %se expresa en frecuencia digital
fstop = 0.2; %se expresa en frecuencia digital

%1)
ft = (fpass + fstop)/2; %se determina la frecuencia de corte o transicion ideal del filtro
%2)
B = fstop - fpass; %ancho de banda de transisción
%como la ventana pedida es Rectangular, el ancho del lobulo principal es de B=4/M; por tanto se despeja la incognita M
%3)
M = 4/B; %con los valores anteriores se obtiene M=40 elementos distintos de cero para la funcion sinc()
M = ceil(M); %se redondea el valor obtenido de M
M = M+1; %lo fuerzo a que sea impar el valor de M
%4)
h_sinc = zeros(M , 1); %genero el vector con ceros de M=40 elementos
%mediante el bucle for se "cargan" los coeficientes correspondientes a h_sinc
for n=0 : (M-1) %se corre desde el primer elemento hasta el anterior a M, ya que en la definición de la guia dice que: 0 <= n < M
	h_sinc(n+1) = ft * sinc(ft *(n - ((M-1)/2)));
end

figure()
stem(h_sinc) %se grafica la respuesta temporal de h_sinc
title('Respuesta temporal de h_sinc.')
grid on
xlim([-5 45])
%ylim([0 1.2])

recW = rectwin(M); %calculo de coeficientes de la ventana rectangular, pasando como argumento el numero de coeficientes necesarios para el filtro
figure()
stem(recW) %se grafica la respuesta de la ventana rectangular
title('Respuesta temporal de ventana rectangular.')
grid on
xlim([-5 45])
ylim([0 1.2])
%5)
resultado = h_sinc .* recW; %se aplica el "ventaneo"(en dominio del tiempo) multiplicando elemento a elemento la funcion sinc() y la funcion rectangular
resolucion = M*1000; %resolucion para la FFT
%6)
Resultado = fft(resultado, resolucion); %se traslada al dominio de la frecuencia con la FFT; se toman mas puntos(al menos unas 1000veces) para tener mejor resolucion
Resultado_abs = mag2db(abs(Resultado)); %se pasan los elementos a valores absolutos
x = [0 : (M*1000/2)-1]; %creo un vector auxiliar, con elementos que van de 0 a 499, lo que me permite crear luego los valores de frecuencias digitales
fd = x/((M*1000/2)-1); %vector con valores de frecuencias digitales
figure()
plot(fd, Resultado_abs(1: M*1000/2)) %se grafica la respuesta en frecuencia
grid on
xlabel('Frecuencia digital.')
ylabel('Amplitud [dB]')
title('PUNTO 2.1. Respuesta en frecuencia de un filtro FIR pasa bajos con ventana Rectangular.')




%PUNTO 2.2
fpassA = 3000;
fstopA = 4000;
fs = 44100;

%se convierten las frecuencias "analogicas" en frecuencias digitales
fpass2 = fpassA/(fs/2); %igual a 0,1361
fstop2 = fstopA/(fs/2); %igual a 0,1814
%1)
ft2 = (fpass2 + fstop2)/2; %se determina la frecuencia de corte ideal del filtro 0,02265
%2)
B = fstop2 - fpass2; %ancho de banda de transisción 0,0453
%3) por condición de Sba elijo la ventana Hamming cuya relación es B=8/M, por lo tanto M=8/B
M = 8/B; %se determinan los taps
M = ceil(M); %ceil() redondea hacia arriba, al entero mayor mas cercano
%4)
h_sinc2 = zeros(M , 1); %genero el vector con ceros de M1 elementos
for n=0 : (M-1) %se corre desde el primer elemento hasta el anterior a M, ya que en la definición de la guia dice que: 0 <= n < M
	h_sinc2(n+1) = ft2 * sinc(ft2 *(n - ((M-1)/2)));
end
figure()
stem(h_sinc2) %se grafica la respuesta temporal de h_sinc
title('Respuesta temporal de h_sinc2.')
grid on
xlim([-5 180])
ylim([-0.04 0.2])

hammingW = hamming(M); %calculo los coeficientes de la ventana Hamming elegida
figure()
stem(hammingW) %se grafica la respuesta de la ventana Hamming
title('Respuesta temporal de ventana Hamming.')
grid on
xlim([-5 185])
ylim([0 1.2])

%5)
resultado2 = h_sinc2 .* hammingW; %se aplica el "ventaneo"(en dominio del tiempo) multiplicando elemento a elemento la funcion sinc() y la funcion hamming
%6)
resolucion = M*1000; %resolucion para la FFT
Resultado2 = fft(resultado2, resolucion); %se traslada al dominio de la frecuencia con la FFT
Resultado2_abs = mag2db(abs(Resultado2)); %se pasan los elementos a valores absolutos
x2 = [0 : (resolucion/2)-1]; %creo un vector auxiliar, con elementos que van de 0 a 176, lo que me permite crear luego los valores de frecuencias digitales
fd2 = x2 / ((resolucion/2)-1); %vector con valores de frecuencias digitales
figure()
freal = (fs/2)*fd2; %se convierte los valores de frecuencias digitales a frecuencias reales, para luego usarlos en el ploteo
%plot(freal(1 : (resolucion/2)), Resultado2_abs(1 : (resolucion/2))) %se grafica la respuesta en frecuencia
plot(freal(1 : (resolucion/2)), Resultado2_abs(1 : (resolucion/2)))
%plot(fd2, Resultado2_abs(1: (resolucion/2))) 
xlim([0 22050])
grid on
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')
title('PUNTO 2.2. Respuesta en frecuencia de un filtro FIR pasa bajos con ventana Hamming.')
