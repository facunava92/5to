%Guia 7, Ejercicio 4
%5R2; 24-10-19 
%Amaya, Lamas, Navarro, Veron

%PUNTO 4.1 ----MÉTODO OVERLAP & SAVE----
[h, fs]=audioread('s1_r1_b_cd.wav');%este audio contiene la respuesta al impulso de la sala de concierto; está grabada en 2 canales(izquierdo y derecho)
                                    %fs es igual a 44100Hz
M = length(h);  %extraigo de info el valor de cantidad de muestras utilizadas por cada canal
                %M tiene 174195 muestras

[audio, fs_audio] = audioread('Fat Bottomed Girls.mp3');   %audio al que le voy a aplicar la convolución; tiene 2 canales
                                                    %fs_audio es de 29400Hz
info_audio = audioinfo('Fat Bottomed Girls.mp3');
tam_audio = length(audio);
%tam es de 7977072 muestras

%determino el valor de "muestras por bloques L" a utilizar(es decir, para mayor eficiencia N/M = 4); 
%como criterio se utiliza que la cantidad de muestras de FFT sea más o menos 4 veces la cantidad de muestras 
%del filtro h[n], y tambien N debe ser valor de potencia de 2.
N = 4*M;
b = ceil(log2(N)); %primero hago el logaritmo en base 2 de N, eso da un numero con parte entera y parte decimal, y luego lo redondeo hacia arriba con ceil
N = 2^b; %este N calculado cumple que es base de 2 y tambien que es mayor a 4*M
L = N - (M - 1); %este es la cantidad de muestras a procesar por bloques

%ahora veo cuantas L entran en la secuencia del audio, para ello relaciono de la siguiente forma:
K = tam_audio / L; %esto da un valor de 11.8996 veces, por lo que deberia llevarlo a un numero entero superior
K = ceil(K); %se pasa a valer 12
%entonces el nuevo tamaño de la secuencia de audio debe ser:
tam_audio2 = K*L;

pad_ceros = tam_audio2 - tam_audio;
audio = [audio ;  zeros(pad_ceros,2)]; %agrego una cierta cantidad de ceros al final de la secuencia de audio
%sound(audio, fs_audio) %se escucha igual al audio original, con la salvedad que al final tiene "silencio" por los ceros agregados

% ----ALGORITMO OVERLAP & SAVE----

tic
for n = 1 : K %va de bloque 1 a bloque 5
	ind_sup = n*L; %indice superior
	ind_inf = (n-1)*L+1; %indice inferior
	if n == 1
		aux = [zeros((M-1),2) ; audio(1:L, 1:2)]; %por ser el primer bloque, agrego (M-1) ceros al comienzo de la secuencia
		AUX = fft(aux); %convierto a dominio de frecuencia
		h = [h; zeros(length(aux)-length(h),2)]; %concateno ceros al final de H para luego poder hacer el producto punto a punto con la señal
		H = fft(h); %convierto al dominio de la frecuencia la respuesta al impulso del filtro		
		FILTRADO = AUX .* H; %realizo el producto punto a punto entre el bloque actual y el filtro
		y = ifft(FILTRADO); %paso el primer bloque al dominio temporal
		y = y(M : L+M-1, 1:2); %se descartan las primeras (M-1) muestras del bloque
		
	else %estas sentencias se producen para el bloque 2 a bloque K
		aux = [audio(((n-1)*L-(M-2)) : ((n-1)*L), 1:2) ; audio(ind_inf:ind_sup, 1:2)]; %concateno (M-1)elementos anteriores con L elementos nuevos
		AUX = fft(aux); %convierto a dominio de frecuencia
		FILTRADO = AUX .* H; %realizo el producto punto a punto entre el bloque actual y el filtro
		aux2 = ifft(FILTRADO);
		y = [y; aux2(M : L+M-1, 1:2)]; %concateno el bloque anterior con el bloque actual, eliminando del bloque actual las (M-1)
				
	end
