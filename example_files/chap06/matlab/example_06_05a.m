% example_06_05a.m
% �� 6.5�F�{�[�h���}

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 6.5 ')
disp('==================================================')

% ============================================
% �} 6.5 �̕`�� 
% ============================================

w = logspace(-3,3,10000);
a =   1./(w.^2 + 1);
b = - w./(w.^2 + 1);

Gg = sqrt(a.^2 + b.^2);
Gp = atan(b./a);

% -------------------------------------------
figure(1)
semilogx(w, 20*log10(Gg))
hold on
semilogx(w,-20*log10(w),'--')
hold off

grid on

xlabel('\omega [rad/s]')
ylabel('20log_{10}|P(j\omega)| [dB]')

ylim([-80 20])

% -------------------------------------------
figure(2)
semilogx(w,Gp*180/pi)
hold on
semilogx([1e-3 1e0],[ -45 -45],'k')
semilogx([1e0  1e0],[-120 -45],'k')
semilogx(1e0,-45,'o');
hold off

grid on

xlabel('\omega [rad/s]')
ylabel('\angle{P(j\omega)} [deg]')

ylim([-120 30])
set(gca,'YTick',-120:30:30)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
