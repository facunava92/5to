close all              %Cierra todas las figuras
clear all              %Elimina todas las variables
clc                    %Limpia la pantalla

%Ejercicio 1.  Cargar la matriz ?I ? con la imagen ?lena.tiff? .
I=imread('lena.tiff'); %Carga Matriz con mapa de bits de la imagen
[f,c,cl]=size(I);
subplot(2,4,1); imshow(I); title('Ejercicio 1')

%Ejercicio 2. Espejar la imagen horizontalmente.
H=I(1:end , end:-1:1 , 1:end);  
subplot(2,4,2); imshow(H); title('Ejercicio 2')

%Ejercicio 3. Espejar la  imagen verticalmente.
V=I(end:-1:1, 1:end , 1:end);       %Matriz con Espejado vertical
subplot(2,4,3); imshow(V); title('Ejercicio 3')

%Ejercicio 4. Obtener la imagen en escala de grises combinando los 3 
%colores
I_d=double(I);
Avg=(I_d(:,:,1)+I_d(:,:,2)+I_d(:,:,3))./3; 
I_i=uint8(Avg);                           
subplot(2,4,4); imshow(I_i); title('Ejercicio 4')

%Ejercicio 5. Extraer un rectángulo que contenga el ojo izquierdo de la 
%figura y rodearlo de un rectángulo rojo.
l_eye = I(250:280, 250:290 , :); 
l_eye(:, 1:40:41, 1)= 255;      
l_eye(:, 1:40:41, 2:3)= 0;        
l_eye(1:30:31, :, 1)= 255;
l_eye(1:30:31, :, 2:3)= 0;
subplot(2,4,5); imshow(l_eye); title('Ejercicio 5')

%Ejercicio 6. Generar y mostrar en una nueva figura la imagen con los 
%colores intercambiados, de acuerdo al siguiente mapeo
%Mapeo  G==>R
%       B==>G
%       R==>B
E(:,:,1) = I(:,:,2);
E(:,:,2) = I(:,:,3);
E(:,:,3) = I(:,:,1);
subplot(2,4,6); imshow(E); title('Ejercicio 6')

%Ejercicio 7. Crear una función que permita ajustar el brillo y el 
%contraste de la imagen 
F=brillo_contraste(I, 0.5, 0.2);
subplot(2,4,7); imshow(F); title('Ejercicio 7')

