% Ejercicio 1. Crear un programa que permita convolucionar dos matrices 
% entre sí. Utilice un bucle ?for? para recorrer las filas, otro bucle ?for?
% para recorrer las columnas y el operador? .*? para multiplicar elemento a 
% elemento. Luego utilice la función ?sum para sumar los productos y generar 
% la salida. Pruebe el funcionamiento con las matrices de ejemplo

clear all;
close all;
clc;
F=4;                %Filas de x
C=4;                %Columnas de x
M=2;                %Filas de h
N=2;                %Columnas de h
x=[1,1,1,1;1,-2,-1,0;1,0,0,0;1,-1,-1,2];
h=[-1, 1; 1, -2];
y=zeros(F+M-1, C+N-1);
A=zeros((2*N+F-2), (2*M+C-2));
t=zeros(M, N);

for j=1 : N
h(1:1:M,j)= h(end:-1:1, j);
end;
for i=1 : M
h(i,1:1:N)= h(i, end:-1:1);
end;

for i=1 : F
    for j=1 : C
       A(i+1, j+1)= x(i,j);
    end;
end;

for i=1 : length(y)
    for j=1 : length(y)
        t=A(i:i+1, j:j+1);
        y(i,j)=sum(sum(h.*t)); %la funcion sum() devuelve la suma de todos
    end;                       %los elementos de un vector. En caso de ser 
end;                           %una matriz, devuelve un vector con la suma  
                               %de los elemento de cada columna
                               
disp(x);    
disp(y);

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

% Ejercicio 2. Genere una nueva matriz ?h ?aleatoria con números aleatorios entre 0 y 5 
% mediante la función ?rand ?y la función de redondeo ?floor?. Convolucione
% con la matriz ?x ? del ejemplo y compare la salida con el resultado de la
% misma operación realizada con la función ?conv2?.

clear all;
close all;
clc;
F=4;                             %Filas de x
C=4;                             %Columnas de x
M=2;                             %Filas de h
N=2;                             %Columnas de h
x=[1,1,1,1;1,-2,-1,0;1,0,0,0;1,-1,-1,2];
h=floor(rand(M,N)*5);            %Generacion de matriz con elementos 
                                 %aleatorios entre 1 y 5

y=zeros(F+M-1, C+N-1);
z=zeros(F+M-1, C+N-1);
A=zeros((2*N+F-2), (2*M+C-2));
t=zeros(M, N);

for j=1 : N                      %Inversion de filas
hi(1:1:M,j)= h(end:-1:1, j);
end;    
for i=1 : M                      %Inversion de columnas
hi(i,1:1:N)= hi(i, end:-1:1);
end;

for i=1 : F                      %Matriz ampliada A con matriz x en el centro
    for j=1 : C
       A(i+1, j+1)= x(i,j);
    end;
end;

for i=1 : length(y)              %Convolucion en 2D
    for j=1 : length(y)
        t=A(i:i+1, j:j+1);
        y(i,j)=sum(sum(hi.*t));
    end;
end;

z=conv2(h, x);                   %Funcion de convolucion en 2D, z e y deben
                                 %ser iguales para verificar
disp(z);    
disp(y);  

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

% Ejercicio 3 Convolucione la imagen en escala de grises del ejercicio 1.4,
% con la siguiente matriz
% h [n,m] = [1,-1 ; 0, 0]

clc                           
h=[1, -1; 0, 0];
M=imread('lena.tiff');
M_d=double(M); 
Prom=(M_d(:,:,1)+M_d(:,:,2)+M_d(:,:,3))./3; %Conversion a gris = promedio
                                             % de los 3 colores
M_i=uint8(Prom);                             %Conversion a integer para bits

subplot(1,2,1); imshow(M_i); title('Imagen Original');
subplot(1,2,2); imshow(conv2(h, M_i)); title('Imagen Convolucionada');
%La convolucion produjo que se transformen los grises
%Convirtiendo los claros en blanco y los oscuros en negro

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

