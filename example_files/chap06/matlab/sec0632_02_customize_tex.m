% sec0632_02_customize_tex.m
% 2 次遅れ要素のボード線図とベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 2 次遅れ要素')
disp('                   wn^2')
disp('  P(s) = -------------------------')
disp('         s^2 + 2*zeta*wn*s + wn^2')
disp(' のボード線図とベクトル軌跡')
disp('==================================================')

s_per_wn = tf('s');     % s/wn

% ============================================
% 図 6.9 の描画 
% ============================================

% -------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;

% -------------------------------------------
for i = 1:4
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
eta = logspace(-2,2,10000);

for zeta = [0.25 0.5 1 2]
    
    % ---- P(s) = 1/((s/wn)^2 + 2*zeta*(s/wn) + 1) ----
    sysP = 1/((s_per_wn)^2 + 2*zeta*s_per_wn + 1);

    [Gg Gp] = bode(sysP,eta);
    Gg = Gg(:,:);
    Gp = Gp(:,:);

    figure(1)
    semilogx(eta,20*log10(Gg),'LineWidth',1.5)
    hold on

    figure(2)
    semilogx(eta,Gp,'LineWidth',1.5)
    hold on

    figure(3)
    semilogx(eta,Gg,'LineWidth',1.5)
    hold on

    figure(4)
    nyquist(sysP,options)
    h = findobj(gcf,'type','Line');
    set(h,'LineWidth',1.5)
    hold on
end

for zeta = [0.25 0.5 1 2]
    if zeta < 1/sqrt(2)
        eta_p = (1 - 2*zeta^2)^(1/2);
        Mp = 1/(2*zeta*(1 - zeta^2)^(1/2));

        fprintf('\n')
        fprintf('zeta  = %f\n',zeta)
        fprintf('eta_p = wp/wn  = %f\n',eta_p)
        fprintf('Mp    = Gg(wp) = %f\n',Mp)

        figure(1)
        plot(eta_p,20*log10(Mp),'o',...
            'LineWidth',1.5, ...
            'MarkerSize',8)

        figure(3)
        plot(eta_p,Mp,'o',...
            'LineWidth',1.5, ...
            'MarkerSize',8)
    end
end

% -------------------------------------------
figure(1)
hold off
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',16)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',16)

ylim([-80 20])

legend({'$\zeta = 0.25$','$\zeta = 0.5$','$\zeta = 1$','$\zeta = 2$'},...
       'Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(2)
hold off
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',16)

ylim([-210 30])
set(gca,'YTick',-210:30:30)

% -------------------------------------------
figure(3)
hold off
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm g}(\omega)$','Interpreter','latex','FontSize',16)

ylim([0 2.5])

% -------------------------------------------
figure(4)
hold off

set(gca,'FontName','Arial','FontSize',14)

xlim([-1 1.5])
ylim([-2.25 0.25])

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
