%5R2 2019
%Amaya, Lamas, Navarro, Veron
%Filtro Pasabanda
%ejercicio 4.1
fc1=0.9;
fc2=0.2;
k=2000;
B=0.01;
M=floor(8/B)+1;
black=blackman(M);
fpb=zeros(1,M);


for n=1:M-1
    hsinc(n)=fc2*sinc(fc2*(n-((M-1)/2)));
    fpb(n)=hsinc(n)*black(n);  %Filtro pasa bajo
end


black2=blackman(M);
fpbaux=zeros(1,M);
ret=zeros(1,M);
ret((M-1)/2)=1;
for n=1:M-1
    hsinc(n)=fc2*sinc(fc2*(n-((M-1)/2)));
    fpbaux(n)=hsinc(n)*black2(n);  %Filtro pasa bajo auxiliar
    fpa(n)=ret(n)-fpbaux(n);  %Filtro pasaalto
    
end
fpba=conv(fpb,fpa);        %Filtro pasa banda
figure(1)
freqz(fpb,1)
title('Filtro pasabajos');
figure (2)
freqz(fpa,1)
title('Filtro pasaaltos');
figure (3)
freqz(fpba,1)
title('Filtro pasabanda');
%Esta bien la siguiente ecuacion? tenemos duda con el resultado
fpbahalf=fpba(1:k/2);
x=(0:k/2-1)*2/k;
figure(4)
plot(x,fpbahalf);
title('Filtro pasabanda');
