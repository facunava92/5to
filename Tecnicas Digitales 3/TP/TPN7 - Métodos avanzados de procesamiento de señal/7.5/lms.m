%Guia 7, Ejercicio 4
%5R2; 24-10-19 
%Amaya, Lamas, Navarro, Veron

close all
clc;

L = 1e6;          % Longitud de la simulación
N = 31;           % Tamaño del filtro de ecualización
mu = 1e-2;        % Velocidad de adaptación
sigma = 0.001      % Ruido. Valor original 0.01

% Inicialización de vectores
sr = zeros(1, N);
h_s = zeros(1, N); %inicializa el filtro "h sombrero" con tamaño L y valor todos ceros
h_s((N-1)/2) = 4; %coloca el impulso en la posición 15
x_s = zeros(1, L); %inicializa la señal de salida "x sombrero" con tamaño L y valor todos ceros
d = zeros(1, L); %inicializa la señal de referencia con tamaño L y valor todos ceros
e = zeros(1, L); %inicializa la señal de error con tamaño L y valor todos ceros

% Generación de símbolos aleatorios
x = (rand(1,L) > 0.5)*2 - 1; %crea un vector aleatorio de L elementos. Pregunta si cada elemento es mayor a 0.5, de esa comparación devuelve valores 0 o 1, luego multiplica por 2. Finalmente resta 1 a cada elemento

% Canal
h = [1 0.7 0.6 0.35 0.1 0.05 0.01]; %respuesta al impulso del canal de transmisión

% Filtrado de los símbolos por el canal
y = filter(h, 1, x); %se aplica la acción del canal "h" a la señal de interés "x"

yo = y + randn(1, L)*sigma; %a lo anterior se le suma la acción de "ruido"

% Gráfica de respuesta en frecuencia del canal y el ecualizador
NFFT = 128; %resolución de la FFT
CH = fft(h, NFFT); %se pasa la respuesta del canal al dominio de la frecuencia
FC = fft(h_s, NFFT); %se pasa la respuesta de "h sombrero" que es un pasa todo al dominio de la frecuencia
subplot(2, 1, 1)
grid on
h1 = plot((0 : NFFT/2 - 1)/NFFT*pi, 20*log10(abs(FC(1 : NFFT/2))));
set(h1, 'linewidth', 2)
hold all
h = plot((0 : NFFT/2 - 1)/NFFT*pi, 20*log10(abs(CH(1 : NFFT/2))));
set(h, 'linewidth', 2)
xlabel('Frecuencia Normalizada','FontSize',20)
ylabel('Magnitud [dB]','FontSize',20)
h = legend('Respuesta del filtro adaptivo','Respuesta del canal')
set(h,'Fontsize',15)
grid on
axis tight
ylim([-10, 30])
% Gráfica de los símbolos recibidos
subplot(2, 1, 2)
h2 = plot(yo(1 : 500), '.');
axis tight
grid on
ylim([-3, 3])
xlim([0, 499])
xlabel('Muestras','FontSize',20)
ylabel('Símbolos','FontSize',20)


%Bucle de procesamiento del receptor
for n = 1 : L %L = 1e5;
	
	% Registro de desplazamiento
	sr = [yo(n) sr(1 : end-1)]; %concatena el valor actual de la señal de entrada al receptor "yo", con los valores anteriores almacenados en el registro de desplazamiento
	
	% Insertar filtrado de muestras con h_s (^h o h sombrero) para obtener x_s[n] (^x o x sombrero)
	% ->
	
	x_s(n) = sr * h_s';
	
	% <-
	
	
	% Señal de referencia obtenida a partir de x_s 
	d(n) = (x_s(n) > 0)*2 - 1; %se genera la señal de referencia "d"
	
	% Señal de error
	e(n) = x_s(n) - d(n); %se determina la señal de error
	
	% Insertar adaptacion de coeficientes para obtener los coeficientes actualizados de h_s
	% ->
		
	h_s = h_s - mu*e(n)*sr;	
	
	% <-
	
	
	
	% Actualización de gráficos
	if (mod(n, 1000) == 0)
		
		subplot(2, 1, 1);
		grid on
		FC = fft(h_s, NFFT);
		delete(h1);
		h1 = plot((0 : NFFT/2-1)/NFFT*pi, 20*log10(abs(FC(1 : NFFT/2))),'b');
		set(h1,'linewidth',2);
		subplot(2, 1, 2);
		grid on
		ylim([-3, 3])
		h2 = plot(x_s(n-499 : n),'.');
		drawnow
		
	end
end


xo= round(x_s);
if( x-xo == 0)
    disp('La traduccion fue exitosa!!!');
else
    disp('La traduccion fue erronea');
end



