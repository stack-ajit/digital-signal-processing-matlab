function X = myFFT(x)
    % Compute FFT of input sequence x
    N = length(x);
    
    % Base case for recursion
    if N == 1
        X = x;
    else
        % Split the sequence into even and odd parts
        x_even = x(1:2:N);
        x_odd = x(2:2:N);
        
        % Recursively compute FFT for even and odd parts
        X_even = myFFT(x_even);
        X_odd = myFFT(x_odd);
        
        % Combine the results
        factor = exp(-2i * pi * (0:N/2-1) / N);
        X = [X_even + factor .* X_odd, X_even - factor .* X_odd];
    end
end
