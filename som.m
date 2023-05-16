clc;
%clear all;
load handel;
ly = length(y);
lspan = 1:ly;
t = lspan/Fs;

hf = figure;
plot(t,y./max(y))
axis tight;
title('Signal (Handel''s Hallelujah Chorus) vs Time');
xlabel('Time (s)');
ylabel('Amplitude');

%markers = struct('xpos',[0.2,0.4,0.55,0.65,0.8],'string',num2str([1:5]'));
for i = 1:5,
    annotation(hf,'BackgroundColor','w','FontSize',16);
end