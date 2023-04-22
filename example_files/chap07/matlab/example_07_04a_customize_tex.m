% example_07_04a_customize_tex.m
% ó· 7.4ÅFà¿íËó]óTÅiê} 7.13, 7.14Åj

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ó· 7.4 ')
disp('==================================================')

kP = 0:0.01:10;
Gm = -20*log10(kP/8);

kP2 = 1:0.01:10;
Pm = 180 - 3*atan(sqrt(kP2.^(2/3) - 1))*180/pi;

% -----------------------------------
figure(1)
set(gcf,'Position',[100 100 680 420]) 
subplot('Position',[0.15 0.15 0.65 0.775])

% -----------------------------------
figure(1)
yyaxis left
plot(kP,Gm,'LineWidth',1.5)

xlim([0 10])
set(gca,'XTick',0:1:10)
ylim([-2.5 40+2.5])
set(gca,'YTick',0:10:40)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('${k}_{\rm P}$','Interpreter','latex','FontSize',16)
ylabel('${G}_{\rm m}$ [dB]','Interpreter','latex','FontSize',16)

% -----------------------------------
figure(1)
yyaxis right
plot(kP2,Pm,'LineWidth',1.5)

ylim([-11.25 180+11.25])
set(gca,'YTick',0:45:180)

ylabel('${P}_{\rm m}$ [deg]','Interpreter','latex','FontSize',16)

grid on

% -----------------------------------
figure(1)
hold on
plot([0 10],[  0   0],'k-')
plot([0 10],[180 180],'k-')
plot([1  1],[-11.25 180+11.25],'k-')
plot([8  8],[-11.25 180+11.25],'k-')
hold off

% ****************************************************
t = 0:0.001:10;

s = tf('s');
sysP = 1/(s + 1)^3;

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

num = 0;
for kP = 2:2:8
    num = num + 1;

    sysL = minreal(sysP*kP);
    sysGyr = minreal(sysL/(1 + sysL));

    y = step(sysGyr,t);

    h(num) = plot(t,y,'LineWidth',1.5);
    hold on
end

plot([0 10],[1 1],'k')

xlim([0 10])
set(gca,'XTick',0:2:10)
ylim([0 2])
set(gca,'YTick',0:0.5:2)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$y(t)$','Interpreter','latex','FontSize',16)

hold off
grid on

legend(h,{'${k}_{\rm P} = 2$', ...
          '${k}_{\rm P} = 4$', ...
          '${k}_{\rm P} = 6$', ...
          '${k}_{\rm P} = 8$'}, ...
          'Interpreter','latex','FontSize',16)

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')


