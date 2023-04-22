% sec0631_02.m
% 1 次遅れ要素のボード線図とベクトル軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp('   　　　　　            1')
disp(' 1 次遅れ要素 P(s) = --------- のボード線図とベクトル軌跡')
disp('   　　　　　         1 + T s')
disp('==================================================')

Ts = tf('s');
sysP = 1/(Ts + 1);

% ============================================
% 図 6.7 の描画 
% ============================================

wT = logspace(-2,2,1000);

[Gg Gp] = bode(sysP,wT);
Gg = Gg(:,:);
Gp = Gp(:,:);

disp(' ')
disp(' ---- w = wc = 1/T のとき ----')

wcT = 1e0;
[Gg_wc Gp_wc] = bode(sysP,wcT);

fprintf('Gg(wc) = %s [倍]\n',char(sym(Gg_wc)))
fprintf('Gp(wc) = %s [deg]\n',char(sym(Gp_wc)))

% -------------------------------------------
figure(1)
semilogx([wT(1) wcT],[0 0])
hold on
semilogx([wcT   wT(end)],-20*log10([wcT   wT(end)]))

semilogx(wT, 20*log10(Gg))

semilogx(wcT,0,'o');
semilogx(wcT,20*log10(Gg_wc),'o');
hold off

grid on

xlabel('{\omega}T')
ylabel('20log_{10}(Gg(\omega)) [dB]')

ylim([-40 10])

% -------------------------------------------
wT1 = 1/5;
wT2 = 5;

figure(2)
semilogx([wT(1) wT1    ],[  0   0])
hold on
semilogx([wT1   wT2    ],[  0 -90])
semilogx([wT2   wT(end)],[-90 -90])

semilogx(wT,Gp)

semilogx(wT1,0,'o');
semilogx(wT2,-90,'o');

semilogx([wT(1) wcT],[Gp_wc  Gp_wc],'k')
semilogx([wcT   wcT],[-105   Gp_wc],'k')
semilogx(wcT,Gp_wc,'o');
hold off
grid on

xlabel('{\omega}T')
ylabel('Gp(\omega) [deg]')

ylim([-105 15])
set(gca,'YTick',-105:15:15)

% -------------------------------------------
figure(3)
semilogx(wT, Gg)
hold on

semilogx([wT(1) wcT],[Gg_wc Gg_wc],'k')
semilogx([wcT   wcT],[0     Gg_wc],'k')

semilogx(wcT,Gg_wc,'o');
hold off
grid on

xlabel('{\omega}T')
ylabel('Gg(\omega)')

ylim([0 1.2])
set(gca,'YTick',0:0.2:1.2)

% -------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

figure(4)
axis('square')
nyquist(sysP,options)

xlim([-0.2 1.2])
ylim([-0.8 0.2])

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')
