% sample_lsim2_customize.m
% 任意の入力に対する応答の描画（グラフのカスタマイズ）

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

% -------------------------------------------
u = t;
y = lsim(sysP,u,t);
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,u,'--',t,y,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) and y(t)','FontName','Arial','FontSize',16)
% legend('u(t)','y(t)')
legend({'u(t)','y(t)'},'FontName','Arial','FontSize',16, ...
        'NumColumns',2, ...
        'Location','northwest')
set(legend,'FontName','Arial','FontSize',16)
grid on

xlim([0 5])
ylim([0 5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',0:0.5:5)

% -------------------------------------------
u = sin(4*t);
y = lsim(sysP,u,t);
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,u,'--',t,y,'LineWidth',1.5);
set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) and y(t)','FontName','Arial','FontSize',16)
% legend('u(t)','y(t)')
legend({'u(t)','y(t)'},'FontName','Arial','FontSize',16, ...
        'NumColumns',2)
set(legend,'FontName','Arial','FontSize',16)
grid on

xlim([0 5])
ylim([-1.5 1.5])
set(gca,'XTick',0:0.5:5)
set(gca,'YTick',-1.5:0.5:1.5)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
