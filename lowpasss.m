% Define design parameters
wc = 0.5; % Cutoff frequency

% Calculate the orders of the filters
n1 = 1; % First-order
n2 = 2; % Second-order
n3 = 3; % Third-order

% Design Butterworth low-pass filters
[b1, a1] = butter(n1, wc, 'low');
[b2, a2] = butter(n2, wc, 'low');
[b3, a3] = butter(n3, wc, 'low');

% Frequency response
[H1, W1] = freqz(b1, a1);
[H2, W2] = freqz(b2, a2);
[H3, W3] = freqz(b3, a3);

% Plot frequency response for Butterworth low-pass filters
figure;
plot(W1/pi, 20*log10(abs(H1)), 'b', 'LineWidth', 2);
hold on;
plot(W2/pi, 20*log10(abs(H2)), 'r', 'LineWidth', 2);
plot(W3/pi, 20*log10(abs(H3)), 'g', 'LineWidth', 2);

% Add legend and labels
legend('First-order', 'Second-order', 'Third-order');
title('Frequency Response of Butterworth Low-Pass Filters');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;