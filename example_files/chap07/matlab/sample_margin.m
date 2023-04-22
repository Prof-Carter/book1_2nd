% sample_margin.m
% ˆÀ’è—]—T

close all
clear
format compact

sysP = tf([1],[1 1])^3;
sysC = 2;
sysL = sysP*sysC;

[inv_Ljw Pm wpc wgc] = margin(sysL)

Gm = 20*log10(inv_Ljw)

% ------------------------------
fprintf('\n')
fprintf('++++++++++++++++++++++\n')
fprintf('wpc = %7.3f [rad/s]\n',wpc)
fprintf('Gm  = %7.3f [dB]\n',   Gm)
fprintf('wgc = %7.3f [rad/s]\n',wgc)
fprintf('Pm  = %7.3f [deg]\n',  Pm)