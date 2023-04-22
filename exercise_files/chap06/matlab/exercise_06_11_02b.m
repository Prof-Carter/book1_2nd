% exercise_06_11_02b.m
% 問題 6.11：問題 6.4 (2) のボード線図

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 6.11：問題 6.4 (2) のボード線図')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = s*(s + 1)/(10*(10*s + 1))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

s = tf('s');
sysP = s*(s + 1)/(10*(10*s + 1))

w = logspace(-3,2,1000);

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

