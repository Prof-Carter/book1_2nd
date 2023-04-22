% sec0631_02_customize.m
% 1 次遅れ要素のボード線図とベクトル軌跡

close all
clear
format compact

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   　　　　　            1')
disp(' 1 次遅れ要素 P(s) = --------- のボード線図とベクトル軌跡')
disp('   　　　　　         1 + T s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ts = tf('s');
sysP = 1/(Ts + 1);

% -------------------------------------------
for i = 1:4
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% ============================================
% 図 6.7 の描画 
% ============================================

wT = logspace(-2,2,10000);

[Gg Gp] = bode(sysP,wT);
Gg = Gg(:,:);
Gp = Gp(:,:);

wcT = 1e0;
[Gg_wc Gp_wc] = bode(sysP,wcT);

disp(' ')
disp(' ---- w = wc = 1/T のとき ----')
fprintf('Gg(wc) = %s [倍]\n',char(sym(Gg_wc)))
fprintf('Gp(wc) = %s [deg]\n',char(sym(Gp_wc)))

% -------------------------------------------
figure(1)
semilogx([wT(1) wcT],    [0 0],                     'Color',[217 83 25]/255,'LineWidth',1.5)
hold on
semilogx([wcT   wT(end)],-20*log10([wcT   wT(end)]),'Color',[217 83 25]/255,'LineWidth',1.5)

semilogx(wT, 20*log10(Gg),  'Color',[0 114 189]/255,'LineWidth',1.5)

semilogx(wcT,0,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
semilogx(wcT,20*log10(Gg_wc),'o', ...
                 'Color',[0 114 189]/255, ...    
                 'MarkerFaceColor',[0 114 189]/255, ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('\omega{T}','FontName','Arial','FontSize',16)
ylabel('20log_{10}{G}_{g}(\omega) [dB]','FontName','Arial','FontSize',16)

ylim([-40 10])

% -------------------------------------------
wT1 = 1/5;
wT2 = 5;

figure(2)
semilogx([wT(1) wT1    ],[  0   0],'Color',[217 83 25]/255,'LineWidth',1.5)
hold on
semilogx([wT1   wT2    ],[  0 -90],'Color',[217 83 25]/255,'LineWidth',1.5)
semilogx([wT2   wT(end)],[-90 -90],'Color',[217 83 25]/255,'LineWidth',1.5)

semilogx(wT,Gp,'Color',[0 114 189]/255,'LineWidth',1.5)

semilogx(wT1,0,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
semilogx(wT2,-90,'o', ...
                 'Color',[217 83 25]/255, ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);

semilogx([wT(1) wcT],[Gp_wc  Gp_wc],'k')
semilogx([wcT   wcT],[-105   Gp_wc],'k')
semilogx(wcT,Gp_wc,'o', ...
                 'Color',[0 114 189]/255, ...    
                 'MarkerFaceColor',[0 114 189]/255, ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('\omega{T}','FontName','Arial','FontSize',16)
ylabel('{G}_{p}(\omega) [deg]','FontName','Arial','FontSize',16)

ylim([-105 15])
set(gca,'YTick',-105:15:15)

% -------------------------------------------
figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

semilogx(wT, Gg,  'Color',[0 114 189]/255,'LineWidth',1.5)
hold on

semilogx([wT(1) wcT],[Gg_wc Gg_wc],'k')
semilogx([wcT   wcT],[0     Gg_wc],'k')

semilogx(wcT,Gg_wc,'o', ...
                 'Color',[0 114 189]/255, ...    
                 'MarkerFaceColor',[0 114 189]/255, ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('\omega{T}','FontName','Arial','FontSize',16)
ylabel('{G}_{g}(\omega)','FontName','Arial','FontSize',16)

ylim([0 1.2])
set(gca,'YTick',0:0.2:1.2)

% -------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;

figure(4)
subplot('Position',[0.15 0.15 0.775 0.775])
nyquist(sysP,options)
h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)

xlim([-0.2 1.2])
ylim([-0.8 0.2])
set(gca,'XTick',-0.2:0.2:1.2)
set(gca,'YTick',-0.8:0.2:0.2)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
