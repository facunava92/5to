close all;

Fs = 39062.5;         % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2^8;             % Length of signal
t = (0:L-1)*T;        % Time vector

S = sin(2*pi*5000*t) + sin(2*pi*15000*t);
 
X = S + 2*randn(size(t));

figure()
subplot(2,2,1)
plot(1000*t(1:L),X(1:L))
title('Señal con ruido')
xlabel('t (milisegundos)')
ylabel('X(t)')

tic
y3 = mi3_fft(X);
tiempo_mi3FFT = toc;

tic
y2 = mi2_fft(X);
tiempo_mi2FFT = toc;

tic
Z= fft(X);
tiempo_MatLabFFT = toc;

disp('El tiempo requerido con "MatLab FFT" es (en segundos) de:')
disp(tiempo_MatLabFFT)
disp('El tiempo requerido con "mi FFT" [2 bucles] es (en segundos) de:')
disp(tiempo_mi2FFT)
disp('El tiempo requerido con "mi FFT" [3 bucles] es (en segundos) de:')
disp(tiempo_mi3FFT)

P2 = abs(y3/L);
P1 = P2(1:(L/2)+1);

P4= abs(y2/L);
P3 = P4(1:(L/2)+1);

P6= abs(Z/L);
P5 = P6(1:(L/2)+1);

f = Fs*(0:L/2)/L;
fd = (0:Fs/L:Fs/2);
subplot(2,2,2)
plot(f,P1) 
title('FFT 3 Bucles')
xlabel('f (Hz)')
ylabel('|Y3(f)|')

subplot(2,2,3)
plot(f,P3) 
title('FFT 2 Bucles')
xlabel('f (Hz)')
ylabel('|Y2(f)|')

subplot(2,2,4)
plot(f,P5)
title('FFT MatLab')
xlabel('f (Hz)')
ylabel('|Z(f)|')
