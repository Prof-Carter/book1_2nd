% sample_frequency_response_customize.m
% 周波数応答（図 6.21，グラフのカスタマイズ）

clear
format compact

sysP = tf([1],[1 0.5 1])
A = 1;  w = 2;
t = 0:0.001:25;

[Gg Gp] = bode(sysP,w);
Gp_rad = Gp*pi/180;

u = A*sin(w*t);
y = lsim(sysP,u,t);
yapp = A*Gg*sin(w*t + Gp_rad);

% -------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,u,'LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')

xlabel('t [s]','FontSize',16,'FontName','Arial');
ylabel('u(t)','FontSize',16,'FontName','Arial')

legend('u(t)');
set(legend,'FontSize',16,'FontName','Arial')
grid on

xlim([0 25])
set(gca,'XTick',0:5:25)
ylim([-1.5 1.5])
set(gca,'YTick',-1.5:0.5:1.5)

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])

plot(t,yapp,t,y,'--','LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')

xlabel('t [s]','FontSize',16,'FontName','Arial');
ylabel('y(t) and {y}_{app}(t)','FontSize',16,'FontName','Arial')

legend('{y}_{app}(t)','y(t)');
set(legend,'FontSize',16,'FontName','Arial')
grid on

xlim([0 25])
set(gca,'XTick',0:5:25)
ylim([-0.8 0.8])
set(gca,'YTick',-0.8:0.2:0.8)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
