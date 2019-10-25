%Guia 7, Ejercicio 3
%5R2; 24-10-19 
%Amaya, Lamas, Navarro, Veron

close all;
clear all;
clc;

%PUNTO 3.1
N = input('Ingrese un valor de cantidad de elementos a calcular la FFT:');
b = ceil(log2(N));
N = 2^b; %con estas 3 líneas puedo tomar por teclado cualquier número, pero luego lo fuerzo a que sea potencia de base 2, ya que la FFT es recomendable que sea así su cantidad de elementos

%N = 4096; %tamaño de la secuencia de números, puede cambiar en: 4, 8, 16, 64 elementos

%vector = round(10*rand(1, N), 8); %se crea un vector de N elementos aleatorios con valores entre 0 y 10

%vector = [5, 0, -3, 4]; %vector de prueba despues eliminarlo
%vector = [0 4 4*i 4 0 4 -4*i 4]; %vector de prueba despues eliminarlo

%paso a la frecuencia el "vector" con mi fft
tic
VECTOR_MI_FFT = mi_fft(vector); %llamo a mi funcion de calculo de FFT
tiempo_miFFT = toc;
%paso a la frecuencia el "vector" con fft de MatLab
tic
VECTOR_Matlab = fft(vector); %llamo a la funcion de calculo de la FFT de MatLab
tiempo_MatLabFFT = toc;


disp('El tiempo requerido con "mi FFT" es (en segundos) de:')
disp(tiempo_miFFT)
disp('El tiempo requerido con "MatLab FFT" es (en segundos) de:')
disp(tiempo_MatLabFFT)

%por los resultados que se pueden observar, se llega al mismo valor
%(o casi el mismo valor, más adelante se muestra que difieren por infinitesimales)
%de FFT en cada funcion, pero la de MatLab
%está muy optimizada en cuestion de tiempo de calculo

% 
% figure()
% plot([0:N-1], real(VECTOR_MI_FFT), '-.m')
% grid on
% hold on
% plot([0:N-1], real(VECTOR_Matlab), '-b')
% xlim([0 N-1])
% xlabel('Elementos de las partes reales de las FFT.')
% ylabel('Valores de los elementos de las partes reales de las FFT')
% title('Comparacion de Partes Reales.')
% legend('mi_fft', 'MatLab')
% 
% figure()
% plot([0:N-1], imag(VECTOR_MI_FFT), ':m')
% grid on
% hold on
% plot([0:N-1], imag(VECTOR_Matlab), '-b')
% xlim([0 N-1])
% xlabel('Elementos de las partes imaginarias de las FFT.')
% ylabel('Valores de los elementos de las partes imaginarias de las FFT')
% title('Comparacion de Partes Imaginarias.')
% legend('mi_fft', 'MatLab')
% 
% figure()
% plot([0:N-1], real(VECTOR_MI_FFT) - real(VECTOR_Matlab), 'b')
% grid on
% hold on
% plot([0:N-1], imag(VECTOR_MI_FFT) - imag(VECTOR_Matlab), 'r')
% xlim([0 N-1])
% xlabel('Elementos de las FFT.')
% ylabel('Valores de diferencias entre los elementos de las FFT')
% title('Diferencias de Partes Real y Partes Imaginarias entre las FFT.')
% legend('diferencia en Real', 'diferencias en Imaginario')
% 
% %como se puede ver, existe una mínima diferencia numérica entre la FFT obtenida en "mi_fft"
% %y la arrojada por MatLab, pero se puede conciderar "iguales" ya que se está en el orden de 10^-14 o 10^-15.
% %Ello se debe a que el algoritmo que utiliza MatLab es distinto al implementado.
