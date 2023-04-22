% example_08_06_02_customize.m
% 例 8.6：鉛直面を回転するアーム系（極配置法による設計）
% （グラフのカスタマイズ）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.6 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]

% -------------------------------------------
for i = 1:3
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
for i = 1:3
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    if i == 1
        p(1) = - 4 + 8j;
        p(2) = - 4 - 8j;
    elseif i == 2
        p(1) = - 8 + 8j;
        p(2) = - 8 - 8j;
    else
        p(1) = - 4 + 16j;
        p(2) = - 4 - 16j;
    end

    disp(' ')
    disp('--- 指定する極 p ---')
    p'

    disp(' ')
    disp('--- 状態フィードバックゲイン K ---')
    K = - acker(A,B,p)

    disp(' ')
    disp('--- A + B*K の固有値 ---')
    eig(A + B*K)

    sys = ss(A+B*K,[],eye(2),[]);

    t = 0:0.001:1.5;
    x0 = [ 1
           0 ];
    x = initial(sys,x0,t);

    u = K*x';

    figure(1)
    plot(t,x(:,1),'LineWidth',1.5)
    hold on

    figure(2)
    plot(t,x(:,2),'LineWidth',1.5)
    hold on

    figure(3)
    plot(t,u,'LineWidth',1.5)
    hold on
end

% -------------------------------------------
figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x1(t) [rad]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-0.5 1])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-0.5:0.25:1.5)

legend({'- 4 \pm 8j',...
        '- 8 \pm 8j',...
        '- 4 \pm 16j'},...
        'FontName','Arial','FontSize',14)

grid on

% -------------------------------------------
figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x2(t) [rad/s]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-12 6])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-12:3:6)

grid on

% -------------------------------------------
figure(3)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) [N{\cdot}m]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-20 10])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-20:5:10)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')

