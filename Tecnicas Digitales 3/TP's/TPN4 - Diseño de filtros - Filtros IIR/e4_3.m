%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Filtros pasa altos
%ejercicio 3.1 - Método de inversión del espectro
Fs=44100;
fpass= (2*3000)/Fs;
fstop= (2*4000)/Fs;
ft=(fstop+fpass)/2;
B=fstop-fpass;
M=floor(8/B)+1;
hamm=hamming(M);
fpb=zeros(1,M);
ret=zeros(1,M);
ret((M-1)/2)=1;

for n=1:M-1
    hsinc(n)=ft*sinc(ft*(n-((M-1)/2)));
    fpb(n)=hsinc(n)*hamm(n);  %Filtro pasa bajo
    fpa(n)=ret(n)-fpb(n);  %Filtro pasaalto
end
figure(1)
freqz(fpb,1,M,Fs)
title('Filtro pasabajos');
figure(2)
freqz(fpb,1,M,Fs)
title('Filtro pasaaltos - Inversion del espectro');
%
%3.2 - Método de reversión del espectro
Fs=44100;
fpass= (2*3000)/Fs;
fstop= (2*4000)/Fs;
ft=(fstop+fpass)/2;
B=fstop-fpass;
M=floor(8/B);
hamm=hamming(M);
fpb=zeros(1,M);
%
for n=1:M-1
	hsinc(n)=ft*sinc(ft*(n-((M-1)/2)));
    fpb(n)=hsinc(n)*hamm(n);
    fpa(n)=fpb(n)*(-1)^n;
end
figure (1);
freqz(fpb,1,M,Fs)
title('Filtro pasabajos');
figure (3);
freqz(fpa,1,M,Fs)
title('Filtro pasaaltos - Reversion del espectro');
%
%3.3 
Fs=44100;
fpass= (2*6000)/Fs;
fstop= (2*6100)/Fs;
ft=(fstop+fpass)/2;
B=fstop-fpass;
M=floor(12/B)+1;
black=blackman(M);
fpb=zeros(1,M);
ret=zeros(1,M);
ret((M-1)/2)=1;
%
for n=1:M-1
    hsinc(n)=ft*sinc(ft*(n-((M-1)/2)));
    fpb(n)=hsinc(n)*black(n);  %Filtro pasa bajo
    fpa(n)=ret(n)-fpb(n);  %Filtro pasaalto
end
figure(1)
freqz(fpb,1,M,Fs)
title('Filtro pasabajos');
figure (4)
freqz(fpa,1,M,Fs)
%
