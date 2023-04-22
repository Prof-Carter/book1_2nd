% margin_arm_pi_cont2.m
% 周波数整形によるアーム系の PI 制御（kP を変化）

close all
clear
format compact

arm_para

s = tf('s');
sysP = 1/(J*s^2 + c*s + M*g*l);

t = 0:0.001:1.5;
w = logspace(-2,3,1000);

txt = {'kP = 3.32, TI = 0.75','kP = 5.75, TI = 0.75'};

for i = 1:2
    if i == 1
        kP = 3.32; TI = 0.75;
        line_type = 'r-';
    else
        kP = 5.75; TI = 0.75;
        line_type = 'b--';
    end
    
    sysC = kP*(1 + 1/(TI*s));
    sysL = minreal(sysP*sysC);
    figure(i); margin(sysL)
    
    ax = findall(gcf,'Type','Axes');
    set(ax(2),'Xlim',[1e-2 1e3])	% 横軸目盛範囲
    set(ax(2),'Ylim',[-200 -25])    % 位相：縦軸目盛範囲
    set(ax(3),'Ylim',[-80 60])      % ゲイン：縦軸目盛範囲

    sysS = minreal(   1/(1 + sysL));
    sysT = minreal(sysL/(1 + sysL));

    figure(4); step(sysT,t,line_type); hold on
    
    figure(5); bodemag(sysS,w,line_type); hold on
    figure(6); bodemag(sysT,w,line_type); hold on
end

figure(4); hold off
ylim([0 1.5])
legend(txt,'Location','southeast')

figure(5); hold off; grid on
ylim([-60 20])
legend(txt,'Location','southeast')

figure(6); hold off; grid on
ylim([-60 20])
legend(txt,'Location','southwest')

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')

figure(4); movegui('southwest')
figure(5); movegui('south')
figure(6); movegui('southeast')


