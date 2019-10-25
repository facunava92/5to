function [Q W] = signal_coseno(FS, tam, delta_f, amplitud)
%la funcion genera una señal coseno(devuelve el valor en Q, y su frecuencia en W), de mismo tamaño(valor tam)
%que la señal del audio, tendrá una desviación de frecuencia dado por delta_f
%(esto se usa luego cuando se genera el coseno para cambiar el tono del audio), se puede ajustar la
%amplitud a gusto del usuario.

f_cos = FS/4; %establezco la frecuencia del coseno en 11025Hz o 0.5 digital
Ts = 1/FS; %periodo del muestreo 45,35useg
duracion = tam*Ts; %defino la duración de la señal coseno
valores = [0 : Ts : duracion-Ts]; %genero valores de tiempos cada Ts segundos; el valor final digo "duracion-Ts" y de esa forma obtengo 44100 muestras, sino figura con valor final duracion, 44101 muestras 
Q = amplitud*cos(2*pi*(f_cos+delta_f)*valores);
W = f_cos;

end
