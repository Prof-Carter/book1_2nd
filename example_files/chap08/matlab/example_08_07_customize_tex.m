% example_08_07_customize_tex.m
% 例 8.7：鉛直面を回転するアーム系（最適レギュレータによる設計）
% （グラフのカスタマイズ）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.7 ')
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
for q1 = [4 20 100]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' ')
    disp('--- 重み Q, R ---')
    Q = diag([q1 0.001])
    R = 1

    disp(' ')
    disp('--- 状態フィードバックゲイン K ---')
    K = - lqr(A,B,Q,R)

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
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-0.5 1])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-0.5:0.25:1.5)

grid on

legend({'${q}_{1} = 4$','${q}_{1} = 20$','${q}_{1} = 100$'}, ...
        'Interpreter','latex','FontSize',16)

% -------------------------------------------
figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-6 3])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-6:1.5:3)

grid on

% -------------------------------------------
figure(3)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:2.5:5)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


