% exercise_07_01.m
% 問題 7.1：L(s) = P(s)C(s) のベクトル軌跡が虚軸や実軸と交わる点
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 7.1： ')
disp(' L(s) = P(s)C(s) のベクトル軌跡が虚軸や実軸と交わる点 ')
disp('==================================================')

syms s
syms w real   
syms eta positive   % eta = w/wn
syms wn zeta positive

syms kP positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   　　　　　                  wn^2')
disp(' 2 次遅れ要素 P(s) = -------------------------')
disp('   　　　　　        s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)
Cs = kP

% P(s) = wn^2/(s^2 + 2*zeta*wn*s + wn^2)
% C(s) = kP

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 開ループ伝達関数 L(s) = P(s)C(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ls = Ps*Cs

% L(s) = P(s)*C(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 周波数伝達関数 L(jw) (eta = w/wn)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw = subs(Ls,s,j*w)
Ljw = subs(Ljw,w,wn*eta);
Ljw = simplify(Ljw)

% Ljw = L(j*w)
% Ljw = L(j*wn*eta)
% Ljw = simplify(Ljw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[L(jw)] = 0 となる eta = eta1 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Ljw = real(Ljw)

eta1 = solve(real_Ljw,eta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 始点：w -> 0 (eta -> 0) としたときの L(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

limit_Ljw_0 = limit(Ljw,eta,0)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 終点：w -> infty (eta -> infty) としたときの L(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

limit_Ljw_inf = limit(Ljw,eta,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[L(jw)] = 0 となる w = w1 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

w1 = wn*eta1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(jw) が虚軸と交わる点 (0, beta) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw1 = subs(Ljw,eta,eta1);

beta = imag(Ljw1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Im[L(jw)] = 0 となる 0 < eta < Inf ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

imag_Ljw = imag(Ljw)

disp(' ')
sol = solve(imag_Ljw,eta)

disp(' ')
if isempty(sol) == 1    % sol が空行列 (Empty) なら isempty(sol) は 1
    disp('sol が Empty なので，Im[L(jw)] = 0 となる（L(jw) が実軸と交わる）')
    disp('ような 0 < eta < Inf は存在しない')
end


