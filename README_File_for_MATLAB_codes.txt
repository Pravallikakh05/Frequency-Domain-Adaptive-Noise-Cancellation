Procedure to run the MATLAB Code: Adaptive_Noise_Cancellation 

To run the function load the audio files in the same directory as the function
Run the function with the audio files and selected values of N and Mu as per the report, the estimated output is saved in the workspace.
To hear to the estimated output use the following command in the command window - sound(est,8000);

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Procedure to run the MATLAB Code Named: Best_MU_Value

Replace all the values in the program given by 'N' with 4,16,64,128,256 individually, and run the prorgam for each value. These are the different frame sizes for which we wish to obtain Best MU value.
the program lines with 'N' value are 10, 13, 14, 15, 17, 20, 21.

The program is set for Mic1.wav, Mic2.wav audio clips. This will give us the best MU value for a given frame size for random noise audio clips. 
It can be changed to Mic1_music.wav and Mic2_music.wav in program line 12 in order to obtain best mu values for the aforementioned audio clips.

As the MU value varies accross a wide range, in order to obtain a clearly defined best MU value set the Iteration Size and Number in accordance with the tables below. 

			Random Noise		
Frame Size 	Iteration Number	Iteration Size
4			100		0.0002
16			100		0.0002
64			100		0.0002
128			100		0.0001
256			100		0.00025


			Background Music		
Frame Size 	Iteration Number	Iteration Size
4			100		0.001
16			100		0.0005
64			100		0.00009
128			100		0.00005
256			100		0.00008


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>




