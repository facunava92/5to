clear;close all;clc;
%%
%Suponiendo una frecuencia de muestreo de 44100Hz, una primer modulación en 0.5 
%y una segunda modulación de 0.4932 (ambas modulaciones expresadas en frecuencia digital de 0 a 1 
%¿ Cual será el desplazamiento en Hertz resultante del espectro?
%%

fs=44100;
Mod1=0.5;
Mod2=0.509;
f=fs/2*(Mod1-Mod2);
disp(['Frecuencia[Hz]: ' num2str(f)]);              %Descomentar

%%
%Suponiendo que se desea desplazar el espectro de una señal de 200 hertz y asumiendo una frecuencia
%de muestreo de 44100 Hertz, y una primer modulación de 11025 Hertz ¿ Cual deberá ser la frecuencia 
%digital de 0 a 1 del segundo coseno.
%%

fs=44100;
f1=11025;
f2=100;

Mod1=f1/(fs/2);
Mod2=f2/(fs/2);
fd=Mod1-Mod2;
disp(['Frecuencia digital: ' num2str(fd)]);        %Descomentar
