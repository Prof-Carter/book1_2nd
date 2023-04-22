% sec0633_08.m
% 1 次進み要素のボード線図とベクトル軌跡（図 6.13）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 1 次進み要素 P(s) = 1 + Ts のボード線図とベクトル軌跡')
disp('==================================================')

Ts = tf('s');
sysP = Ts + 1;

% ============================================
% 図 6.13 の描画 
% ============================================

wT = logspace(-2,2,1000);

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
semilogx([wT(1) wcT],    [0 0])
hold on
semilogx([wcT   wT(end)],20*log10([wcT   wT(end)]))

semilogx(wT,20*log10(Gg))

semilogx(wcT,0,'o');
semilogx(wcT,20*log10(Gg_wc),'o');
hold off

grid on

xlabel('\omega{T}')
ylabel('20log_{10}{G}_{\rm g}(\omega) [dB]')

ylim([-10 40])

% -------------------------------------------
wT1 = 1/5;
wT2 = 5;

figure(2)
semilogx([wT(1) wT1    ],[ 0  0])
hold on
semilogx([wT1   wT2    ],[ 0 90])
semilogx([wT2   wT(end)],[90 90])

semilogx(wT,Gp)

semilogx(wT1,0,'o');
semilogx(wT2,90,'o');

semilogx([wT(1) wcT],[Gp_wc  Gp_wc],'k')
semilogx([wcT   wcT],[-105   Gp_wc],'k')
semilogx(wcT,Gp_wc,'o');
hold off

grid on

xlabel('\omega{T}')
ylabel('{G}_{\rm p}(\omega) [deg]')

ylim([-15 105])
set(gca,'YTick',-15:15:105)

% -------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

figure(3)
axis('square')
nyquist(sysP,options)

xlim([-1.5 1.5])
ylim([-1 2])

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
