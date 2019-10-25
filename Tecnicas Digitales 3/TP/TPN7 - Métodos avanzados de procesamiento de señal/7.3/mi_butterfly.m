function [y0, y1] = mi_butterfly(x0, x1, f_giro)
%esta funcion implementa el bloque de cálculo Butterfly para la FFT

y0 = x0 + (x1 * f_giro);
y1 = x0 - (x1 * f_giro);

end
