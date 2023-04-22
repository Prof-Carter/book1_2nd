% sec0631_06_customize.m
% î˜ï™óvëfÇÃÉ{Å[Éhê¸ê}Åiê} 6.12ÅjÇ∆ÉxÉNÉgÉããOê’Åiê} 6.11 (c)Åj

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' î˜ï™óvëf P(s) = T*s  ÇÃÉ{Å[Éhê¸ê}')
disp('==================================================')

Ts = tf('s');
sysP = Ts;

% -------------------------------------------
for i = 1:3
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% ============================================
% ê} 6.12 ÇÃï`âÊ 
% ============================================

wT = logspace(-2,2,1000);

[Gg Gp] = bode(sysP,wT);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------
figure(1)
semilogx(wT, 20*log10(Gg),'LineWidth',1.5)
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('\omega{T}','FontName','Arial','FontSize',16)
ylabel('20log_{10}{G}_{g}(\omega) [dB]','FontName','Arial','FontSize',16)
title('P(s) = Ts','FontName','Arial','FontSize',16)

ylim([-40 40])
set(gca,'YTick',-40:20:40)

% -------------------------------------------
figure(2)
semilogx(wT,Gp,'LineWidth',1.5)
grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('\omega{T}','FontName','Arial','FontSize',16)
ylabel('{G}_{p}(\omega) [deg]','FontName','Arial','FontSize',16)
title('P(s) = Ts','FontName','Arial','FontSize',16)

ylim([-180 180])
set(gca,'YTick',-180:90:180)


% ============================================
% ê} 6.11 (b) ÇÃï`âÊ 
% ============================================
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ÉxÉNÉgÉããOê’';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])
nyquist(sysP,options)
h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)

xlim([-4 4])
ylim([-3 3])
set(gca,'XTick',-4:1:4)
set(gca,'YTick',-3:1:3)

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
