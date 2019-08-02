%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Diseño óptimo de filtros
%ejercicio 6.1
pkg load signal

fs=22050;
f1=1000/(fs/2);
f2=1100/(fs/2);
t=fs*2;
k=2*fs;
x=(0:(k/2-1))*fs/k;

s1=zeros(1,t);
for i=1:t
s1(i)=0.5*sin (pi*f1*(i));
end

s2=zeros(1,t);
for i=1:t
s2(i)=0.5*sin (pi*f2*(i));
end
s=s1+s2;

S=fft(s,k);
SdB=20*log(abs(S(1:k/2)/fs));
figure(1);
plot(x,SdB);
title('Espectro de la senal');
xlabel('Frecuencia');
ylabel('Amplitud [dB]');

%sound(s,fs)
%6.2
A=[1,1,0.01,0.01];
F=[0,f1,f2,1];

filtro=firls(200,F,A);  %Algoritmo LMS (me da problema con type double)
%filtro=firpm(200,F,A);  %Algoritmo remez
FILTRO=fft(filtro,k);

filtrada=conv(filtro,s);
FILTRADA=fft(filtrada,k);

aa=zeros((k/2),1);
bb=zeros((k/2),1);
for i=1:((k/2)-1)
    bb(i,1) = FILTRO(i);
end

for i=1:((k/2)-1)
    aa(i,1) = i/(k/2);
end

figure(2)
plot(aa*(fs/2),20*log((abs(bb))));
title('filtro');
ylabel('G (dB)')
xlabel('frecuencia Hz')

xx=zeros((k/2),1);
yy=zeros((k/2),1);
for i=1:((k/2)-1)
    xx(i,1)=FILTRADA(i);
end

for i=1:((k/2)-1)
    yy(i,1) = i/(k/2);
end

figure(3)
plot(yy*(fs/2),20*log(abs(xx(1:k/2)/fs)));    
title('senal filtrada');
xlabel('Frecuencia[Hz]');
ylabel('Amplitud[dB]');

sound(filtrada,fs)
