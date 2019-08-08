%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Filtro Pasabanda
%Guia 4, Ejercicio 7

N = 4; %tamaño del vector de coeficientes de entrada

fs = 256; % frecuencia de muestreo
F1 = 50; % frecuencia del tono senoidal 1
F2 = 100; % frecuencia del tono senoidal 2

K = 2048; %muestras, resolucion 2000
fd = (0 : (K/2-1))*fs/K; %vector de frecuencia digital


%convertimos F1 y F2 a frecuencias digitales
f1 = F1*2/fs;     
f2 = F2*2/fs;

t = fs*8; %cantidad de muestras en 8s

%Coeficientes
a = [1 -2.12984 1.78256 -0.54343 0.0];
b = [0.0528556 0.0017905 0.0017905 0.0528556];   

%senoidal de 50Hz
s1 = zeros(1, t);

%senoidal de 100Hz
s2 = zeros(1, t); 

for i=1:t
s1(i)= sin(pi*f1*(i));       %Primer tono senoidal A*sen(w_1*n)
s2(i)= sin(pi*f2*(i));       %Segundo tono senoidal A*sen(w_2*n)
end

%creacion de señal a filtrar
s = s1 + s2; %se suman las dos señales senoidales, formando la señal bitonal


L = length(s); %se obtiene la longitud L de la señal
sen_bitonal = mag2db(abs(fft(s, K))); %se obtiene la señal bitonal en dominio de la frecuencia


%PUNTO 7.2, primer metodo de filtrado mediante los registros de desplazamientos
y = zeros(1, N+L-1); %señal de salida
s = [s zeros(1, N)]; %adaptacion de longitudes, completando con 0 a s.

%registro de desplazamiento
reg_in = zeros(1, N);
reg_out = zeros(1, N);

for n=1 : N+L-1
	reg_in = [s(1, n) reg_in(1 : N-1)];
    for i=1 : N
		y(n) = y(n) + reg_in(i)*b(i) - reg_out(i)*a(i+1);
    end
    reg_out = [y(1, n) reg_out(1 : N-1)];
end

Y = fft(y, K); %se convierte la señal obtenida del filtrado al dominio de la frecuencia.
y1 = mag2db(abs(Y));

e_50 = floor(50*(K/2)/(fs/2));
e_100 = floor(100*(K/2)/(fs/2));

%graficamos la señal filtrada del primer metodo
figure()
plot(fd, y1(1 : (K/2)))
grid on
title('Espectro de la senal filtrada con registro de desplazamientos.')


xlim([0 128])
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')

%PUNTO 7.3, filtrado con la función filter
y_filter = filter(b, a, s); %se aplica el filtrado a la señal bitonal, en base a los coeficientes dados en la guia, "a" y "b"
Y_filter = fft(y_filter, K); %se pasa a dominio de la frecuencia la respuesta obtenida de la señal luego del filtrado, con K resolucion en frecuencias

e_50 = floor(50*(K/2)/(fs/2));
e_100 = floor(100*(K/2)/(fs/2));
figure()
plot(fd, 20*log10(abs(Y_filter(1 : K/2))))
grid on
title('Espectro de la senal filtrada con funcion filter.')
xlim([0 128])
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')


%PUNTO 7.4, respuesta en frecuencia mediante funcion freqz(B, A)  
[H, w_rad] = freqz(b, a);
w_hz = (w_rad/pi)*(fs/2);
H_dB = mag2db(abs(H));

figure()
plot(w_hz, H_dB)
grid on
xlim([0 128])
text(50,-30.70098,'X Atenuacion en 50Hz')
text(100,-34.0427,'X Atenuacion en 100Hz')
title('Respuesta en frecuencia del filtro.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')

text(60, -50, '50Hz, presenta: -30.70098dB') 
text(60, -55, '100Hz, presenta: -34.0427dB')
