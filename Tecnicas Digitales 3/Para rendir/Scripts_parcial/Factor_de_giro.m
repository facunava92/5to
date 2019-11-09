clear;close all;clc;
%%
%Se desea realizar una FFT de tamaño 128  utilizando la librería dsp en el dsPIC. Utilizando el simulador, 
%indique el valor hexadecimal de la parte real ubicado en el índice 27 del vector de factores de giro.
%%

indice =  27;                     %indice ; el maximo seria Tamaño FFT/2 -1
TamanoFFT= 64;                   %tamaño FFT
r=cos(2*pi*indice/TamanoFFT);   %parte real decimal
im=-sin(2*pi*indice/TamanoFFT);   %parte imag decimal

%exp(-2*pi*i*FactorG/TamanoFFT)

a = fi((r),1,16,15);             
b = fi((im),1,16,15);
rh=a.hex;
ih=b.hex;

fprintf('Tamaño FFT: %d\n',TamanoFFT);
fprintf('Factor de giro: %d\n\n',indice);

fprintf('Real: %f ; 0x%s \nImag: %f ; 0x%s \n',r,rh,im,ih);

%%
% ¿Cuál es el valor del segundo factor de giro, expresado como parte real 
% e imaginaria en punto flotante, para una FFT de tamaño 32?
%%


N = 64; %determino el tamaño del vector de entrada
posicion = 4;
k = [0 : N/2-1]; %el indice de muestras k va de 0 a (N-1), pero calculo sola la mitad ya que la otra mitad va con signo cambiado
fac_giro = exp(-1i*2*pi*k/N); %desarrollo los factores de giro segun la cantidad N, solo N/2 elementos para los factores

fprintf('\n\nFactor de giro [%d] = ',posicion);
disp(fac_giro(posicion));
