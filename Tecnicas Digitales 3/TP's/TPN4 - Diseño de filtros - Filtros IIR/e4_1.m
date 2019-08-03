%5R2 2019
%Amaya, Lamas, Navarro, Veron
%ejercicio 1 guia 4
h = load('low_pass.dat');
stem(h)
K=1000;
H=fft(h,K); 
Habs=abs(H(1:K/2)); 
Hdb=20*log10(Habs);   
x=(0:(K/2-1))*2/K;  
                    
maxPaso=max(Hdb);              
posicion=find(Hdb==maxPaso);   
minimo= min(Hdb(1:posicion)); 
ripple= maxPaso-minimo;        

%Atenuacion en la banda de rechazo
posicion= find(Hdb<=-15);            
maxStop= max(Hdb(posicion(1):K/2));  
at= maxPaso-maxStop;               

%Frecuencia de corte
posicion=find(Hdb<=(maxPaso-3));     
fc= x(posicion(1));                  

%Ganancia en continua
cc=Hdb(1);

%Graficamos

figure
plot(x,Hdb);
xlabel('frec');
ylabel('dB');

text(0,13,{strcat('Ripple en la banda de paso=', num2str(ripple)), strcat('Ganancia en continua=', num2str(cc))}) 
text(0.5,15,{strcat('Atenuación en la banda de rechazo =', num2str(at)), strcat('Frecuencia de corte=', num2str(fc))})
