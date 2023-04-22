% exercise_06_11_02b_customize_customize.m
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
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w,20*log10(Gg),'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('\omega [rad/s]','FontSize',16,'FontName','Arial')
ylabel('Gain [dB]','FontSize',16,'FontName','Arial')

grid on

xlim([1e-3 1e2])
ylim([-90 10])
set(gca,'XTick',logspace(-3,2,6))
set(gca,'YTick',-80:20:0)

% -----------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w,Gp,'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('\omega [rad/s]','FontSize',16,'FontName','Arial')
ylabel('Phase [deg]','FontSize',16,'FontName','Arial')

grid on

xlim([1e-3 1e2])
ylim([-10 100])
set(gca,'XTick',logspace(-3,2,6))
set(gca,'YTick',0:30:90)

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

