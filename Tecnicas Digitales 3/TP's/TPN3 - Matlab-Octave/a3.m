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

Gx=conv2(hx, Prom);
Gy=conv2(hy, Prom);

Gx_d=double(Gx); 
Gy_d=double(Gy); 

subplot(2,2,1); imshow(Gx); title('Gx');
subplot(2,2,2); imshow(Gy); title('Gy');

G=sqrt(((Gx_d).^2)+((Gy_d).^2));  

subplot(2,2,3); imshow(uint8(G)); title('G=|G(Gx,Gy)|');