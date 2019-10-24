%----------------------- Filtro IIR por Chevy ----------------------------%
fm = 39062; %frecuencia de muestreo necesaria para digitalizar freuencias, se usa la del ejercicio anterior
x = (0:(fm/2 - 1))*2/fm;
L = 4*fm; %longitud de 4 seg.
i = zeros (1, L); %funcion impulso
i(1) = 1;

%PASA BAJOS
Fcpb = 500;
fcpb = 2*Fcpb/fm;  %digitalizo frecuencia y eje x
[Bpb, Apb] = cheby1 (2, 0.1, fcpb, 'low'); %se especifica orden, ripple, fc, tipo

hpb = filter(Bpb, Apb, i);  %respuesta del filtro
Hpb = fft(hpb, fm);      %repsuesta en frecuencia
Hpbdb = 20*log(abs(Hpb(1:fm/2)));

%PASA ALTOS
Fcpa = 3000;
fcpa = 2*Fcpa/fm;  %digitalizo frecuencia y eje x
[Bpa, Apa] = cheby1 (2, 0.1, fcpa, 'high'); %se especifica orden, ripple, fc, tipo

hpa = filter(Bpa, Apa, i);  %respuesta del filtro
Hpa = fft(hpa, fm);      %repsuesta en frecuencia
Hpadb = 20*log(abs(Hpa(1:fm/2)));

%PASA BANDA
Fcpb2 = 3000;
fcpb2 = 2*Fcpb2/fm;  %digitalizo frecuencia y eje x
[Bpb2, Apb2] = cheby1 (2, 0.1, fcpb2, 'low'); %se especifica orden, ripple, fc, tipo
hpb2 = filter(Bpb2, Apb2, i);  %respuesta del filtro

Fcpa2 = 500;
fcpa2 = 2*Fcpa2/fm;  %digitalizo frecuencia y eje x
[Bpa2, Apa2] = cheby1 (2, 0.1, fcpa2, 'high'); %se especifica orden, ripple, fc, tipo
hpa2 = filter(Bpa2, Apa2, i);  %respuesta del filtro

hpban = conv(hpa2, hpb2);

% fcpban = [fcpb, fcpa];
% [Bpban, Apban] = cheby1 (1, 0.1, fcpban, 'bandpass'); %se especifica orden, ripple, fc, tipo
% 
% hpban = filter(Bpban, Apban, i);  %respuesta del filtro
Hpban = fft(hpban, fm);      %repsuesta en frecuencia
Hpbandb = 20*log(abs(Hpban(1:fm/2)));

figure;
plot(x, Hpbdb);
hold;
plot(x, Hpadb);
plot(x, Hpbandb);
title 'Filtro IIR Chebyshev tipo I';
legend ('FPB', 'FPA', 'FPBan');

%Combinacion de 4 etapas en serie de cada filtro
for i = 1:4
    hpb = filter (Bpb, Apb, hpb);
    hpa = filter (Bpa, Apa, hpa);
    hpb2 = filter (Bpb2, Apb2, hpb2);
    hpa2 = filter (Bpa2, Apa2, hpa2);
end
hpban = conv(hpa2, hpb2);
Hpb = fft(hpb, fm);
Hpbdb = 20*log(abs(Hpb(1:fm/2)));
Hpa = fft(hpa, fm);      
Hpadb = 20*log(abs(Hpa(1:fm/2)));
Hpban = fft(hpban, fm);      
Hpbandb = 20*log(abs(Hpban(1:fm/2)));
figure;
plot(x, Hpbdb);
hold;
plot(x, Hpadb);
plot(x, Hpbandb);
title 'Cuatro etapas en serie de cada filtro';
legend ('FPB', 'FPA', 'FPBan');

%Normalizacion de coeficientes
%FPB
Bpb = Bpb/2;
Apb = Apb/2;
Bpb_fx = fi(Bpb,1,16,15);
Apb_fx = fi(Apb,1,16,15);
cpb = ['0x' hex(Bpb_fx(1)) ', 0x' hex(Bpb_fx(2)) ', 0x' hex(-Apb_fx(2)) ', 0x' hex(Bpb_fx(3)) ', 0x' hex(-Apb_fx(3))];
%FPA
Bpa = Bpa/2;
Apa = Apa/2;
Bpa_fx = fi(Bpa,1,16,15);
Apa_fx = fi(Apa,1,16,15);
cpa = ['0x' hex(Bpa_fx(1)) ', 0x' hex(Bpa_fx(2)) ', 0x' hex(-Apa_fx(2)) ', 0x' hex(Bpa_fx(3)) ', 0x' hex(-Apa_fx(3))];
%FPBan
Bpb2 = Bpb2/2;
Apb2 = Apb2/2;
Bpb2_fx = fi(Bpb2,1,16,15);
Apb2_fx = fi(Apb2,1,16,15);
cpb2 = ['0x' hex(Bpb2_fx(1)) ', 0x' hex(Bpb2_fx(2)) ', 0x' hex(-Apb2_fx(2)) ', 0x' hex(Bpb2_fx(3)) ', 0x' hex(-Apb2_fx(3))];

Bpa2 = Bpa2/2;
Apa2 = Apa2/2;
Bpa2_fx = fi(Bpa2,1,16,15);
Apa2_fx = fi(Apa2,1,16,15);
cpa2 = ['0x' hex(Bpa2_fx(1)) ', 0x' hex(Bpa2_fx(2)) ', 0x' hex(-Apa2_fx(2)) ', 0x' hex(Bpa2_fx(3)) ', 0x' hex(-Apa2_fx(3))];

cpb
cpa
cpb2
cpa2





