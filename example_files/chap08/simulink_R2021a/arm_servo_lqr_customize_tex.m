% arm_servo_lqr_customize_tex.m
% 最適レギュレータによる積分型サーボ制御（鉛直面を回転するアーム系）
% （グラフのカスタマイズ）

close all
clear
format compact

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ];
B = [ 0
      1/J ];
C = [ 1  0 ];

rc = 1;
dc = 1;
x0 = [ 0
       0 ];

Ae = [ A  zeros(2,1)
      -C  0 ];
Be = [ B
       0 ];
   
q1 = 1e-3;
q2 = 1e-3;
q3 = 5e4;
Q = diag([q1 q2 q3])
R = 1

Ke = - lqr(Ae,Be,Q,R);
    
K = Ke(1:2)
G = Ke(3)

sim('arm_sim_servo')

% -------------------------------------------
for i = 1:2
    figure(i)
    set(gcf,'Position',[100 100 900 420]) 
    subplot('Position',[0.1 0.15 0.8 0.775])
end

% -------------------------------------------
figure(1)
plot(t,y,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t) = {x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',16)

xlim([0 3])
ylim([0 1.5])
set(gca,'XTick',0:0.5:3)
set(gca,'YTick',0:0.5:1.5)

grid on

% -------------------------------------------
figure(2)
plot(t,u,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',16)

xlim([0 3])
ylim([-5 10])
set(gca,'XTick',0:0.5:3)
set(gca,'YTick',-5:5:10)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
