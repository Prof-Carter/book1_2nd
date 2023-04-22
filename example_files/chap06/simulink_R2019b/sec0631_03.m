% sec0631_03.m
% ローパスフィルタ：1 次遅れ要素によるノイズ除去（図 6.8）

close all
clear
format compact

sim('sim_noise_reduction')

% --------------------------------
figure(1)
plot(t,y)
ylabel('y(t)')
title('低周波信号')

% --------------------------------
figure(2)
plot(t,n)
ylabel('n(t)')
title('ノイズ（高周波信号）')

% --------------------------------
figure(3)
plot(t,y+n)

ylabel('y(t) + n(t)')
title('低周波信号 + ノイズ')

% --------------------------------
figure(4)
plot(t,y+n)
hold on
plot(t,yf)
hold off
ylabel('yf(t)')
title('ローパスフィルタ通過後の信号')

legend('y(t) + n(t)','yf(t)')

% --------------------------------
for i = 1:4
    figure(i)
    grid on

    ylim([-1.5 1.5])
    xlim([0 2*pi])

    xlabel('t [s]')

    set(gca,'XTick',0:pi/4:2*pi)
    set(gca,'XTickLabel',{'0','','\pi/2','','\pi','','3\pi/2','','2\pi'})
end

figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


