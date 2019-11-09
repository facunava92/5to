clear;close all;clc;
%%
%Suponga un filtro IIR pasabajos de 2do orden, y frecuencia de corte digital de 0.2
%¿Cuántas etapas en serie se necesitan para llegar a una atenuación de al menos 8dB en frecuencia 0.3? 
%% 

%-------------VALORES QUE SE CAMBIAN-------------------
%Fc=50;              %Frecuencia de corte en Hz
%fc=Fc*2/Fs;         %pasar a digital si da en Hz
fc=0.2;              %frecuencia de corte digital;
orden=2;             %orden del filtro
tipo='low';          %'high' 
fa=0.3;              %frecuencia en la que pide atenuacion
a=33;                %atenuacion que pide en fa
%------------------------------------------------------

Fs=256;             %Frecuencia de muestreo
K=2000;             %Numero de muestras
x=(0:K/2-1)*2/K;    %Eje de frecuencias digitales

[B,A]=butter(orden,fc,tipo);  %orden,frec corte, tipo 

%8.2 creamos función impulso de entrada de longitud de 4 seg
L=4*Fs;         
i=zeros(1,L);     
i(1)=1;        

%aplico el filtro a la señal
h_pa=filter(B,A,i);   

%pasamos al dominio de la frecuencia con FFT
H_pa=fft(h_pa,K);      
y_pa=20*log10(abs(H_pa(1:K/2)));

%graficamos
figure(1);
    plot(x,y_pa);
    title('Respuesta en frecuencia del pasa altos Butter');
    xlabel('Frecuencia');
    ylabel('Amplitud [dB]');
    grid;
    hold all;

x_20=find(x>=fa);                 %buscamos la posicion de la frecuancia de 0.3 -->CAMBIAR
atenuacion= abs(y_pa(x_20(1)));    %obtenemos la atenuacion en la posicion guardada anteriormente
cont=1;                            %contador para llevar el numero de etapas

while (atenuacion <= a) %-->CAMBIAR ATENUACION QUE PIDE
    %aplico el filtro a la señal impulso asi obtengo la respuesta el impulso...
    h_pa=filter(B,A,h_pa);                    
    %lo paso al dominio de la frecuencia
    H_pa=fft(h_pa,K);                         
    y_pa=mag2db(abs(H_pa(1:K/2)));
    %buscamos la posicion de la frecuancia de de 20hz
    x_20=find(x>=0.3);
    %obtenemos la atenuacion en la posicion guardada anteriormente
    atenuacion= abs(y_pa(x_20(1)));
    %incrementamos el contador
    cont= cont + 1;
    hold all;
    plot(x,y_pa);
end
legend(strcat('Etapas necesarias para lograr una atenuacion de 33dB con butter=',num2str(cont)));
