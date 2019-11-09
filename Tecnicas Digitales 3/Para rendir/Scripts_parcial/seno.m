clear;close all;clc;
%%
%Si la frecuencia de muestreo es de 48 KHz ¿ A que frecuencia real 
%corresponde una frecuencia digital de 0.35?
%%

%En una senoidal de 1000 muestras, frecuencia 3 y amplitud 1, que valor
%tiene la muestra 35?

N   = 150;         %Numero de muestras
A   = 1;            %Amplitud
f   = 3;
i   = 35;           %indice
x	= (1:1:N);      %Vector de tiempo 


y = A* sin(2* pi * f * (1/N) * x);

fprintf('y[%d]: %d\n\n',i,y(i-1));

