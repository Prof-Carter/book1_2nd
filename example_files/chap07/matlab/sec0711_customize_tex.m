% sec0711_customize_tex.m
% L(s) = P(s)C(s) のナイキスト軌跡（図 7.2）

close all
clear
format compact

s = tf('s');

disp(' ')
disp('===== L(s) = P(s)C(s) =====')
sysL = 10*(s^2 + 2*s + 2)/((s + 3)*(s - 1)*(s - 4))

tf(sysL)

disp(' ')

disp('===== L(s) の極 =====')
pole(sysL)

disp(' ')
disp('===== 1 + L(s) の零点 =====')
zero(1 + sysL)

% -----------------------------------
w = logspace(-4,4,100000);

[xx yy] = nyquist(sysL,w);
xx = xx(:,:);
yy = yy(:,:);

figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

plot(xx,-yy,'LineWidth',1.5)
hold on
plot(xx, yy,'LineWidth',1.5)

grid on

set(gca,'FontSize',14,'FontName','Arial')

xlabel('実軸','FontSize',16,'FontName','MS UI Gothic')
ylabel('虚軸','FontSize',16,'FontName','MS UI Gothic')

xlim([-2 2])
set(gca,'XTick',[-2:0.5:2])
ylim([-1.5 1.5])
set(gca,'YTick',[-1.5:0.5:1.5])

% -----------------------------------
xx_inf = 0;
yy_inf = 0;
xx0 = 20/12;    % xx0 = P(0)
yy0 = 0;
[xx1 yy1] = nyquist(sysL,0.1);
[xx2 yy2] = nyquist(sysL,1);
[xx3 yy3] = nyquist(sysL,2.5);
[xx4 yy4] = nyquist(sysL,10);

plot(xx_inf, -yy_inf,'o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])
plot(xx4, -yy4,'o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])
plot(xx3, -yy3,'o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])
plot(xx2, -yy2,'o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])
plot(xx1, -yy1,'o','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])

plot(xx0,  yy0,'s','LineWidth',2,'MarkerSize',8,'MarkerFaceColor',[1 1 1])

plot(xx1,  yy1,'*','LineWidth',2,'MarkerSize',8)
plot(xx2,  yy2,'*','LineWidth',2,'MarkerSize',8)
plot(xx3,  yy3,'*','LineWidth',2,'MarkerSize',8)
plot(xx4,  yy4,'*','LineWidth',2,'MarkerSize',8)
plot(xx_inf,  yy_inf,'*','LineWidth',2,'MarkerSize',8)

legend({'$\omega = -\infty \rightarrow 0$',...
    '    $\omega = 0 \rightarrow \infty$',...
                '$\omega = -\infty$','$\omega = -10$','$\omega = -2.5$','$\omega = -1$','$\omega = -0.1$', ...
                '$\omega = 0$', ...
                '$\omega = 1$','$\omega = 10$','$\omega = 2.5$','$\omega = 100$','$\omega = \infty$'}, ...
          'Interpreter','latex','FontSize',16, ...
          'Location','eastoutside')

hold off

% -----------------------------------
figure(1); movegui('north')
