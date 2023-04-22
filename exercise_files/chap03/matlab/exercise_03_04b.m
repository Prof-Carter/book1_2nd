% exercise_03_04b.m
% 問題 3.4：単位ステップ応答の計算と描画
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

syms s
syms t real

ut = sym(1)         % もしくは以下のように記述
us = laplace(ut)    % us = 1/s

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (1) ')
disp('==================================================')

Ps = 3/(s + 2)

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(1)
fplot(yt,[0 8])
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (2) ')
disp('==================================================')

Ps = (s + 4)/((s + 1)*(s + 2))

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(2)
fplot(yt,[0 8])
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (3) ')
disp('==================================================')

Ps = 2/(s + 1)^2

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(3)
fplot(yt,[0 8])
xlabel('t [s]')
ylabel('y(t)')
grid on

disp(' ')
disp('==================================================')
disp(' 問題 3.4 (4) ')
disp('==================================================')

Ps = 5/(s^2 + 2*s + 5)

ys = Ps*us
ys = partfrac(ys)   % 省略しても良い

yt = ilaplace(ys)

figure(4)
fplot(yt,[0 8])
xlabel('t [s]')
ylabel('y(t)')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


