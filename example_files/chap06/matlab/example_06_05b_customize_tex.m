% example_06_05b_customize_tex.m
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
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w, 20*log10(Gg),'LineWidth',1.5)
hold on
semilogx(w,-20*log10(w),'--','LineWidth',1.5)
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}|P(j\omega)|$ [dB]','Interpreter','latex','FontSize',16)

xlim([1e-3 1e3])
ylim([-80 20])

set(gca,'XTick',logspace(-3,3,7))

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(w,Gp,'LineWidth',1.5)
hold on
semilogx([1e-3 1e0],[ -45 -45],'k')
semilogx([1e0  1e0],[-120 -45],'k')
semilogx(1e0,-45,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$\angle{P(j\omega)}$ [deg]','Interpreter','latex','FontSize',16)

xlim([1e-3 1e3])
ylim([-120 30])

set(gca,'XTick',logspace(-3,3,7))
set(gca,'YTick',-120:30:30)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
