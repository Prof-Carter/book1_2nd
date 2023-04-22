% sec0632_03.m
% 2 次遅れ要素のピーク角周波数と共振ピーク
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 2 次遅れ要素のピーク角周波数と共振ピーク ')
disp('==================================================')

syms s

syms w positive   
syms eta positive   % eta = w/wn

syms wn zeta positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   　　　　　                  wn^2')
disp(' 2 次遅れ要素 P(s) = -------------------------')
disp('   　　　　　        s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 周波数伝達関数 P(jw) (eta = w/wn)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)
Pjw = simplify(subs(Pjw,w,wn*eta))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ゲイン Gg(w) = sqrt(a^2 + b^2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

% Gg = abs(Pjw)
a = real(Pjw);
b = imag(Pjw);
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ゲイン Gg(w) = 1/sqrt(f(eta))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp(' ')
disp(' ---- f(eta) ---- ')
[num den] = numden(Gg^2);
f = den

disp(' ')
disp(' ---- f''(eta) ---- ')
df = diff(f,eta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' f''(eta) = 0 となる eta = eta_p ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(df,eta,'ReturnConditions',true);
eta_p = sol.eta

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' eta_p が存在するための zeta の条件 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol_conditions = sol.conditions;
sol_zeta = solve(sol_conditions,zeta,'ReturnConditions',true);
subs(sol_zeta.conditions,sol_zeta.zeta,zeta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ピーク角周波数 wp = wn*eta_p ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wp = wn*eta_p

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 最小値 fmin = f(eta_p) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

fmin = subs(f,eta,eta_p);
fmin = simplify(fmin)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 共振ピーク Mp = Gg(wp) = 1/sqrt(fmin)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Mp = 1/sqrt(fmin)

