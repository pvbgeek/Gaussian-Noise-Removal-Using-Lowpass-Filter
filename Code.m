%%
clearvars;
clc
close all;
disp('Section-1 Complete')
%%
[x,Fs] = audioread('my_voice_new.wav');
N = size(x,1);% length of signal
f = Fs*(0:N-1)*N;% frequency range
T = 1/Fs;% sampling time
L = N; % length of signal
t = (0:L-1)*T; %time vector
disp('Section-2 Complete');
%%
f_noisy = awgn(x,45);
audiowrite('f_noisy.wav',f_noisy,Fs);
disp('Section-3 Complete');
%%
xn = x + f_noisy;
audiowrite('Noisy-Signal.wav',xn,Fs);
disp('Section-4 Complete');
%%
[audio_in,audio_freq_sampl]=audioread('my_voice_new.wav');
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

figure
FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
plot(frequency_audio,abs(FFT_audio_in));
title('FFT of Input Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

disp('Section-5 Complete');
%%
[audio_in,audio_freq_sampl]=audioread('f_noisy.wav');
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

figure
FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
plot(frequency_audio,abs(FFT_audio_in));
title('FFT of noisy signal');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
disp('Section-6 Complete');
%%
%filterDesigner
load bb.mat
disp('Section-7 Complete');
%%
filtered_signal = filter(Hd,f_noisy);
disp('Section-8 Complete');
%%
audiowrite('Output.wav',filtered_signal,Fs);
disp('Section-9 Complete');
%%
[audio_in,audio_freq_sampl]=audioread('Output.wav');
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

figure
FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
plot(frequency_audio,abs(FFT_audio_in));
title('FFT of Output Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
disp('Section-10 Complete');
%%
figure
subplot(3,1,1)
stem(t , x);title('Original: Time-domain'); xlabel('time(seconds)');
subplot(3,1,2)
stem(t , f_noisy , 'r');title('Noisy: Time-domain'); xlabel('time(seconds)');
subplot(3,1,3)
stem(t , filtered_signal , 'g');title('After processing: Time-domain'); xlabel('time(seconds)');

disp('Section-11 Complete')
%%
% sound(x,Fs)
%sound(f_noisy,Fs)
%
