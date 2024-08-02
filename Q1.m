% Name : Varun Ram Murty Shastry
% Roll No: 2023112005

% Parameters needed
fs = 10000;         % Sampling frequency 
T = 1;              % Time duration 
t = 0:1/fs:T-1/fs;  % Defining a time vector from 0 to T-1/fs with a step of 1/fs (Sampling Period)

%----------Q1 (a) MESSAGE SIGNAL Code STARTS HERE (plot code below)--------------%
% Message signal m(t)
m_t = sin(2*pi*100*t) + sin(2*pi*200*t);

% Fourier transform of the message signal
M_f = fft(m_t); 
M_f_mag = abs(fftshift(M_f)); % Magnitude spectrum, fftshift re-centres the FFT
f = linspace(-fs/2, fs/2, length(t));    % Creating a frequency vector f ranging from -fs/2 to fs/2, with the same length as the time vector t
%----------Q1 (a) Code ENDS HERE--------------%

%----------Q1 (b) CARRIER SIGNAL Code STARTS HERE (plot code below)--------------%
% Carrier signal c(t)
c_t = cos(2*pi*1000*t);

% Fourier transform of the carrier signal
C_f = fft(c_t);
C_f_mag = abs(fftshift(C_f)); % Magnitude spectrum
%----------Q1 (b) Code ENDS HERE--------------%


% ---------- Q1(c) AM Modulation --------------
mu = 0.5;  % Modulation index
s_t = (1 + mu*m_t) .* c_t;  % AM modulated signal
S_f = fft(s_t);
S_f_mag = abs(fftshift(S_f)) / length(s_t);

% ---------- Q1(d) DSB-SC Modulation --------------
sdsb_sc_t = m_t .* c_t;  % DSB-SC modulated signal
SDSB_SC_f = fft(sdsb_sc_t);
SDSB_SC_f_mag = abs(fftshift(SDSB_SC_f)) / length(sdsb_sc_t);

% ---------- Plotting --------------%
figure; 

% Plots for Q.1 (a) and (b)
subplot(2,2,1); % Message signal m(t)
plot(t, m_t); % t is the x-axis, m(t) is the y-axis
title('Message Signal m(t)');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-2.5, 2.5]);  % To Adjust vertical scaling for better view
xlim([0, 0.1]);    % To Adjust the x-axis scaling for better view

subplot(2,2,2); % FFT of m(t)
plot(f, M_f_mag);
title('Magnitude Spectrum of Message Signal [$\tilde{M}(f)$]','Interpreter','latex'); 
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-300, 300]); 

subplot(2,2,3); % Carrier Signal (t)
plot(t, c_t);
title('Carrier Signal c(t)');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-1.5, 1.5])
xlim([0, 0.02]);   

subplot(2,2,4); % FFT of c(t)
plot(f, C_f_mag);
title('Magnitude Spectrum of Carrier Signal [$\tilde{C}(f)$]','Interpreter','latex');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot 2: Q1.(c) & (d):
figure; 

subplot(2,2,1); 
plot(t, s_t); 
title('AM Modulated Signal [s(t)]');
ylim([-3, 3]);
xlim([0, 0.02]);
xlabel('Time (s)'); 
ylabel('Amplitude'); 

subplot(2,2,2);
plot(f, S_f_mag);
title('Magnitude Spectrum of AM Signal [$\tilde{S}(f)$]','Interpreter','latex');
xlim([-2000, 2000]); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 

subplot(2,2,3);
plot(t, sdsb_sc_t);
title('DSB-SC Modulated Signal [$s_{dsb-sc}(t)$]','Interpreter','latex'); 
ylim([-2, 2]); 
xlim([0, 0.02]);
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,2,4);
plot(f, SDSB_SC_f_mag);
title('Magnitude Spectrum of DSB-SC Modulated Signal [$\tilde{S}_{dsb-sc}(f)$]','Interpreter','latex'); 
xlim([-2000, 2000]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% ---------- Q1(e) Observations and Preference between AM and DSB-SC --------------

% The key differences between AM and DSB-SC Modulations are as follows:

% AM: The carrier signal is present in the modulated signal and its amplitude varies with the message signal. 
% The equation of Amplitude Modulated wave will be
% s(t)=[A_c+A_m*cos(2πf_mt)]cos(2πf_ct), where terms with subscript c correspond to the carrier, and those with subscript m correspond to the message.

% DSB-SC: The carrier wave is suppressed, leaving only the sidebands that contain the actual information.
% The DSB-SC modulated signal has the equation, A_c*m(t) (cos(2πf_c)t).

% Talking about the Spectrum,

% In AM Modulation, the spectrum includes a strong carrier component at the
% carrier frequency (i.e. at 1kHz as can be seen from the plots too).
% Information-carrying sidebands are present on either side of the carrier, mirroring each other.

% In DSB-SC Modulation, No carrier component is present. (No component at
% 1KHz as seen in the plot too).
% The sidebands are identical to those in AM but are centered around where the carrier would have been.

% Now, about Bandwidth,

% AM: The bandwidth is twice the maximum frequency in the message signal. The sidebands mirror each other, essentially carrying redundant information.
% DSB-SC: The bandwidth is the same as AM (max frequency component is at 1.2KHz in both), but since the carrier is absent, it utilizes the spectrum more efficiently.

% With respect to Demodulation,

% AM: Can be demodulated with a simple envelope detector.
% DSB-SC: Requires a coherent detector, which synchronizes a locally generated carrier with the original one. This results in a more complex receiver.

% What Modulation Technique to use, depends on various factors, some of
% which are listed below.

% Choices can be classified w.r.t the following cases:

% Simplicity: Where receiver complexity needs to be minimal, like in inexpensive radios.
% Limited Bandwidth: If spectral efficiency is a priority, DSB-SC is better due to the absence of a carrier.
% Power Efficiency: When maximizing the use of transmitter power is important, DSB-SC's power concentration in the sidebands is better.

% Some more considerations are like, noise wherein AM may be slightly more noise-tolerant due to the redundant sidebands.

% In Summary, Trade-offs like Receiver complexity (AM is simpler),
% Bandwidth limitations (DSB-SC is more efficient) and Power efficiency
% (DSB-SC is superior), and several other unlisted factors influence the
% choice between DSB-SC and AM Modulation for modulating our message
% signals to pass through the communication channel

%-------------------------END--------------------------------------------------%
