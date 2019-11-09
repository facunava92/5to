clear;close all;clc;
%%
%Al utilizar un filtro FIR desde la librería dsp en el dsPIC, a que valor
%es necesario alinear los coeficientes del filtro si este posee 257 taps.
%%

taps = 257;

x = ceil(log2(2*taps));
alig = 2^x;

disp(['Alineacion: ' num2str(alig)]);             
    
