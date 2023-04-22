% sec0632_02.m
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

% -------------------------------------------
eta = logspace(-2,2,1000);

for zeta = [0.25 0.5 1 2]

    % ---- P(s) = 1/((s/wn)^2 + 2*zeta*(s/wn) + 1) ----
    sysP = 1/((s_per_wn)^2 + 2*zeta*s_per_wn + 1);

    [Gg Gp] = bode(sysP,eta);
    Gg = Gg(:,:);
    Gp = Gp(:,:);

    figure(1)
    semilogx(eta,20*log10(Gg))
    hold on

    figure(2)
    semilogx(eta,Gp)
    hold on

    figure(3)
    semilogx(eta,Gg)
    hold on

    figure(4)
    nyquist(sysP,options)
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
        plot(eta_p,20*log10(Mp),'o')

        figure(3)
        plot(eta_p,Mp,'o')
    end
end

% -------------------------------------------
figure(1)
hold off
grid on

xlabel('\eta = \omega/{\omega}_{n}')
ylabel('20log_{10}{G}_{g}(\omega) [dB]')

ylim([-80 20])

legend('\zeta = 0.25','\zeta = 0.5','\zeta = 1','\zeta = 2')

% -------------------------------------------
figure(2)
hold off
grid on

xlabel('\eta = \omega/{\omega}_{n}')
ylabel('{G}_{p}(\omega) [deg]')

ylim([-210 30])
set(gca,'YTick',-210:30:30)

% -------------------------------------------
figure(3)
hold off
grid on

xlabel('\eta = \omega/{\omega}_{n}')
ylabel('{G}_{g}(\omega)')

ylim([0 2.5])

% -------------------------------------------
figure(4)
hold off

xlim([-1 1.5])
ylim([-2.25 0.25])

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
