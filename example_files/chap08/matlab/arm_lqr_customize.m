% arm_lqr_customize.m
% 最適レギュレータ（鉛直面を回転するアーム系）
% （グラフのカスタマイズ）

close all
clear
format compact

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ];
B = [ 0
      1/J ];
   
Q = diag([20 0.001]);
R = 1;

K = - lqr(A,B,Q,R)

eig(A + B*K)

sys = ss(A+B*K,[],eye(2),[]);

t = 0:0.001:1.5;
x0 = [ 1
       0 ];
x = initial(sys,x0,t);

u = K*x';

% -------------------------------------------
for i = 1:3
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
figure(1)
plot(t,x(:,1),'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x1(t) [rad]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-0.5 1])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-0.5:0.25:1.5)

grid on

% -------------------------------------------
figure(2)
plot(t,x(:,2),'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x2(t) [rad/s]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:5:5)

grid on

% -------------------------------------------
figure(3)
plot(t,u,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) [N{\cdot}m]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:5:5)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


