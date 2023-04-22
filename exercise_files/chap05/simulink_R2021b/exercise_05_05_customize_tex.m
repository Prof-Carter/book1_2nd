% exercise_05_05_customize_tex.m
% 問題 5.5：目標値応答に注目した台車系の I-PD 制御

close all
clear
format compact

disp(' ')
disp('=====================================================')
disp(' 問題 5.5：目標値応答に注目した台車系の I-PD 制御')
disp('=====================================================')

s = tf('s');

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 y(s) = P(s)u(s), P(s) = 1/(M*s^2 + c*s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

M = 0.440
c = 8.32

sysP = 1/(M*s^2 + c*s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 3 次の規範モデル')
disp('                            wn^3                    ')
disp(' Gm3(s) = ------------------------------------------')
disp('          s^3 + alpha2*wm*s^2 + alpha1*wn^2*s + wn^3')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

wm = 20
alpha1 = 3
alpha2 = 3

sysGm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

kI = M*wm^3
kP = M*alpha1*wm^2
kD = M*alpha2*wm - c

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ u(s) = C3(s)r(s) - C1(s)y(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sysC1 = kP + kI/s + kD*s       % C1(s)
sysC3 =      kI/s              % C3(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C3(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sysPC1 = minreal(sysP*sysC1);
sysPC3 = minreal(sysP*sysC3);

sysGyr = minreal(sysPC3/(1 + sysPC1))

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sysGyd = minreal(sysP/(1 + sysPC1))

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 目標値 r(t) = rc = 1')
disp(' 外乱　 d(t) = dc = 0')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

rc = 1
dc = 0

% ++++++++++++++++++++++++++++++++++++++++++++++++++++
% シミュレーション
% ++++++++++++++++++++++++++++++++++++++++++++++++++++
sim('exercise_05_05_i_pd_cont')

% -------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y,'LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',16);
ylabel('$y(t) = z(t)$ [m]','Interpreter','latex','FontSize',16)

xlim([0 1])
ylim([0 1.5])
set(gca,'XTick',0:0.2:1)
set(gca,'YTick',0:0.5:1.5)

grid on

% -------------------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,u,'LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',16);
ylabel('$u(t) = f(t)$ [N]','Interpreter','latex','FontSize',16)

xlim([0 1])
ylim([-20 80])
set(gca,'XTick',0:0.2:1)
set(gca,'YTick',-20:20:80)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')


