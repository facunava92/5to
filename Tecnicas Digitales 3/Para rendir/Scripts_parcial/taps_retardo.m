clear;close all;clc;
%%
%Si la frecuencia de muestreo es de 10 KHz ¿ Cuanto retardo en milisegundos generará 
%un filtro compuesto por un impulso desplazado 6000 taps?
%%

fs=25e3;               %frecuencia muestreo
taps=4000;
n = 2;                  %numero de impulsos

r=taps*n/fs;
disp(['Retardo[seg]: ' num2str(r)]);             

%%
%Si la frecuencia de muestreo es de 10KHz ¿Cuantos taps necesito para
%generar un retardo de 400 milisegundos?
%%

fs=10e3;                %frecuencia muestreo
r=400e-3;               %tiempo

taps=r*fs;
disp(['Taps: ' num2str(taps)]);             

