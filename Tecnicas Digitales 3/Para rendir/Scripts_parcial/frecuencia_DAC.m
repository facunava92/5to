clear;close all;clc;
%%
%¿Qué frecuencia de muestreo se obtendrá en el DAC si el campo APSTSCLR del registro 
%ACLCON valor 0x5 y el campo DACFDIV del registro DAC1CONbits vale 0x5, asumiendo una 
%frecuencia de entrada (Fvco) de 160 MHz?

%APSTSCLR    
%111         Divide by 1
%110         Divide by 2
%101         Divide by 4
%100         Divide by 8
%011         Divide by 16
%010         Divide by 32
%001         Divide by 64
%000         Divide by 256 (default setting
%%

DACFDIV=11;             %dato
ACLKCON_TABLA=4;        %ver tabla
fvco=160e6;

div_DACFDIV=DACFDIV+1;
fs=fvco/(256 * (DACFDIV+1)* ACLKCON_TABLA);
disp(['Frecuencia de muestreo: ' num2str(fs)]);

%%
%Por cuál valor se debe dividir el clock de entrada al DAC para obtener una
%frecuencia de muestreo de 13020,8333 Hertz. Asumiendo una frecuencia de entrada de 160 MHz.
%%


fvco=160e6;
fs=13020.833;
divisor=fvco/(256*fs);
disp(['Se tiene que dividir por: ' num2str(divisor)]);

