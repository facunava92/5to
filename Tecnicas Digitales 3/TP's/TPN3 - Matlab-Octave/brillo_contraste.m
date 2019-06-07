function Q = brillo_contraste(I, B, C)
I_d=double(I);
I_gris=(I_d(:,:,1)+I_d(:,:,2)+I_d(:,:,3))./3;
M=max(I_gris(:));
m=min(I_gris(:));
I_d=128 .*(((((I_d-m)./(M-m))).*(C+1))+1-C);
I_d=I_d+(255 *((2*B)-1));
I_i = uint8(I_d);
Q = I_i;
end