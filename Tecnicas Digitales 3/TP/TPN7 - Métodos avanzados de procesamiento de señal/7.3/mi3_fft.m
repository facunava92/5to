function y = mi_fft(x)
%esta funcion implementa la FFT de un vector de tamaño N, siendo N potencia de base 2


N = length(x); %determino el tamaño del vector de entrada
k = [0 : N/2-1]; %el indice de muestras k va de 0 a (N-1), pero calculo sola la mitad ya que la otra mitad va con signo cambiado
fac_giro = exp(-1i*2*pi*k/N); %desarrollo los factores de giro segun la cantidad N, solo N/2 elementos para los factores

y = bitrevorder(x); %aplico la revercion de bits y obtengo el vector acomodado en "pares" e "impares"

for step = 2.^(0 : log2(N/2))
	for n = 0 : step-1
		for m = 1 : step*2 : N-n
			[y(m+n), y(m+n+step)] = mi_butterfly(y(m+n), y(m+n+step), fac_giro(n*(N/2)/step+1));
		end
	end
end

end
