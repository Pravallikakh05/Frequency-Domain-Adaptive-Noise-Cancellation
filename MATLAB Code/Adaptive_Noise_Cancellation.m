function [mic1,mic2,s,fs1,fs2,fs3,est,B,F,SNR_Before_ANC,SNR_After_ANC] = Adaptive_Noise_Cancellation(infile1,infile2,cleanfile,N,mu)

% Reading the audiofile using audioread function 
[mic1,fs1] = audioread(infile1);                                            % Reads mic1 which is loaded onto infile1 of sample rate fs1
[mic2,fs2] = audioread(infile2);                                            % Reads mic2 which is loaded onto infile2 of sample rate fs2
[s,fs3]=audioread(cleanfile);                                               % Reads cleanspeech which is loaded onto cleanfile of sample rate fs3

%Formula to determine the number of frames
x1=length(mic1);                                                            % Function 'Length' returns the length of Mic1
x2=length(mic2);                                                            % Function 'Length' returns the length of Mic2
x3=length(s);                                                               % Function 'Length' returns the length of Clean Speech Signal
Min=min([x1,x2,x3]);                                                        % We determine the minimum length in order to specify it to the estimated signal
F=fix(Min/N);                                                               % Length of the Audiofile divided by length of one frame (N) gives us Number of Frames

% Initializing Matrix Size
B = zeros(Min,1);                                                           % B represents Channel Filter Estimation
est = zeros(Min,1);                                                         % est represents size of estimated signal
Error_energy = zeros(F,1);                                                  % Error_energy reprsents energy of the error per sample per frame

% Applying ANC Algorithm to obtain Noise Cancelled Auido and channel Filter
% Estimation with best mu value
for f = 1:F                                                                 % Loop to find estimated signal and error_energy
    n = (1:N)+(N*(f-1));                                                    % Determining index values for a given frame
    D = fft(mic1(n));                                                       % Using fft to convert Mic1 to frequency domain, to ease computation
    X = fft(mic2(n));                                                       % Using fft to convert Mic2 to frequency domain
    % Determining Estimated Signal
    E = D-X.*B(n);                                                          % Finding Estimated Signal in Frequency Domain (through multiplication, 
                                                                            % which is convolution in Time Domain)
    est(n) = ifft(E);                                                       % Obtaining Estimated signal in Time domain using IFFT
    % Determinging channel filter using best mu value
    B(n+N) = B(n)+(2*mu*(conj(X).*E));                                      % Determining current B(n) (Channel filter) values based on previous frame values

    %Energy present in the error signal for each sample
    Error_energy(f) = (E'*E)/N;                                                     
end

a = s - mic1(1:x3);                                                        % Difference between Cleanspeech and Mic1 audio sample used to calculate the SNR before ANC has been applied
b = s - est(1:x3);                                                         % Difference between Cleanspeech and Estimated Signal which is used to calculate SNR after ANC

 SNR_Before_ANC = 10*log10((s'*s)/(a'*a));                                            
 SNR_After_ANC = 10*log10((s'*s)/(b'*b));                                           
 figure()
 plot(10*log10(Error_energy));                                             % Plotting energy per frame (dB) wrt number of frames (k)
 heading=sprintf('Error Convergence Plot for N= %d  Mu=%f' , N, mu);
 title(heading);
 xlabel('Number of frames, f');
 ylabel('|E(i)^2| in dB'); 

 
