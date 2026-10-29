% Example usage:
x = input("Enter a Sequence :- ");
X = myFFT(x);

% Display the result
disp('Input sequence:');
disp(x);
disp('FFT result:');
disp(X);
figure;
stem(abs(X));
title('Magnitude of FFT Result');
xlabel('Frequency Index');
ylabel('Magnitude');
grid on;