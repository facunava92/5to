Fs = 39062.5;         % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 512;             % Length of signal
t = (0:L-1)*T;        % Time vector

S = sin(2*pi*5000*t) + sin(2*pi*1500*t);
 
X = S + 2*randn(size(t));

figure()
plot(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

tic
Y3 = mi3_fft(X);
tiempo_mi3FFT = toc;

tic
Y2 = mi2_fft(X);
tiempo_mi2FFT = toc;

tic
Z= fft(X);
tiempo_MatLabFFT = toc;

disp('El tiempo requerido con "mi FFT" [3 bucles] es (en segundos) de:')
disp(tiempo_mi3FFT)
disp('El tiempo requerido con "mi FFT" [2 bucles] es (en segundos) de:')
disp(tiempo_mi2FFT)
disp('El tiempo requerido con "MatLab FFT" es (en segundos) de:')
disp(tiempo_MatLabFFT)


P2 = abs(Y3/L);
P1 = P2(1:(L/2)+1);

P4= abs(Z/L);
P3 = P4(1:(L/2)+1);

figure()
f = Fs*(0:L/2)/L;
fd = (0:Fs/L:Fs/2);
plot(f,P1) 
figure()
plot(f,P3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')