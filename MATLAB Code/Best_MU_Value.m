% Program to determine best mu value
% Number of Iterartions
Num_iteration = 100;
% Iteration Size
Size_iteration = 0.0002;
N = 4;
% Initializing 
SNR_After = zeros(Num_iteration,1);                                        
SNR_Before = zeros(Num_iteration,1);                                       
    for n = 1:Num_iteration
        mu = n*Size_iteration;
        [mic1,mic2,s,fs1,fs2,fs3,est,B,F,SNR_Before_ANC,SNR_After_ANC]=Adaptive_Noise_Cancellation('mic1.wav','mic2.wav','cleanspeech.wav',N,mu);
        SNR_Before(n) = SNR_Before_ANC;
        SNR_After(n) = SNR_After_ANC;
    end
    SNR_improvement = SNR_After - SNR_Before;
    Axis_MU = (1:Num_iteration).*Size_iteration;
    figure()
    plot(Axis_MU,SNR_improvement','b*');
    title('Graph of SNR Improvement vs MU for the frame size = N');
    ylabel('SNR Improvement');
    xlabel('Mu Values');