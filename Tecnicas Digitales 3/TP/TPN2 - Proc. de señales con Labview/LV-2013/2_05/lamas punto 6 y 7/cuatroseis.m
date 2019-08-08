%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Diseño óptimo de filtros
%ejercicio 6.1
clc;
clear;
fs=22050;
f1=(2*1000)/(fs);       %Frec Digital             
f2=(2*1100)/(fs);       %Frec Digital 
t=fs*2;
L=2*fs;
x=(0:(L/2-1))*fs/L;       

s1=zeros(1,t);
for i=1:t
s1(i)=0.5*sin (pi*f1*(i));
end

s2=zeros(1,t);
for i=1:t
s2(i)=0.5*sin (pi*f2*(i));
end
s=s1+s2;
S=fft(s,L);
SdB=20*log(abs(S(1:L/2)/fs));
figure(1);
plot(x,SdB);
title('Espectro de la senal');
xlabel('Frecuencia');
ylabel('Amplitud dB');
sound(s,fs)


%6.2

A=[1,1,0.01,0.01];    %     A  ganancia  ATENUACION  10^(-40/20) 
F=[0,f1,f2,1];    %    F  frecuencia 

% filtro-filtrado firls
filt=firls(1400,F,A);
FILTRO=fft(filt,t);
firls_dB=20*log10(abs(FILTRO(1:L/2))/(L/2));


filtrada=conv(filt,s);
FILTRADA=fft(filtrada,L);
firlsdB=20*log10(abs(FILTRADA(1:L/2))/(L/2));  %Espectro de la señal filtrada en dB


% filtro-filtrado remez
   
filt_REM=firls(1000,F,A);
FILTRO_remez=fft(filt_REM,t);
REMEZ_dB=20*log10(abs(FILTRO_remez(1:L/2))/(L/2));


filtrada_REM=conv(filt_REM,s);
FILTRADA_remez=fft(filtrada_REM,L);
firlt_remez_dB=20*log10(abs(FILTRADA_remez(1:L/2))/(L/2));  %Espectro de la señal filtrada en dB


%GRAFICA

%Grafico con los resultados
figure(2);
hold on;
plot(x,SdB)          %Señal original
plot(x,firls_dB)    %Espectro del filtro firls
plot(x,REMEZ_dB)    %Espectro del filtro remez
plot(x,firlsdB)    %Señal filtrada con firls
plot(x,firlt_remez_dB)  %Señal filtrada con remez
hold off;
title('Espectro');
xlabel('Frecuencia');
ylabel('Amplitud dB');
legend('Señal original','Espectro Filtro firls','Espectro filtro remez',' salida firls', ' salida remez');

% filtrado
sound(filt,Fs) 
sound(filt_REM,Fs)

