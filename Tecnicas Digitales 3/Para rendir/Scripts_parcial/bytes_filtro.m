clear;close all;clc;
%%
%Se desea realizar 2(dos) filtros de IIR de 6 secciones cada uno, utilizando 
%la librería dsp en dsPIC. ¿Cuántos BYTES son necesarios para almacenar todos los coeficientes de los filtros? 
%%

secc=3;
filtros=1;

bytes_coef=2;           %fijo por la libreria
coef=5;                 %fijo por la libreria

bytes=secc*filtros*coef*bytes_coef;
disp(['Numero de bytes: ' num2str(bytes)]);