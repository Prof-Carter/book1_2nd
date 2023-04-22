% example_06_05b.m
% 例 6.5：ボード線図（関数 bode を利用）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 6.5 ')
disp('==================================================')

s = tf('s');
sysP = 1/(s + 1)

% ============================================
% 図 6.5 の描画 
% ============================================

w = logspace(-3,3,10000);

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

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

set(gca,'XTick',logspace(-3,3,7))

% -------------------------------------------
figure(2)
semilogx(w,Gp)
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
