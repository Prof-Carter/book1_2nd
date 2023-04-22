% exercise_03_04a.m
% 問題 3.4：単位ステップ応答の描画

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (1) ')
disp('==================================================')

sysP = 3/(s + 2)
y = step(sysP,t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (2) ')
disp('==================================================')

sysP = (s + 4)/((s + 1)*(s + 2))
y = step(sysP,t);

figure(2)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (3) ')
disp('==================================================')

sysP = 2/(s + 1)^2
y = step(sysP,t);

figure(3)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (4) ')
disp('==================================================')

sysP = 5/(s^2 + 2*s + 5)
y = step(sysP,t);

figure(4)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


