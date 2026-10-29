% Parameters
N = 31; % Filter order (odd number for symmetry)
fc = 0.2; % Cutoff frequency
fs = 1; % Sampling frequency

% Create Hamming window
hamming_window = hamming(N);

% Create ideal low-pass filter
n = -(N-1)/2:(N-1)/2;
h_ideal = 2 * fc * sinc(2 * fc * n);

% Apply Hamming window to the ideal filter
h_hamming = h_ideal .* hamming_window';

% Frequency response of the filter
fvtool(h_hamming, 1, 'Fs', fs, 'Color', 'White');

% Display impulse response of the filter
figure;
stem(h_hamming);
xlabel('Sample');
ylabel('Amplitude');
title('Impulse Response of FIR Filter using Hamming Window');
