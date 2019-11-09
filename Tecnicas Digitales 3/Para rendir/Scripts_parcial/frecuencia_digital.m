clear;close all;clc;
%%
%Si la frecuencia de muestreo es de 48 KHz ¿ A que frecuencia real 
%corresponde una frecuencia digital de 0.35?
%%

fs=48e3;
fd=0.1;

f=fd*(fs/2);
disp(['Frecuencia[Hz]: ' num2str(f)]);