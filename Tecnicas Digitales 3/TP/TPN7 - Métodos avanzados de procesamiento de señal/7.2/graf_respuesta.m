function graf_respuesta(KERNEL, RES_FFT)
%esta funcion permite hacer la grafica de la respuesta en frecuencia usando 
%FFT(solo hace el Bode de magnitud referido a frecuencia digital), como argumentos tiene
%los coeficientes KERNEL a representar, y la resolución RES_FFT de la FFT requerida.
%NO retorna ningun valor al programa principal

x = [0 : (RES_FFT/2)-1]; %creo un vector auxiliar que me permite crear luego los valores de frecuencias digitales
fd = x / ((RES_FFT/2)-1); %vector con valores de frecuencias digitales
H = fft(KERNEL, RES_FFT); %respuesta espectral del filtro
H_db = mag2db(abs(H)); %se obtiene la amplitud en dB
figure()
plot(fd, H_db(1 : (RES_FFT/2))) %grafico la respuesta espectral del filtro
grid on
xlabel('Frecuencia digital.')
ylabel('Amplitud [dB]')

end

