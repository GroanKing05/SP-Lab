% Roll No. 2023112005, Name: Varun Ram Murty Shastry

% Given
AmpMsg = 2;      % Amplitude of message signal
AmpCarrier = 1;      % Amplitude of carrier signal
FreqMessage = 10;     % Frequency of message signal
FreqCarrier = 100;    % Frequency of carrier signal
Samples = 2000;
SamplingTime = 1 / (10 * FreqCarrier); % Sampling time

% Time Vector
t = 0:0.001:1;  % Time Vector from 0 to 1 second with a Sampling interval of 0.001 seconds

% Message signal m(t)
message = AmpMsg * sin(2*pi*FreqMessage*t);

% Carrier signal c(t)
carrier = AmpCarrier * cos(2*pi*FreqCarrier*t);

% Modulated signal x(t)
modulated_x = message .* carrier;

% Plotting
figure;

% Plot the message signal m(t)
subplot(3, 1, 1);
plot(t, message);
title('Message Signal m(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the carrier signal c(t)
subplot(3, 1, 2);
plot(t, carrier);
title('Carrier Signal c(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the modulated signal x(t)
subplot(3, 1, 3);
plot(t, modulated_x);
title('Modulated Signal x(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Calculate and plot the magnitude Spectrum for Fourier transform
figure;

% Message signal spectrum
subplot(3, 1, 1);
fft_message = fftshift(fft(message));
f_message = linspace(-500, 500, length(fft_message));
plot(f_message, abs(fft_message));
title('Magnitude spectrum of Message Signal m(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Carrier signal spectrum
subplot(3, 1, 2);
fft_carrier = fftshift(fft(carrier));
f_carrier = linspace(-500, 500, length(fft_carrier));
plot(f_carrier, abs(fft_carrier));
title('Magnitude spectrum of Carrier Signal c(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Modulated signal spectrum
subplot(3, 1, 3);
fft_modulated_x = fftshift(fft(modulated_x));
f_modulated_x = linspace(-500, 500, length(fft_modulated_x));
plot(f_modulated_x, abs(fft_modulated_x));
title('Magnitude spectrum of Modulated Signal x(t)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Observation:
% We observe that the modulated signal x(t) has spectral components at
% the sum and difference frequencies of the carrier and message signals.
