% margin_arm_p_cont.m
% ü”g”®Œ`‚É‚æ‚éƒA[ƒ€Œn‚Ì P §Œä

close all
clear
format compact

arm_para

s = tf('s');
sysP = 1/(J*s^2 + c*s + M*g*l);

t = 0:0.001:1.5;
w = logspace(-2,3,1000);

txt = {'kP = 1','kP = 5.75','kP = 20'};

for i = 1:3
    if i == 1
        kP = 1;
        line_type = 'b--';
    elseif i == 2
        kP = 5.75;
        line_type = 'r-';
    else
        kP = 20;
        line_type = 'g-.';
    end
    
    sysC = kP;
    sysL = minreal(sysP*sysC);
    figure(i); margin(sysL)
    
    ax = findall(gcf,'Type','Axes');
    set(ax(2),'Xlim',[1e-2 1e3])	    % ˆÊ‘Šü}‚Ì‰¡²‚Ì”ÍˆÍ‚ğİ’è
    set(ax(2),'Ylim',[-200 25])         % ˆÊ‘Šü}‚Ìc²‚Ì”ÍˆÍ‚ğİ’è
    set(ax(3),'Ylim',[-80 60])          % ƒQƒCƒ“ü}‚Ìc²‚Ì”ÍˆÍ‚ğİ’è

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
figure(3); movegui('northeast')
figure(4); movegui('southwest')
figure(5); movegui('south')
figure(6); movegui('southeast')
