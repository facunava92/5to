clear;close all;clc;
%%
%En el ejercicio 3.2 de la guía 3 ¿Qué amplitud tiene el último tap 
%si cambio la atenuación entre retardos a 2 dB? 
%%

a_db=2;
a=10^((-5*a_db)/20);
disp(['Atenuacion en veces: ' num2str(a)]);
disp(['Atenuacion en db: -' num2str(a_db*5)]);