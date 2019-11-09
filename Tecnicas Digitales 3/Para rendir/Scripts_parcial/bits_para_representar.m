%%
%Cuantos bits necesito para representar el numero 0.875 sin perdida 
%por truncado/redondeo? (El numero es con signo)
%%

num = 0.875;
i=0;
while num ~= 0
    x = rem(2*num,1);
    num = x;
    i=i+1;
end

disp(['Numero de bits: ' num2str(i+1)]);  %+1b de signo!!!!

