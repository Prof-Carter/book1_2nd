% sec0633_04.m
% 積分要素のボード線図（図 6.12）とベクトル軌跡（図 6.11 (b)）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 積分要素 P(s) = 1/(Ts)  のボード線図')
disp('==================================================')

Ts = tf('s');
sysP = 1/Ts;

% ============================================
% 図 6.12 の描画 
% ============================================

wT = logspace(-2,2,1000);

[Gg Gp] = bode(sysP,wT);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------
figure(1)
semilogx(wT, 20*log10(Gg),'LineWidth',1.5)
grid on

xlabel('\omega{T}')
ylabel('20log_{10}{G}_{g}(\omega) [dB]')
title('P(s) = 1/Ts')

ylim([-40 40])
set(gca,'YTick',-40:20:40)

% -------------------------------------------
figure(2)
semilogx(wT,Gp,'LineWidth',1.5)
grid on

xlabel('\omega{T}')
ylabel('{G}_{p}(\omega) [deg]')
title('P(s) = 1/Ts')

ylim([-180 180])
set(gca,'YTick',-180:90:180)


% ============================================
% 図 6.11 (b) の描画 
% ============================================
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])
nyquist(sysP,options)

xlim([-4 4])
set(gca,'XTick',-4:1:4)
ylim([-3 3])
set(gca,'YTick',-3:1:3)


% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
