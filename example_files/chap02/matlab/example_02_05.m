% example_02_05.m
% 例 2.5
% 鉛直面を回転するアーム系（ラグランジュの運動方程式）
% 【Symbolic Math Toolbox が必要】

disp(' ')
disp('==================================================')
disp(' 例 2.5 ')
disp('==================================================')

clear
format compact

syms M g l Jg c real
syms th dth ddth tau real

q   = th;       % 角度　　　：q = θ
dq  = dth;      % 角速度　　：ω = dθ/dt
ddq = ddth;     % 角加速度　：dω/dt
u   = tau;      % 入力トルク：τ

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 重心座標 (px, py)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

px = - l*sin(q)
py = - l*cos(q)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ d(px)/dt')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

dpx = diff(px,q)*dq

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ d(py)/dt')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

dpy = diff(py,q)*dq

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 運動エネルギー K')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

K = (1/2)*M*dpx^2 + (1/2)*M*dpy^2 + (1/2)*Jg*dq^2

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 位置エネルギー U')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

U = M*g*py

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

% ------------------------------------------------------
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
