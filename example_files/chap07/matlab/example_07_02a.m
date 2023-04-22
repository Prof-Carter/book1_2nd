% example_07_02a.m
% 例 7.2：簡略化されたナイキストの安定判別法の利用例 (1)（図 7.7）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.2 ')
disp('==================================================')

Ts = tf('s');
sysP = 1/(1 + Ts);

% ------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = 'ベクトル軌跡';

% ------------------------------------------------------
figure(1)

for kP = [0.5 1 2]
    sysC = kP;    
    sysL = sysP*sysC;

    nyquist(sysL,options)
    hold on
end

figure(1)
hold off

xlim([-1.2 2.2])
set(gca,'XTick',-1:0.5:2)
ylim([-1.8 0.8])
set(gca,'YTick',-2:0.5:1)

legend('kP = 0.5','kP = 1','kP = 2')


