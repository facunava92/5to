clear;close all;clc;
%%
%Se desea generar una interrupción con el timer de 32 bits cada 0.25 segundos,
%para un frecuencia de 20MIPS. Indicar en hexadecimal el valor de los registros PR3 y PR2.
%%

t=2.5;          %tiempo
f=40e6;         %frecuencia 
N=t*f;          %numero de cuentas
x=dec2hex(N,8); % Dividir en dos numeros de 4 cifras
disp(['PR3: 0x' x(1:4)])
disp(['PR2: 0x' x(5:8)])
