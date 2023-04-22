% exercise_03_07a_customize.m
% 問題 3.7：1 次遅れ系のインパルス応答

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 3.7 ')
disp('==================================================')

s = tf('s');
t = 0:0.001:5;

% -------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

K = 1;

for T_val = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' P(s) = K/(1 + T*s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysP = K/(1 + T_val*s)

    y = impulse(sysP,t);

    figure(1)
    plot(t,y,'LineWidth',1.5)
    hold on
end

figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)

grid on

xlim([0 5])
ylim([0 2])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:2)

legend({'T = 0.5, K = 1', 'T = 1, K = 1', 'T = 2, K = 1'}, ...
       'FontName','Arial','FontSize',16)

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

T = 1;

for K_val = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' P(s) = K/(1 + T*s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysP = K_val/(1 + T*s)

    y = impulse(sysP,t);

    figure(2)
    plot(t,y,'LineWidth',1.5)
    hold on
end

figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('y(t)','FontName','Arial','FontSize',16)

grid on

xlim([0 5])
ylim([0 2])
set(gca,'XTick',0:1:5)
set(gca,'YTick',0:0.5:2)

legend({'T = 1, K = 0.5', 'T = 1, K = 1', 'T = 1, K = 2'}, ...
       'FontName','Arial','FontSize',16)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