% Ejercicio 4 Convolucione la imagen en escala de grises del ejercicio 1.4,
% con la siguiente matriz
% h [n,m] = [1,0 ; -1, 0]

close all              
clear all              
clc                           
h=[1, 0; -1, 0];
M=imread('lena.tiff');
M_d=double(M); 
Prom=(M_d(:,:,1)+M_d(:,:,2)+M_d(:,:,3))./3; %Conversion a gris = promedio
                                             % de los 3 colores
M_i=uint8(Prom);                             %Conversion a integer para bits

subplot(1,2,1); imshow(M_i); title('Imagen Original');
subplot(1,2,2); imshow(conv2(h, M_i)); title('Imagen Convolucionada');

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

%La convolucion produjo que se pierdan o filtren los grises
%Convirtiendo los claros en negro y los oscuros en blanco

%Ejercicio 5. Combine ambas imágenes mediante la expresión:  
%       G = sqrt( (G_x)^2 + (G_y)^2 )
% Aplique un umbral al resultado, de manera que los píxeles que sean 
% mayores al umbral tengan el valor blanco (255) y de ser menores el valor 
% negro (0). Ajuste el umbral a criterio propio.

close all              
clear all              
clc       

hx=[1, -1; 0, 0];
hy=[1, 0; -1, 0];

M=imread('lena.tiff');
M_d=double(M); 
Prom=(M_d(:,:,1)+M_d(:,:,2)+M_d(:,:,3))./3;                                             
M_i=uint8(Prom);

Gx=conv2(hx, M_i);
Gy=conv2(hy, M_i);

Gx_d=double(Gx); 
Gy_d=double(Gy); 

subplot(2,2,1); imshow(Gx); title('Gx');
subplot(2,2,2); imshow(Gy); title('Gy');

G=sqrt(((Gx_d).^2)+((Gy_d).^2));  

subplot(2,2,3); imshow(uint8(G)); title('G=|G(Gx,Gy)|');


for i=1 : length(G)                         
    for j=1 : length(G)
        if G(i,j)>= 10           %Umbral para elegir los pixeles entre blanco
            G(i,j)=256;          %(256) o negro(0)
        else
            G(i,j)=0;
        end;
    end;
end;

subplot(2,2,4); imshow(uint8(G)); title('G con umbral');

disp('Presionar una tecla para continuar!') % Press a key here.You can see the message 'Paused: Press any key' in        
                                            % the lower left corner of MATLAB window.
pause;

%Ejercicio 6. Repita los pasos desde el 4.3 al 4.5 para las siguientes matrices ?
%hx=[1, 0, -1; 2, 0, -2; 1, 0, -1];
%hy=[1, 2, 1; 0, 0, 0; -1, -2, -1];

close all              
clear all              
clc       

hx=[1, 0, -1; 2, 0, -2; 1, 0, -1];
hy=[1, 2, 1; 0, 0, 0; -1, -2, -1];

M=imread('lena.tiff');
M_d=double(M); 
Prom=(M_d(:,:,1)+M_d(:,:,2)+M_d(:,:,3))./3;                                             
M_i=uint8(Prom);

Gx=conv2(hx, M_i);
Gy=conv2(hy, M_i);

Gx_d=double(Gx); 
Gy_d=double(Gy); 
subplot(2,2,1); imshow(Gx); title('Gx');
subplot(2,2,2); imshow(Gy); title('Gy');

G=sqrt(((Gx_d).^2)+((Gy_d).^2));
subplot(2,2,3); imshow(uint8(G)); title('G=|G(Gx,Gy)|');

for i=1 : length(G)                         
    for j=1 : length(G)
        if G(i,j)>= 40          %Umbral para elegir los pixeles entre blanco
            G(i,j)=256;         %(256) o negro(0)
        else
            G(i,j)=0;
        end;
    end;
end;

subplot(2,2,4); imshow(uint8(G)); title('G con umbral');