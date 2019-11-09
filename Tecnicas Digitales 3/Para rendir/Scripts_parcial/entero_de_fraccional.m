clear;close all;clc;
%%
%Determinar el valor entero, expresado en formato decimal, 
%correspondiente al número -0.40625 expresado en formato S16,15.
%%

n=-0.71875; % valor dato
n_fi=fi(n,1,16,15);
N=dec(n_fi);
disp(['Entero: ' N]);
disp(['Hexa: 0x' hex(n_fi)]);
disp(['Binario: ' bin(n_fi)]);
