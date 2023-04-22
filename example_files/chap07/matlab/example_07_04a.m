% example_07_04a.m
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
yyaxis left
plot(kP,Gm)

xlim([0 10])
set(gca,'XTick',0:1:10)
ylim([-2.5 40+2.5])
set(gca,'YTick',0:10:40)

xlabel('kP')
ylabel('Gm [dB]')

% -----------------------------------
figure(1)
yyaxis right
plot(kP2,Pm)

ylim([-11.25 180+11.25])
set(gca,'YTick',0:45:180)

ylabel('Pm [deg]')

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

num = 0;
for kP = 2:2:8
    num = num + 1;

    sysL = minreal(sysP*kP);
    sysGyr = minreal(sysL/(1 + sysL));

    y = step(sysGyr,t);

    h(num) = plot(t,y);
    hold on
end

plot([0 10],[1 1],'k')

xlim([0 10])
set(gca,'XTick',0:2:10)
ylim([0 2])
set(gca,'YTick',0:0.5:2)

xlabel('t [s]')
ylabel('y(t)')

hold off
grid on

legend(h,{'kP = 2','kP = 4','kP = 6','kP = 8'})

% -----------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')


