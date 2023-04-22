% sec0633_02.m
% ���v�f�̃{�[�h���}�i�} 6.10�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ���v�f P(s) = K �̃{�[�h���} ')
disp('==================================================')

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
    semilogx(w,20*log10(Gg))
    hold on

    % -------------------------------------------
    figure(2)
    semilogx(w,Gp)
    hold on
end

figure(1)
hold off
grid on

xlabel('\omega [rad/s]')
ylabel('20log_{10}{G}_{g}(\omega) [dB]')
title('P(s) = K')

ylim([-40 40])
set(gca,'YTick',-40:20:40)

legend('K = 10','K = 1','K = 0.1')

% -------------------------------------------
figure(2)
hold off
grid on

xlabel('\omega [rad/s]')
ylabel('{G}_{p}(\omega) [deg]')
title('P(s) = K')

ylim([-180 180])
set(gca,'YTick',-180:90:180)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

