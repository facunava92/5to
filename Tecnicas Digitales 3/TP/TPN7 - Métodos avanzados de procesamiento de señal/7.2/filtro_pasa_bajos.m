function Q = filtro_pasa_bajos(FS, Fcorte, BW, TAPS)
%esta funcion permite crear un filtro pasa bajos mediante el algoritmo LMS, teniendo como datos de entrada la:
%FS frecuencia de muestreo, Fcorte frecuencia de corte del filtro, BW ancho de banda de transicion
%y cantidad de TAPS del kernel.
%Retorna al programa principal, los coeficientes del kernel del filtro.

Fcorte_d_inf = (Fcorte - (BW/2))/(FS/2);
Fcorte_d_sup = (Fcorte + (BW/2))/(FS/2);
Fpb = [0, Fcorte_d_inf, Fcorte_d_sup, 1]; %defino los tramos de frecuencias del filtro
Apb = [1,            1,            0, 0]; %defino las amplitudes en los tramos de frecuencias del filtro
Q = firls(TAPS, Fpb, Apb); %filtro pasa bajos, determino los coeficientes mediante algoritmo LMS

end
