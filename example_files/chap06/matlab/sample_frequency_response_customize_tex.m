% sample_frequency_response_customize_tex.m
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
set(gca,'FontSize',14,'FontName','arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',16);
ylabel('$u(t)$','Interpreter','latex','FontSize',16)

legend('$u(t)$',...
       'Interpreter','latex','FontSize',16);
grid on

xlim([0 25])
set(gca,'XTick',0:5:25)
ylim([-1.5 1.5])
set(gca,'YTick',-1.5:0.5:1.5)

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])

plot(t,yapp,t,y,'--','LineWidth',1.5)
set(gca,'FontSize',14,'FontName','arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',16);
ylabel('$y(t)$ and ${y}_{\rm app}(t)$','Interpreter','latex','FontSize',16)

legend({'${y}_{\rm app}(t)$','$y(t)$'},...
       'Interpreter','latex','FontSize',16);
grid on

xlim([0 25])
set(gca,'XTick',0:5:25)
ylim([-0.8 0.8])
set(gca,'YTick',-0.8:0.2:0.8)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
