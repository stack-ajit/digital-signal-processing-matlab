function y = linear_convolution(x1, x2)
    % Length of input sequences
    L1 = length(x1);
    L2 = length(x2);
    
    % Length of output sequence
    Ly = L1 + L2 - 1;
    
    % Pad the sequences with zeros to match lengths for convolution
    x1_padded = [x1, zeros(1, Ly - L1)];
    x2_padded = [x2, zeros(1, Ly - L2)];
    
    % Initialize output sequence
    y = zeros(1, Ly);
    
    % Perform linear convolution without using built-in function
    for n = 1:Ly
        for k = 1:L1
            if n-k+1 > 0 && n-k+1 <= L2
                y(n) = y(n) + x1_padded(k) * x2_padded(n-k+1);
            end
        end
    end
end
