%%%%%
% Stefan Tesanovic 2016/0675
%%%%%%

close all
clear all 
clc

%%%%%
% Deo 3
%%%%%%


[x,fs] = audioread('nepoznati_signal.wav');
t = 1/fs:1/fs:length(x)/fs;


nfft = 4096; 
window_width = nfft;
overlap_num = 3/4*window_width;

ws = boxcar(window_width);
%racunanje spektrograma
[B,frequencies,times] = spectrogram(x, ws, overlap_num, nfft, fs);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
figure(1)
title(['Spektrogram za T = ' num2str(1000*window_width/fs) ' ms']);
imagesc(times, frequencies, B_dB);
axis('xy'), xlabel('vreme [s]'), ylabel('ucestanost [Hz]');


x=x';
test=[];
for j=2300:1:2700;
    z = sin(2*pi*j.*t.^3);
    temp=sum(z-x);
    test=[test;temp];
end

[TEST,I] = min(abs(test));
fr = I*1+2000
y = sin(2*pi*fr.*t.^3);



ws = boxcar(window_width);

%racunanje spektrograma
[B,frequencies,times] = spectrogram(y, ws, overlap_num, nfft, fs);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
figure(2)
title(['Spektrogram za T = ' num2str(1000*window_width/fs) ' ms']);
imagesc(times, frequencies, B_dB);
axis('xy'), xlabel('vreme [s]'), ylabel('ucestanost [Hz]');


figure(3)
plot(y-x);

figure(4)
plot(x); hold on; pause
plot(y); hold off;



