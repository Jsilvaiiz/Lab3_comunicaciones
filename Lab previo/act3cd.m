Fs = 100;        
t = 0:1/Fs:0.1;
f0 = 100;              

% onda cuadrada como m(t)
m = square(2*pi*f0*t);   % Onda cuadrada ±1

% FFT
N = length(m);
M_f = fft(m);            % FFT sin centrar
f = (0:N-1)*(Fs/N);      % Vector de frecuencias

% Centrar la FFT en 0 Hz
M_f_shifted = fftshift(M_f);             % Centrado
f_shifted = (-N/2:N/2-1)*(Fs/N);         % Eje de frecuencia centrado

% Obtener magnitud
M_mag = abs(M_f_shifted);
M_mag = M_mag / max(M_mag);              % Normalizar

% Graficar
figure;
plot(f_shifted, M_mag, 'LineWidth', 1.5);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud Normalizada');
title('Transformada de Fourier con fft()');
grid on;
xlim([-500, 500]);                       % Zoom en el espectro

