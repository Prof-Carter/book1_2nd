% example_08_09_customize.m
% 例 8.9：鉛直面を回転するアーム系（最適レギュレータによる積分型サーボ制御）
% （グラフのカスタマイズ）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.9 ')
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
Ae = [ A  zeros(2,1)
      -C  0 ];
Be = [ B
       0 ];

% -------------------------------------------
for i = 1:3
    figure(i)
    set(gcf,'Position',[100 100 900 420]) 
    subplot('Position',[0.1 0.15 0.8 0.775])
end

% -------------------------------------------
for i = 1:3
    q1 = 1e-3;
    q2 = 1e-3;
        
    if i == 1
        q3 = 5e2;
    elseif i == 2
        q3 = 5e3;
    else
        q3 = 5e4;
    end
    
    disp(' --------------------------- ')
    format short e
    Q = diag([q1 q2 q3])
    format short
    R = 1

    Ke = - lqr(Ae,Be,Q,R);
    
    K = Ke(1:2)
    G = Ke(3)

    sim('arm_sim_servo')

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

legend({'q3 = 500','q3 = 5000','q3 = 50000'},...
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

