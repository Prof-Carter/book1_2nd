% example_08_08_customize.m
% 例 8.8：鉛直面を回転するアーム系（最適レギュレータによる目標値追従制御）
% （グラフのカスタマイズ）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.8 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]

% -------------------------------------------
rc = 1;
dc = 1;
x0 = [ 0
       0 ];

% -------------------------------------------
for i = 1:3
    figure(i)
    set(gcf,'Position',[100 100 900 420]) 
    subplot('Position',[0.1 0.15 0.8 0.775])
end

% -------------------------------------------
for i = 1:3
    if i == 1
        q1 = 4;
    elseif i == 2
        q1 = 20;
    else
        q1 = 100;
    end

    q2 = 1e-3;
    
    disp(' --------------------------- ')
    Q = diag([q1 q2])
    R = 1

    K = - lqr(A,B,Q,R)
    
    M = [ A  B
          C  0 ];
    H = [ -K  1 ]*inv(M)*[ zeros(2,1)
                           1 ]

    sim('arm_sim_following')

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
ylabel('y(t) = x1(t) [rad]','FontName','Arial','FontSize',16)

xlim([0 3])
ylim([0 1.5])
set(gca,'XTick',0:0.5:3)
set(gca,'YTick',0:0.5:1.5)

grid on

legend({'q1 = 4','q1 = 20','q1 = 100'},...
        'FontName','Arial','FontSize',14, ...
        'Location','southeast')

% -------------------------------------------
figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x2(t) [rad/s]','FontName','Arial','FontSize',16)

xlim([0 3])
ylim([-1 6])
set(gca,'XTick',0:0.5:3)
set(gca,'YTick',-1:1:6)

grid on

% -------------------------------------------
figure(3)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) [N{\cdot}m]','FontName','Arial','FontSize',16)

xlim([0 3])
ylim([-5 10])
set(gca,'XTick',0:0.5:3)
set(gca,'YTick',-5:5:10)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')

