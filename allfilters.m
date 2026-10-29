% Define design parameters
wc1 = 0.5;
wc2 = 0.7;
rp = 3;   % Passband ripple
rs = 40;  % Stopband attenuation

% Calculate the minimum order of filters
[n_wc1, Wn1_butter] = buttord(wc1, wc2, rp, rs);
[n_wc1_cheby1, Wn1_cheby1] = cheb1ord(wc1, wc2, rp, rs);
[n_wc2_cheby2, Wn2_cheby2] = cheb2ord(wc1, wc2, rp, rs);
[n_wc1_ellip, Wn1_ellip] = ellipord(wc1, wc2, rp, rs);

% Design Butterworth filter
[b1, a1] = butter(n_wc1, Wn1_butter, 'high');
[H1, W1] = freqz(b1, a1);

% Design Chebyshev Type I filter
[b2, a2] = cheby1(n_wc1_cheby1, rp, Wn1_cheby1, 'high');
[H2, W2] = freqz(b2, a2);

% Design Chebyshev Type II filter
% Define stopband frequencies properly
Wn_stop = [wc1 wc2];
[b3, a3] = cheby2(n_wc2_cheby2, rs, Wn_stop, 'stop');
[H3, W3] = freqz(b3, a3);

% Design Elliptic filter
[b4, a4] = ellip(n_wc1_ellip, rp, rs, Wn1_ellip, 'high');
[H4, W4] = freqz(b4, a4);

% Plot frequency response for all filters
figure;

% Butterworth Filter
subplot(2,2,1);
plot(W1/pi, 20*log10(abs(H1)));
title('Butterworth Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

% Chebyshev Type I Filter
subplot(2,2,2);
plot(W2/pi, 20*log10(abs(H2)));
title('Chebyshev Type I Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

% Chebyshev Type II Filter
subplot(2,2,3);
plot(W3/pi, 20*log10(abs(H3)));
title('Chebyshev Type II Band Stop Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

% Elliptic Filter
subplot(2,2,4);
plot(W4/pi, 20*log10(abs(H4)));
title('Elliptic Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

% Adjust layout to prevent label overlap
sgtitle('Filter Frequency Responses');
