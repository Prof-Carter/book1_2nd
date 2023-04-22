% sec0631_02_customize_tex.m
% ���v�f�̃{�[�h���}�i�} 6.10�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ���v�f P(s) = K �̃{�[�h���} ')
disp('==================================================')

% -------------------------------------------
for i = 1:2
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
for K = [10 1 0.1]
    sysP = K;
    sysP = tf(sysP);
    
    % ============================================
    % �} 6.10 �̕`��i�{�[�h���}�j
    % ============================================
    
    w = logspace(-2,2,1000);
    
    [Gg Gp] = bode(sysP,w);
    Gg = Gg(:,:);
    Gp = Gp(:,:);    
    
    % -------------------------------------------
    figure(1)
    semilogx(w, 20*log10(Gg),'LineWidth',1.5)
    hold on

    % -------------------------------------------
    figure(2)
    semilogx(w,Gp,'LineWidth',1.5)
    hold on
end


figure(1)
hold off
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)
title('$P(s) = K$','Interpreter','latex','FontSize',16)

ylim([-40 40])
set(gca,'YTick',-40:20:40)

legend({'$K = 10$','$K = 1$','$K = 0.1$'},...
       'Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(2)
hold off
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)
title('$P(s) = K$','Interpreter','latex','FontSize',16)

ylim([-180 180])
set(gca,'YTick',-180:90:180)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

