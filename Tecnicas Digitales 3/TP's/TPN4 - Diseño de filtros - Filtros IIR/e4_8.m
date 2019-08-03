%5R2 2018
%Favero, Martiarena, Rubio, Sanson 
%ejercicio 8.1
fs=256;            %frecuencia de muestreo
f=50/(fs/2);        %Frecuencia de corte digital
K=fs*2;            %Numero de muestras
x=(0:K/2-1)*fs/K;  %vector frecuencias digitales

[B,A]=butter(3,f,'high');  
B
A

%ejercicio 8.2
t=4*fs;         
imp=zeros(1,t);     
imp(1)=1;   

hpa=filter(B,A,imp);   

Hpa=fft(hpa,K);      
HpadB=20*log10(abs(Hpa(1:K/2)));

figure(1);
plot(x,HpadB);
title('FPAlto Butter');
xlabel('Frecuencia');
ylabel('Amplitud');
hold all;

%ejercicios 8.3 - 8.4
x20=find(x>=20);                  
atenuacion= abs(HpadB(x20(1)));    
cont=1;                           
figure(2)
while (atenuacion <= 120)
    hpa=filter(B,A,hpa);                    
    Hpa=fft(hpa,K);                         
    HpadB=20*log10(abs(Hpa(1:K/2)));
    x20=find(x>=20);
    atenuacion= abs(HpadB(x20(1)));
    
    cont= cont + 1;
    hold all;
    plot(x,HpadB);
end
legend(strcat('Etapas para filtro butterworth: ',num2str(cont))); 


%ejercicio 8.5
%Filtro Chebyshev de tipo 1
fs=256;            
f=50/(fs/2);        
K=fs*2;            
x=(0:K/2-1)*fs/K;  

[B,A]=cheby1(3,1,f,'high');  
B
A
t=4*fs;         
imp=zeros(1,t);     
imp(1)=1;   

hpa=filter(B,A,imp);   

Hpa=fft(hpa,K);      
HpadB=20*log10(abs(Hpa(1:K/2)));

figure(3);
plot(x,HpadB);
title('FPAlto Cheby1');
xlabel('Frecuencia');
ylabel('Amplitud');
hold all;
x20=find(x>=20);                  
atenuacion= abs(HpadB(x20(1)));    
cont=1;                           
figure(4)
while (atenuacion <= 120)
    hpa=filter(B,A,hpa);                    
    Hpa=fft(hpa,K);                         
    HpadB=20*log10(abs(Hpa(1:K/2)));
    x20=find(x>=20);
    atenuacion= abs(HpadB(x20(1)));
    
    cont= cont + 1;
    hold all;
    plot(x,HpadB);
end
legend(strcat('Etapas para filtro Chebyshev de tipo 1: ',num2str(cont))); 

%Filtro Chebyshev de tipo 2
fs=256;            
f=50/(fs/2);        
K=fs*2;            
x=(0:K/2-1)*fs/K;  

[B,A]=cheby2(3,1,f,'high');  
B
A
t=4*fs;         
imp=zeros(1,t);     
imp(1)=1;   

hpa=filter(B,A,imp);   

Hpa=fft(hpa,K);      
HpadB=20*log10(abs(Hpa(1:K/2)));

figure(5);
plot(x,HpadB);
title('FPAlto Cheby2');
xlabel('Frecuencia');
ylabel('Amplitud');
hold all;
x20=find(x>=20);                  
atenuacion= abs(HpadB(x20(1)));    
cont=1;                           
figure(6)
while (atenuacion <= 120)
    hpa=filter(B,A,hpa);                    
    Hpa=fft(hpa,K);                         
    HpadB=20*log10(abs(Hpa(1:K/2)));
    x20=find(x>=20);
    atenuacion= abs(HpadB(x20(1)));
    
    cont= cont + 1;
    hold all;
    plot(x,HpadB);
end
legend(strcat('Etapas para filtro Chebyshev de tipo 2: ',num2str(cont))); 


%Filtro ellip
fs=256;            
f=50/(fs/2);        
K=fs*2;            
x=(0:K/2-1)*fs/K;  

[B,A]=ellip(3,1,180,f,'high');  
B
A
t=4*fs;         
imp=zeros(1,t);     
imp(1)=1;   

hpa=filter(B,A,imp);   

Hpa=fft(hpa,K);      
HpadB=20*log10(abs(Hpa(1:K/2)));

figure(7);
plot(x,HpadB);
title('FPAlto Ellip');
xlabel('Frecuencia');
ylabel('Amplitud');
hold all;
x20=find(x>=20);                  
atenuacion= abs(HpadB(x20(1)));    
cont=1;                           
figure(8)
while (atenuacion <= 120)
    hpa=filter(B,A,hpa);                    
    Hpa=fft(hpa,K);                         
    HpadB=20*log10(abs(Hpa(1:K/2)));
    x20=find(x>=20);
    atenuacion= abs(HpadB(x20(1)));
    
    cont= cont + 1;
    hold all;
    plot(x,HpadB);
end
legend(strcat('Etapas para filtro Ellip: ',num2str(cont))); 

