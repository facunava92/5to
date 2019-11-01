




Fs = 39062.5                  % Sampling frequency
T = 1/Fs;                     % Sample time
L = 256;                      % Length of signal
P =T*L;
x= (0:(Fs/(L-1)):Fs);
x2=(0: P/(L-1) :P);
t = (0:L-1)*T;                % Time vector

%check if the serial port already exists
%if it does, close it, it probably means something bad happened last run

if exist('COM','var')
    disp('closing old port instance');
    fclose(COM);
    delete(COM)
    clear COM
    disp('port closed');
end

% open the serial port
port = 'COM15';
Baud_Rate = 115200;
Data_Bits = 8;
Stop_Bits = 1;

COM = serial('COM15','BaudRate',Baud_Rate,'DataBits',Data_Bits,'StopBits',Stop_Bits);
fopen(COM);     

disp('port opened');

for runtimes=1:1000      %UNCOMMENT FOR CONTINUOUS FFT

columns = 2;

fprintf(COM,'p');

%there's usually some garbage at the beginning (like the echoed p 
%character command and line  breaks); this reads lines in until we find 
%the start line
text = fscanf(COM, '%s');
while ~contains(text, 'START')
    text = fscanf(COM, '%s');
end

% read number of rows
rowstext = fscanf(COM, '%s');
pat = 'ROWS=';
split = regexp(rowstext, pat, 'split');
rows = str2double(split(2));

DATA = zeros(rows,columns);

serialpat = ['%f' ' ' '%f'];

    
%reads serial data and puts it into DATA
for j = 1:rows
    DATA(j, :) = fscanf(COM, serialpat, [columns 1]);
    %disp(COM.BytesAvailable)

end

%reads last line
last = fscanf(COM, '%s');

%plotting input signal
subplot(3, 1, 1)
plot(x2,DATA(:,2))
xlabel('Tiempo (s)')
ylabel('X(t)')
title('Señal en el tiempo')


%plotting PIC calculated FFT
subplot(3, 1, 2)
plot(x, DATA(:,1))
title('FFT Calculada desde el dsPIC')
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|')
axis([0 Fs/2 0 max(DATA(:,1))])

%calculating FFT in Matlab
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(DATA(:,2),NFFT)/L;
Y = 2*abs(Y(1:NFFT/2+1));
%Y = DATA(:,1) + DATA(:,2)*1i;

f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot Matlab's single-sided amplitude spectrum.
subplot(3, 1, 3)
plot(f,Y);
axis([0 Fs/2 0 max(Y)])
title('FFT calculada desde MATLAB')
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|')

pause(0.02)        %UNCOMMENT FOR CONTINOUS FFT

end             %UNCOMMENT FOR CONTINUOUS FFT

%closes serial port
fclose(COM);
delete(COM)
clear COM
disp('port closed');

