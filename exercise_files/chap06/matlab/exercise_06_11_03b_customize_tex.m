% exercise_06_11_03b_customize_tex.m
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

w = logspace(-2,2,1000);

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -----------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w,20*log10(Gg),'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

grid on

xlim([1e-2 1e2])
ylim([-170 10])
set(gca,'XTick',logspace(-2,2,5))
set(gca,'YTick',-160:40:0)

% -----------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w,Gp,'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

grid on

xlim([1e-2 1e2])
ylim([-380 20])
set(gca,'XTick',logspace(-2,2,5))
set(gca,'YTick',-360:90:0)

% ------------------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

