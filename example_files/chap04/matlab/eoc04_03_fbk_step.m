% eoc04_03_fbk_step.m
% フィードバック制御系における Gyr(s), Gyr(s), Gyr(s), Gyr(s) の導出と
% 目標値応答，外乱応答の描画

close all
clear
format compact

sysP = tf([5],[1 2 2])
sysC = 2
sysL = minreal(sysP*sysC)

% Gyr(s), Gyr(s), Gyr(s), Gyr(s) の導出
sysGyr = minreal(sysL/(1 + sysL))
sysGyd = minreal(sysP/(1 + sysL))
sysGer = 1 - sysGyr
sysGed = - sysGyd

% シミュレーション時間の定義
t = 0:0.01:10;

% 目標値応答の描画
y = step(sysGyr,t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')

% 外乱応答の描画
y = step(sysGyd,t);

figure(2)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
