% exercise_06_11_03b.m
% 問題 6.11：問題 6.4 (3) のボード線図

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.11：問題 6.4 (3) のボード線図')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = 1/(s + 1)^4

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -----------------
figure(1)
semilogx(w,20*log10(Gg))

xlabel('\omega [rad/s]')
ylabel('Gain [dB]')

grid on

% -----------------
figure(2)
semilogx(w,Gp)

xlabel('\omega [rad/s]')
ylabel('Phase [deg]')

grid on

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

