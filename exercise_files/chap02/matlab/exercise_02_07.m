% exercise_02_07.m
% 問題 2.7
% 台車系（ラグランジュの運動方程式）
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 2.7')
disp('==================================================')

syms M c real
syms z dz ddz f real

q   = z;       % 位置
dq  = dz;      % 速度
ddq = ddz;     % 加速度
u   = f;       % 入力

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 運動エネルギー K')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

K = (1/2)*M*dq^2

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 位置エネルギー U')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

U = 0

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 損失エネルギー D')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

D = (1/2)*c*dq^2

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ラグランジアン L = K- U')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

L = K - U

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ L を dq/dt で偏微分')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

dLq  = diff(L,dq)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ L を dq/dt で偏微分したものを時間微分')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ddLq = diff(dLq,dq)*ddq + diff(dLq,q)*dq

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ラグランジュの運動方程式')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

eq   = ddLq - diff(L,q) + diff(D,dq) - u;
eq = simplify(eq')
