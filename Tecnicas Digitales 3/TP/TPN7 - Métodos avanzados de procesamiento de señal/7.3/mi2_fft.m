function y = mi2_fft(x)

    N= length(x); 
	x = bitrevorder(x); %aplico la revercion de bits y obtengo el vector acomodado en "pares" e "impares"
    stages = log2(N);

    for j = 1:stages
        step = 2^(j-1);
        twf = exp(-pi*1i/step).^(0:step-1);
        for k = 1:2^(stages-j)
              s 	= 2*(k-1)*step+1;   		%start-index
              e 	= 2*k*step;             	%end-index
              r 	= s + (e-s+1)/2;  			%middle-index
              y0 	= x(s:r-1);
              y1 	= x(r:e);
              z 	= twf .* y1;
              y 	= [y0 + z, y0 - z]; 	%butterfly
			  x(s:e) = y;					
        end
    end