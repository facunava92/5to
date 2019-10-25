function Q = filtro_pasa_altos(FS, Fcorte, BW, TAPS)
%esta función permite crear un filtro pasa altos mediante el algoritmo LMS, teniendo como datos de entrada la:
%FS frecuencia de muestreo, Fcorte frecuencia de corte del filtro, BW ancho de banda de transicion
%y cantidad de TAPS del kernel.
%Retorna al programa principal, los coeficientes del kernel del filtro.


Fcorte_d = Fcorte/(FS/2); %se pasa a frecuencia digital
Fcorte_d_inf = (Fcorte - (BW/2))/(FS/2);
Fcorte_d_sup = (Fcorte + (BW/2))/(FS/2);
Fpa = [0, Fcorte_d_inf, Fcorte_d_sup, 1]; %defino los tramos de frecuencias del filtro
Apa = [0,            0,            1, 1]; %defino las amplitudes en los tramos de frecuencias del filtro
Q = firls(TAPS, Fpa, Apa); %filtro pasa altos, determino los coeficientes mediante algoritmo LMS


end
