#!/usr/bin/octave

pkg load signal
pkg load control

fc = 50; %frecuencia de corte [Hz]
fs = 256; %frecuencia de muestreo
fc_d = 2*fc/fs; %frecuencia de corte digital, igual a 0.390625

N = fs;
x = 0 : (N/2)-1; 
fd = x / ((N/2)-1); %vector frecuencias digitales, cuyos elementos van de 0 a 1


%PUNTO 8.1

[B , A] = butter(3 , fc_d , 'high'); %orden de filtro, frecuencia de corte digital, tipo de filtro


%PUNTO 8.2, generar una función impulso con longitud de 4 segundos y obtener la respuesta del filtro mediante la funcion filter()
L = 4*fs; %el impulso debera tener 1024 muestras en base a la fs para tener los 4seg de su longitud; recordar L = 4/Ts = 4*fs
v_vacio = zeros(1 , L); %vector "vacio" de 1024 elementos
v_vacio(1) = 1; %en el primer elemento, se establece un impulso unitario   
h_pa = filter(B , A , v_vacio); %respuesta al impulso
H_pa = fft(h_pa , N); %respuesta al impulso en dominio de la frecuencia
Y_pa = mag2db(abs(H_pa));
figure()
plot(Y_pa(1 : N/2))
xlim([0 130])
ylim([-180 20])
grid on
title('PUNTO 8.2. F - pasa altos Butterwort 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')



%PUNTO 8.3 y 8.4, 

%determinar la cantidad de etapas minimas necesarias para obtener una atenuacion mayor o igual a 120dB a 20Hz

x_20 = find(x >= 20); %buscamos la posicion de la frecuencia de 20hz 
atenuacion = abs(Y_pa(x_20(1))); %se obtiene el valor de atenuacion en la frecuencia de 20Hz
etapas = 1; %contador de etapas
figure() %nuevo gráfico donde se verán las distintas etapas necesarias para lograr una atenuacion de 120dB o menos a 20Hz
plot(Y_pa(1 : N/2))
ylim([-180 20])
grid on
while (atenuacion <= 120) %se repite el proceso de filtrado hasta encontrar la atenuacion deseada 
	h_pa = filter(B, A, h_pa);
	H_pa = fft(h_pa, N);
	Y_pa = mag2db(abs(H_pa(1:N/2)));
	x_20 = find(x >= 20);
	atenuacion = abs(Y_pa(x_20(1)));
	etapas = etapas + 1; %se incrementa el contador de etapas 
	hold all;
	plot(x,Y_pa);
end
grid on
xlim([0 130])
ylim([-350 20])
title('PUNTO 8.3. F - pasa altos Butterwort de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')
legend(strcat('Etapas necesarias con filtro filtro Butterwort:  ',num2str(etapas-4)), strcat('Etapas necesarias con filtro filtro Butterwort:  ',num2str(etapas-3)), strcat('Etapas necesarias con filtro filtro Butterwort:  ',num2str(etapas-2)), strcat('Etapas necesarias con filtro filtro Butterwort:  ',num2str(etapas-1)), strcat('Etapas necesarias con filtro filtro Butterwort:  ',num2str(etapas)));


%PUNTO 8.5, repetir los PUNTOS 8.1 a 8.4, para filtros de Chebyshev tipo 1 y 2, filtro eliptico.

%Filtro Chebyshev tipo 1 

[B, A] = cheby1(3, 1, fc_d, 'high'); %orden, ripple en banda de paso, frecuencia de corte digital, tipo
h_pa = filter(B , A , v_vacio); %respuesta al impulso
H_pa = fft(h_pa , N); %respuesta al impulso en dominio de la frecuencia
Y_pa = mag2db(abs(H_pa));
figure()
plot(Y_pa(1 : N/2))
xlim([0 130])
ylim([-180 20])
grid on
title('PUNTO 8.5. F - pasa altos Chebyshev tipo 1 de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')

x_20 = find(x >= 20); %buscamos la posicion de la frecuencia de 20hz 
atenuacion = abs(Y_pa(x_20(1))); %se obtiene el valor de atenuacion en la frecuencia de 20Hz
etapas = 1; %contador de etapas
figure() %nuevo gráfico donde se verán las distintas etapas necesarias para lograr una atenuacion de 120dB o menos a 20Hz
plot(Y_pa(1 : N/2))
ylim([-180 20])
grid on
while (atenuacion <= 120) %se repite el proceso de filtrado hasta encontrar la atenuacion deseada
	h_pa = filter(B, A, h_pa);
	H_pa = fft(h_pa, N);
	Y_pa = mag2db(abs(H_pa(1:N/2)));
	x_20 = find(x >= 20);
	atenuacion = abs(Y_pa(x_20(1)));
	etapas = etapas + 1; %se incrementa el contador de etapas
	hold all;
	plot(x,Y_pa);
