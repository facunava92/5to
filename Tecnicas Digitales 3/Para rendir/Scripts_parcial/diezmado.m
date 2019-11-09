clear;close all;clc;
%%
%Indique un valor de upsampling L y downsampling M, necesarios para pasar de
%una frecuencia de muestreo de 44100 Hertz a una de 96000 Hertz.
%%

Fnueva=96000;
Fvieja=44100;

[L,M]=rat(Fnueva/Fvieja);
disp(['L (sobremuestreo):' num2str(L)]);
disp(['M (diezmado):' num2str(M)]);
