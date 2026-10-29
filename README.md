# Digital Signal Processing (DSP) & Filter Design Suite

[![MATLAB](https://img.shields.io/badge/MATLAB-R2024b-red)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A comprehensive MATLAB suite implementing foundational Digital Signal Processing algorithms, discrete filter synthesis (FIR/IIR), spectral decomposition (DFT/FFT), circular and linear convolution, and z-transform stability analysis.

Developed by **Ajit Kumar** (Undergraduate, Electrical & Electronics Engineering, **BIT Mesra**).

---

## Algorithms & Scripts Included

| Script | Domain | Description |
| :--- | :--- | :--- |
| ir.m | Filter Design | Finite Impulse Response (FIR) filter design using windowing techniques |
| lowpasss.m | Filter Design | Ideal and Butterworth digital low-pass filter synthesis |
| HighPass.m | Filter Design | High-pass frequency-selective digital filtering |
| andpass.m | Filter Design | Band-pass filter realization and frequency response analysis |
| llfilters.m | Filter Design | Comparative evaluation of low-pass, high-pass, and band-pass filters |
| FFTrans.m / myFFT.m | Spectral Analysis | Fast Fourier Transform (FFT) and frequency domain magnitude/phase spectrum |
| DFTrans.m | Discrete Transforms | Discrete Fourier Transform (DFT) mathematical formulation from scratch |
| ztransform.m | System Stability | Z-domain transfer function analysis and pole-zero stability mapping |
| linearconv.m | Convolution | Discrete-time linear convolution of finite-length signals |
| circonv.m | Convolution | Circular convolution and equivalence verification with DFT multiplication |

---

## Usage

Open MATLAB and run any of the standalone scripts:
`matlab
% Example: Run FIR filter design
run('fir.m')

% Example: Compute FFT spectrum
run('FFTrans.m')
`
