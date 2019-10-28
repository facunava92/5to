clc
clear all
close all

%esta funcion implementa la FFT de un vector de tamaño N, siendo N potencia de base 2


N = 8; %determino el tamaño del vector de entrada
k = [0 : N/2-1]; %el indice de muestras k va de 0 a (N-1), pero calculo sola la mitad ya que la otra mitad va con signo cambiado
fac_giro = exp(-1i*2*pi*k/N); %desarrollo los factores de giro segun la cantidad N, solo N/2 elementos para los factores

for step=2.^(0:log2(N/2))
    disp('stages')
    for j=0:step-1
        for i=1:step*2:N-j
            disp(i+j)
            disp(i+j+step)
            disp(j*(N/2)/step+1)
        end
    end
end
