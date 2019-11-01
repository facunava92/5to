%-------------------------- Filtro Pasa Bajos ----------------------------%
Fc = 3000;
BT = 300;
fm = 39062;

% %Numero de taps
bt = 2*BT/fm;         %normalizo la banda de transiscion para frecuencia muestreo
M = floor(8 / bt);

fc = 2*Fc/fm;         %normalizo la frecuencia de corte para la frecuencia muestreo
x = (0:(fm/2 - 1))*2/fm;

%Funcion sinc
if rem(M, 2) == 0       %si el resto de M/2 es 0, M es par
    n1 = -(M/2)+1;
    n2 = M/2;
else                    %si el resto de M/2 es 1, M es impar
    n1 = -(M-1)/2;
    n2 = (M-1)/2;
end

for n = 1:(-n1+n2+1)    %como n1 es negatrivo y la funcion sinc no toma parametro negativo, tomo n en vez de n1 a n2, va de 1 a |n1|+n2+1
    s(n) = sinc((n+n1)*fc); %le sumo a n n1 (negativo) para que grafique la parte inferior de sinc.
end

%Creacion de la ventana;
b = blackman(-n1+n2+1); %la cantidad de tabs sera la misma que la de la funcion sinc

%Creacion del filtro, multiplico punto a punto los elementos de sinc y de la ventana
for n = 1:(-n1+n2+1)
    hpb(n) = s(n)*b(n);
end
%Obtencion de la respuesta en frecuencia del filtro
Hpb = fft (hpb, fm);

%Normalizo el filtro
hpbn = hpb / abs(Hpb(1));
Hpbn = fft(hpbn, fm);
Hpbdb = 20*log(abs(Hpbn(1:fm/2)));

%Frecuencia de corte
posfcpb = find (Hpbdb(1:fm/2) <= (max(Hpbdb)-3));
fcpb = x(posfcpb(1))*fm/2;

%Atenuacion Banda de Stop y ancho banda de transicion
posbppb=find(Hpbdb<=(max(Hpbdb)-180));
M1 = max(Hpbdb(posbppb:fm/2));
atpb=max(Hpbdb)-M1;
abt = (x(posbppb(1))*fm/2 - fcpb);

%Ripple de la banda de paso
rpb = max(Hpbdb) - min(Hpbdb(1:find(Hpbdb == max(Hpbdb))));

%-------------------- Filtro Pasa Altos ---------------------------------%
%Retardo de muestras entre entrada y salida con senal impulso
i = zeros (M,1);       %funcion impulso
i(1) = 1;  
oi = filter(hpbn,1,i); %respuesta al impulso del filtro
R = find(oi==max(oi)); %posicion del maximo de la repsuesta al impulso = retardo del filtro

%Metodo de inversion de espectro
D = zeros (1, M);    %impulso retardado en R
D(R) = 1;           
hpa = D - hpbn;      %creo filtro pasa altos en el dominio de t
Hpa = fft(hpa, fm);
Hpadb = 20*log(abs(Hpa(1:fm/2)));
figure;
plot(x, Hpbdb);
hold;
plot(x, Hpadb)
title ({'Blackman', strcat('fc = ', num2str(fcpb), ' Hz'),strcat('r = ',num2str(rpb), ' dB'),strcat('at = ',num2str(atpb), ' dB'),strcat('abt = ',num2str(abt), ' Hz')});
legend('Pasa Bajos', 'Pasa Altos');

%-------------------- Filtro Rechaza Banda -------------------------------%
hrb = hpbn - hpa;         %creo filtro pasa altos en el dominio de t 
Hrb = fft(hrb, fm);
Hrbdb = 20*log(abs(Hrb(1:fm/2)));

%Frecuencia de corte 1 y 2, frecuencia central y ancho de banda de rechazo
posfcrb = find (Hrbdb(1:fm/2) <= (max(Hrbdb)-3));
fcrb1 = x(posfcrb(1))*fm/2;
fcrb2 = x(posfcrb(205))*fm/2;
abr = fcrb2 - fcrb1;
fc = x((find (Hrbdb == (min(Hrbdb)))))*fm/2;

figure;
plot(x, Hrbdb);
title ({'Blackman', strcat('fcentral = ', num2str(fc), ' Hz'),strcat('fc1 = ',num2str(fcrb1), ' Hz'),strcat('fcrb2 = ',num2str(fcrb2), ' Hz'),strcat('Ancho banda rechazo = ',num2str(abr), ' Hz')});

%--------------------- Coeficientes FIR ----------------------------------%
%Los cieficientes del rechaza banda estamn en hrb
z = {}; %defino s como un arreglo
hrb_fx = fi(hrb,1,16,15); % Convierte los coeficientes en S16.15
for i = 1:520
    z{end+1} = ['0x' hex(hrb_fx(i)) ', ']; %Crea una cadena y antepone 0x
end
display(z); % Muestra la cadena por consola
