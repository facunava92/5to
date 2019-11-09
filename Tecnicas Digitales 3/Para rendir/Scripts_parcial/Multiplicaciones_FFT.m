clear;close all;clc;
%%
%Cuantas operaciones butterfly se necesitan en total para calcular una FFT de tamaño 4. 

%¿Cuántas multiplicaciones complejas se necesitan en total para calcular una FFT de tamaño 32?
%%

N=4;                       %tamaño fft
Complejas=log2(N)*N/2;
Reales= Complejas*4;

disp(['Complejas: ' num2str(Complejas)]);
disp(['Reales: ' num2str(Reales)]);
