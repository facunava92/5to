% %Guía 3, Ejercicio 3
% 
% %PUNTO 3.1
% [r, fs] = audioread('numeros.wav'); % fs=44100 Hz, nbits=24bits
% Ts = 1/fs;
% h = zeros(1, (0.3/Ts) ); %13230 muestras equivalen al retardo
% 
% 
% for n=1 : (0.3/Ts) %con este for cargo el vector h con la muestra 1 en la posicion requerida
% 	if n == (0.3/Ts)
% 		h(n) = 1;
% 	end
% end
% 
% %convolucionar la señal r con la señal h para genera una señal I. Luego eliminar las ultimas muestras de la señal I, de tal manera que I y r tengan la misma longitud
% I = conv(r, h');
% NI = length(I);
% Nr = length(r);
% I = I(1:1:Nr); %se cargan desde la muestra 1 a la muestra Nr del vector I, así I y r tienen la misma longitud
% M = [r , I]; %se combinan las dos señales en una matriz de tal manera de obtener una señal estereo a partir de la señal mono original
% %sound(M, fs, nbits)
% audiowrite('NumerosEnStereo.wav',M,fs)

%PUNTO 3.2 "filtro peine" o filtro comb
[r, fs] = audioread('numeros.wav'); % fs=44100 Hz,
Ts = 1/fs;
K = (0.020*fs); 
N = 0.1/Ts; 
a = sqrt(2)/2; 
h = zeros(1, N);

i = 0;
j=1; 
for n=1 : N 
	switch n
		case 1
			h(n) = (a^i) * 1;
		case j*K
			i = i + 1;
			j = j +1;
			h(n) = (a^i) * 1;
		otherwise
			h(n) = 0;
	end
end

Nr = length(r);
y = conv(r , h); 
y = y(1:Nr);
y_max = max(y);
y = y(:) ./ y_max;
sound(y , fs)

audiowrite('NumerosFiltroPeine.wav',y,fs)