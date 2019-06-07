% Ejercicio 1. Crear un programa que realice la convolución entre una señal
% ?x de ?longitud ?M ?y un kernel ?h ?de longitud ?N ?mediante un bucle ?for? y 
% operando muestra a muestra, de acuerdo a la ecuación de la convolución.

clear all
clc
close all

M=5;
N=3;

x = zeros(1, M)         %Vector de entrada
h = zeros(1, N)         %Vector kernel, taps del FIR, o rta al impuslo unit del filtro
y = zeros(1, M+N-1)     %La salida y siempre tendra nº "muestras de entrada + nº de elementos del kernel - 1" elementos

r = zeros(1,N);           %Registro de desplazamiento

x = [3,2,-2,1,2];       %Cargo con valores de prueba (ejemplo de guia)
h = [1,2,1];            %Cargo con valores de prueba (ejemplo de guia)
X = [x, zeros(1, N-1)]  %Concateno N-1 columnas para que al menos uno de los 2 
                        %factores de la convolucion (h o x)  tenga el mismo nº de elementos de la salida

for n=1:(M+N-1)         %Convolucion
    j=n;
    for i=1: N          %Producto de muestras de convolucion           
       if(j>0)         %Actualizacion del registro de desplazamiento, se realiza una verificacion de que no se procesen instantes 
                        %o numeros de muestras negativos
          r(i)=X(j);   
          j=j-1;        
       end
        y(n)=h(i)*r(i)+ y(n)
    end
end


subplot(3,1,1); stem(x); title('Vector de entrada');
subplot(3,1,2); stem(h); title('Vector kernel');
subplot(3,1,3); stem(y); title('Vector salida')

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

% Ejercicio 2. Generar una nueva secuencia? x ?, de longitud ?M=7 ?, mediante 
% la función ?randn?. Calcular la convolución con la secuencia h anterior y 
% graficarla mediante el siguiente comando

clear all
clc
close all

N=3;
x=randn(1,7);          %Vector entrada con 7 muestras aleatorias
h=zeros(1, N);          
h = [1,2,1];           
X=[x, zeros(1, N-1)]; 
r = zeros(N); 
y = zeros(1, 7+N-1);

for n=1:(7+N-1)        
    j=n;
    for i=1: N      
        if(j~=0)        
             r(i)=X(j);  
             j=j-1;
        end;
    y(n)=h(i)*r(i)+ y(n);
    end
end

z = conv(x, h);

subplot(3,1,1); plot(y, '-o'); title('Convolución con algoritmo');
subplot(3,1,2); plot(z, '-x'); title('Convolución con función');
subplot(3,1,3); hold all;  plot(y, '-o');  plot(z, '-x'); title('Comprobación')

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;


% Reemplazar el bucle ?for ?interno por una multiplicación matricial de una 
% matriz de 1 fila x? N ? columnas con otra matriz de ?N ? filas y 1 columna.
% Usar el operador de transposición para transponer el segundo elemento 
% del producto.  Generar dos vectores aleatorios de 10000 (diez mil) muestras 
% cada uno. En el código de la convolución, poner en la primer línea la 
% función ?tic?, y en la última la función ?toc?. Esto al correr nos  dará una  
% estimación del tiempo de procesamiento. Convolucionar ambos vectores y 
% registrar el tiempo como comentario. Repetir los pasos para la versión de
% la convolución con el bucle ?for?, correr con los mismos vectores y registrar 
% el tiempo como comentario. 

clear all
clc
close all

N=10000;
p=randn(1,N);
l=randn(1,N);
L=[l, zeros(1, N-1)];
r=zeros(1,N);
z=zeros(1, N+N-1);
y=zeros(1, N+N-1);
k=1;
j=1;

tic
for n=1 : (N+N-1) %Convolucion con producto matricial 
    k=1;
    j=n;
  while(k<=N)
    if(j~=0)
        r(k)=L(j);
       j=j-1;
    end;
    k=k+1;
    end; 
    y(n)=p*r';
    end
t1= toc;    %0.993857 [s]

r=zeros(1,N);
tic
for n=1: (N+N-1)   %Convolucion con producto mediante bucle for     
    j=n;
    for i=1: N
    if(j~=0)
       r(i)=L(j);
       j=j-1;
   end;
   z(n)=p(i)*r(i)+ z(n);
   end
end
t2= toc     %1.550949 [s]

tic         %Convolucion mediante funcion de Matlab
a=conv(p,l);
t3=toc;     %0.011890 [s]        

T1=sprintf('Convolucion con producto matricial : %f [s]' , t1);
T2=sprintf('Convolucion con producto mediante bucle for : %f [s]' , t2);
T3=sprintf('Convolucion mediante funcion de Matlab : %f [s]' , t3);
disp(T1)
disp(T2)
disp(T3)