end
grid on
xlim([0 130])
ylim([-350 20])
title('Punto 8.5. F - pasa altos Chebyshev tipo 1 de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')
legend(strcat('Etapas necesarias con filtro Chebyshev tipo 1:  ',num2str(etapas-3)), strcat('Etapas necesarias con filtro Chebyshev tipo 1:  ',num2str(etapas-2)), strcat('Etapas necesarias con filtro Chebyshev tipo 1:  ',num2str(etapas-1)), strcat('Etapas necesarias con filtro Chebyshev tipo 1:  ',num2str(etapas)));
%**************************************

% Filtro Chebyshev tipo 2 
[B, A] = cheby2(3, 60, fc_d, 'high'); %orden, ripple en banda de paso, frecuencia de corte digital, tipo
h_pa = filter(B , A , v_vacio); %respuesta al impulso
H_pa = fft(h_pa , N); %respuesta al impulso en dominio de la frecuencia
Y_pa = mag2db(abs(H_pa));
figure()
plot(Y_pa(1 : N/2))
xlim([0 130])
ylim([-180 20])
grid on
title('PUNTO 8.5. F - pasa altos Chebyshev tipo 2 de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')

x_20 = find(x >= 20); %buscamos la posicion de la frecuencia de 20hz 
atenuacion = abs(Y_pa(x_20(1))); %se obtiene el valor de atenuacion en la frecuencia de 20Hz
etapas = 1; %contador de etapas
figure() %nuevo gráfico donde se verán las distintas etapas necesarias para lograr una atenuacion de 120dB o menos a 20Hz
plot(Y_pa(1 : N/2))
ylim([-180 20])
grid on
while (atenuacion <= 120) %se repite el proceso de filtrado hasta encontrar la atenuacion deseada
	h_pa = filter(B, A, h_pa);
	H_pa = fft(h_pa, N);
	Y_pa = mag2db(abs(H_pa(1:N/2)));
	x_20 = find(x >= 20);
	atenuacion = abs(Y_pa(x_20(1)));
	etapas = etapas + 1; %se incrementa el contador de etapas
	hold all;
	plot(x,Y_pa);
end
grid on
xlim([0 130])
ylim([-350 20])
title('PUNTO 8.5. F - pasa altos Chebyshev tipo 2 de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')
legend(strcat('Etapas necesarias con filtro Chebyshev tipo 2:  ',num2str(abs(etapas-3))), strcat('Etapas necesarias con filtro Chebyshev tipo 2:  ',num2str(abs(etapas))));
%**************************************


% Filtro Eliptico o de Cauer
[B, A] = ellip(3, 1, 100, fc_d, 'high'); %orden, ripple en banda de paso, ripple en banda de stop, frecuencia de corte digital, tipo
h_pa = filter(B , A , v_vacio); %respuesta al impulso
H_pa = fft(h_pa , N); %respuesta al impulso en dominio de la frecuencia
Y_pa = mag2db(abs(H_pa));
figure()
plot(Y_pa(1 : N/2))
xlim([0 130])
ylim([-180 20])
grid on
title('PUNTO 8.5. F - pasa altos Eliptico o de Cauer de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')

x_20 = find(x >= 20); %buscamos la posicion de la frecuencia de 20hz 
atenuacion = abs(Y_pa(x_20(1))); %se obtiene el valor de atenuacion en la frecuencia de 20Hz
etapas = 1; %contador de etapas
figure() %nuevo gráfico donde se verán las distintas etapas necesarias para lograr una atenuacion de 120dB o menos a 20Hz
plot(Y_pa(1 : N/2))
ylim([-180 20])
grid on
while (atenuacion <= 120) %se repite el proceso de filtrado hasta encontrar la atenuacion deseada
	h_pa = filter(B, A, h_pa);
	H_pa = fft(h_pa, N);
	Y_pa = mag2db(abs(H_pa(1:N/2)));
	x_20 = find(x >= 20);
	atenuacion = abs(Y_pa(x_20(1)));
	etapas = etapas + 1; %se incrementa el contador de etapas
	hold all;
	plot(x,Y_pa);
end
grid on
xlim([0 130])
ylim([-350 20])
title('PUNTO 8.5. F - pasa altos Eliptico o de Cauer de 3 orden.')
xlabel('Frecuencia [Hz]')
ylabel('Amplitud [dB]')
legend(strcat('Etapas necesarias con filtro Eliptico o de Cauer:  ',num2str(etapas-3)), strcat('Etapas necesarias con filtro Eliptico o de Cauer:  ',num2str(etapas-2)), strcat('Etapas necesarias con filtro Eliptico o de Cauer:  ',num2str(etapas-1)), strcat('Etapas necesarias con filtro Eliptico o de Cauer:  ',num2str(etapas)));

pause
