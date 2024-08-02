% Roll Number 2023112005 Name: Varun Ram Murty Shastry
t = -1:1/100:1; % define time
SampleFreq = 50;

% Define the original signal x(t) = sin(pi*t)
original_signal = sin(pi * t) / (2 * pi);
original_signal_FT = fftshift(fft(original_signal));

% 1st Signal e^(j2*pi*fc*t) * x(t) where fc = 10 Hz
fc = 10;
modulated_signal_1 = exp(1j * 2 * pi * fc * t) .* original_signal;
modulated_signal_1_FT = fftshift(fft(modulated_signal_1));

% 2nd Signal x(t/A) where A = 20
A = 20;
scaled_signal = sin(pi * t / A) / (2 * pi);
scaled_signal_FT = fftshift(fft(scaled_signal));

% 3rd Signal x(t)^2
squared_signal = original_signal.^2;
squared_signal_FT = fftshift(fft(squared_signal));

% Frequency vector
frequencies = (-SampleFreq/2:SampleFreq/length(original_signal_FT):SampleFreq/2-SampleFreq/length(original_signal_FT));

% Plot the magnitude spectra
figure;

subplot(2, 2, 1);
plot(frequencies, abs(original_signal_FT));
title('FFT of x(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2, 2, 2);
plot(frequencies, abs(modulated_signal_1_FT));
title('FFT of e^{j2\pi f_c t} x(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2, 2, 3);
plot(frequencies, abs(scaled_signal_FT));
title('FT of x(t/A)');
xlabel('Freq (Hz)');
ylabel('Magnitude');

subplot(2, 2, 4);
plot(frequencies, abs(squared_signal_FT));
title('FFT of x(t)^2');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
