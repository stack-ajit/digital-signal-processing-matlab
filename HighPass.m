Wn = 300/500;                   % Normalized cutoff frequency
[z,p,k] = butter(9,Wn,'high');  % Butterworth filter
[sos] = zp2sos(z,p,k);          % Convert to SOS form
h = fvtool(sos);