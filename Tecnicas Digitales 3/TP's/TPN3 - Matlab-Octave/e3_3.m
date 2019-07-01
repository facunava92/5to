% Ejericico 1. Experimentaremos con un filtro muy simple: el filtro de retardo. 
% Este filtro consiste en un impulso desplazado y su único efecto es retardar 
% la señal de entrada
clear all;
clc;
close all;

[r, fs]=audioread('numeros.wav'); % tambien se puede usar wavread() 
sound(r, fs); %Reproduce 


disp('Presiona para reproducior audio con delay!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

info = audioinfo('numeros.wav');

Total_bits = info.BitsPerSample * r; %Total de bits =bitspormuestra * totalmuestras
Delay_300=0.3*fs; %Numero de muestras equivalentes a un retardo de 300 ms
h=zeros(Delay_300, 1);      %Se crea una funcion impulso en 300 ms
h(end)=1;
l=conv(h,r);
l=l(1:length(r), 1);       %elimina elementos para que l tenga igua longitud que r
estereo=[r, l];            %concatena dos vectores o pistas mono en una estereo
audiowrite('numeros_estereo.wav', estereo, fs); %tambien se puede usar wavwrite()
sound(estereo, fs); %Se comprueba un retraso entre ambas pistas

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

%Ejercicio2. A continuación utilizaremos una extensión del filtro de retardo
%llamada filtro peine (comb filter)

clear all;
clc;
close all;

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
figure();
stem(h);

audiowrite('numeros_peine.wav',y,fs)