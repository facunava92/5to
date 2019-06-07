% Ejercicio 1. Experimentaremos con un filtro muy simple: el filtro de 
% retardo. Este filtro consiste en un impulso desplazado y su único efecto
% es retardarla señal de entrada.

clear all;
clc;
close all;

[r, fs]=audioread('numeros.wav');       % tambien se puede usar wavread() 
%sound(r, fs); %Reproduce 

info = audioinfo('numeros.wav');

Total_bits = info.BitsPerSample * r;    %Total de bits =bitspormuestra * totalmuestras
Delay_300=0.3*fs;                       %Numero de muestras equivalentes a un retardo de 300 ms
h=zeros(Delay_300, 1);                  %Se crea una funcion impulso en 300 ms
h(end)=1;
l=conv(h,r);
l=l(1:length(r), 1);                    %elimina elementos para que l tenga igua longitud que r
estereo=[r, l];                         %concatena dos vectores o pistas mono en una estereo
audiowrite('numeros_estereo.wav', estereo, fs); %tambien se puede usar wavwrite()
sound(estereo, fs);                     %Se comprueba un retraso entre ambas pistas

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

% Ejercicio 2. A continuación utilizaremos una extensión del filtro de
% retardo llamada filtro peine (comb filter).

clear all;
clc;
close all;
N=5; %Para que el mayor retraso del ultimo elemento sean 100ms, N debe ser 5
[x, fs]=audioread('numeros.wav');
y=zeros(length(x), 1);
E=zeros(length(x), 1);
K=0.02*fs; %Factor retraso K de 20ms
a=zeros(N, 1);


for i=1 : N              
            delay=K*i;
            h=zeros(delay, 1);
            h(end)=1;
            C=conv(x, h);
            C=C(1:length(x), 1);
            a(i)=(10^(-2*i/20)); %a: coeficiente que debe dar -3dB de POTENCIA
                                 %(NO AMPLITUD) que el elemento retrasado anterior
end;


for n=1 : length(y)
  if n>1
    for i=1 : N
       if i>1
          E(n)=a(i)*C(n)+E(n); 
       else                    
          E(n)=C(n);
       end   
    end
  else
    E(n)=0;
  end
  y(n)= x(n) + E(n);
end;

figure();
plot(y);

Yn=y./max(y);   %Normalizado de la señal, para que ningun elemento supere 
                %1 en amplitud
sound(Yn, fs);
audiowrite('numeros_echo.wav',Yn, fs);

