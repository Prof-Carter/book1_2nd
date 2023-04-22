% example_03_12.m
% 例 3.12：例 3.10 の単位ランプ応答における部分分数分解
% 　　　　（ヘビサイドの公式）
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 3.11 ')
disp('==================================================')

close all
clear
format compact

syms s
syms t real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s) = 1/(s + 1)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
Ps = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(t) = t')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = t              % もしくは以下のように記述
us = laplace(ut)    % us = 1/s^2

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

[num_ys den_ys] = numden(ys);
p = solve(den_ys);      % y(s) の分母を 0 とする解 p
p = sort(p,'descend')   % p を降べきの順に並び替え

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ヘビサイドの公式')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp(' ')
dfs = diff((s - p(1))^2*ys,s)

disp(' ')
k(1,1) = subs((s - p(1))^2*ys,s,p(1));  % k1,2
k(2,1) = subs(dfs,s,p(2));              % k1,1
k(3,1) = subs((s - p(3))*ys,s,p(3));    % k2

disp(' ')
disp(' ----- k1,2 -----')
k(1,1)

disp(' ')
disp(' ----- k1,1 -----')
k(2,1)

disp(' ')
disp(' ----- k2 -----')
k(3,1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 単位ランプ応答 y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = k(1)*t*exp(p(1)*t) + k(2)*exp(p(2)*t) + k(3)*exp(p(3)*t)

% ----- グラフの描画 ----------------------------------
figure(1)
fplot(yt,[0 5])
xlabel('t [s]')
ylabel('y(t)')
grid on
