# Frequency-Domain-Adaptive-Noise-Cancellation
## Adpative Filter
A filter which has the flexibility to adjust its governing parameters and has design requirements that do not rely on a-priory knowledge of the noise or the signal characteristics is called an adaptive filter. 
The most common algorithm on which this filter is constructed is known as the Widrow-Hoff Least-Mean-Square (LMS) Algorithm.

##Working
Adaptive noise cancellation involves a configuration with two sensors (microphones) shown below.
The primary microphone picks up speech and background noise from a certain noise source. 
A signal from the noise source is acquired and it is processed by an FIR filter to produce w'(n) which will then be subtracted from the primary microphone signal (s(n)+w(n)). 
If w'(n) is equal to w(n) then the noise reduction is perfect and the output of this configuration will be clean speech. 
Because of room acoustics, w(n) can not be cancelled perfectly, i.e., w'(n) approximates w(n). 
The FIR filter, B(z), is needed to model the reflections and delays in the acoustic path between the noise source and the primary microphone. The acoustic path is usually time varying because of movement in the room etc., and it needs to be continuously estimated. Therefore, an adaptive FIR filter, B(z), is required. The coefficients of B(z) can be estimated using a time or a frequency-domain adaptive algorithm.
Because adaptive noise cancellation requires high-order FIR filters, the FFT is used to perform fast convolution. 
In addition the entire adaptive filtering algorithm operates in the frequency domain with FFTs.
A simulation of this system in MATLAB is shown in the file Adaptive_Noise_Cancellation.m.

##Evaluation
The ANC is evaluated using objective and subjective performance measures. Signal to Noise Ratios (SNRs) are used for an objective measure.
To evaluate the improvement after noise cancellation in dB, the SNR before the adaptive noise canceller is used, is subtracted from the the SNR after the adaptive noise canceller is used.
The step size mu controls the speed of adaptation of the adaptive algorithm. 
Large mu implies quick adaptation small mu implies slow adaptation. Different values of mu are experimented with and the best value is chosen. The entire experiment is performed for both random noise and background music. Error convergence curves are plotted to show you how fast the algorithm converges.

The results are shown in the report.


