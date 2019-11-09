clear;close all;clc;
%% 
%Para una frecuencia de muestreo de 100 KHz ¿ Cuantos taps son necesarios 
% para un filtro pasabajos de ventana blackman con frecuencia de paso 1KHz 
% y frecuencia de stop 2 KHz?
%%

fs=60000;                   %frecuencia de muestreo
fp=1000;                    %frecuencia de paso
fc=2000;                    %frecuencia de corte
AB=abs((fc-fp)/(fs/2));     %ancho de banda
M=12/AB;                    %taps ventana blackman
fprintf('Taps: %d\n',M);