end
tiempoMetodo_OS = toc; %tomo el tiempo demorado en hacer el filtrado según este método

y = y(1 : tam_audio); %la secuencia filtrada "y" la debo llevar al mismo tamaño de la secuencia de audio original
y = y / max(abs(y)); 
audiowrite('MetodoOverlap&Save.wav', y, fs_audio) %guardo el audio en la misma carpeta donde se encuentra este archivo .m

disp('Tiempo requerido por "Overlap & Save":');
disp(tiempoMetodo_OS); %según una ejecución dió: 1,9265 segundos



%PUNTO 4.2 ----MÉTODO OVERLAP & ADD----
tic
for n = 1 : K %va de bloque 1 a bloque 5
	ind_sup = n*L; %indice superior
	ind_inf = (n-1)*L+1; %indice inferior
	if n == 1
		aux = [audio(1:L, 1:2) ; zeros((M-1),2)]; %agrego (M-1) ceros al final del primer bloque
		AUX = fft(aux); %convierto a dominio de frecuencia
		h = [h; zeros(length(aux)-length(h),2)]; %concateno ceros al final de H para luego poder hacer el producto punto a punto con la señal
		H = fft(h); %convierto al dominio de la frecuencia la respuesta al impulso del filtro
		FILTRADO = AUX .* H; %realizo el producto punto a punto entre el bloque actual y el filtro
		aux2 = ifft(FILTRADO); %tengo el primer bloque en dominio del tiempo
		y = aux2(1:L, 1:2);
		aux2 = aux2((L+1):L+M-1, 1:2); %pongo en aux2 el tramo final que debo sumar con el primer tramo del siguiente bloque
		
	else %estas sentencias se producen para el bloque 2 a bloque K
		aux = [audio(((n-1)*L+1) : (n*L), 1:2) ; zeros((M-1),2)]; %concateno el proximo bloque con (M-1) ceros al final
		AUX = fft(aux); %convierto a dominio de frecuencia
		FILTRADO = AUX .* H; %realizo el producto punto a punto entre el bloque actual y el filtro
		aux3 = ifft(FILTRADO); %se pasa al dominio del tiempo
		aux2 = [aux2 ; zeros(L, 2)]; %le agrego L ceros a aux2 para poder sumarlo con aux3
		aux3 = aux2 + aux3; %se suman los dos aux
		y = [y; aux3(1:L, 1:2)]; %concateno el bloque anterior con el bloque actual con los (M-1) adicionados, eliminando del bloque actual las (M-1) muestras finales
		aux2 = aux3((L+1):L+M-1, 1:2); %actualizo aux2 con los (M-1) elementos finales del bloque
	end
end
tiempoMetodo_OA = toc; %tomo el tiempo demorado en hacer el filtrado según este método

y = y(1 : info_audio.TotalSamples); %la secuencia filtrada "y" la debo llevar al mismo tamaño de la secuencia de audio original
y = y / max(abs(y)); 
audiowrite('MetodoOverlap&Add.wav', y, fs_audio) %guardo el audio en la misma carpeta donde se encuentra este archivo .m

disp('Tiempo requerido por "Overlap & Add":');
disp(tiempoMetodo_OA); %según una ejecución dió: 0,8217 segundos


%comparacion de tiempos de hacerse con convolución en dominio del tiempo:
h = audioread('s1_r1_b_cd.wav');
audio = audioread('Fat Bottomed Girls.mp3');

audio = audio / max(abs(audio)); 

tic
y = conv2(audio, h, 'same');
tiempoMetodo_Convolucion = toc; %tomo el tiempo demorado en hacer el filtrado por convolución
audiowrite('MetodoConvolucion.wav', y, fs_audio) %guardo el audio en la misma carpeta donde se encuentra este archivo .m

disp('Tiempo requerido por "Convolucion":');
disp(tiempoMetodo_Convolucion); %según una ejecución dió: 264,5077 segundos



