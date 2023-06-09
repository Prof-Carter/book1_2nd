% sec0633_07.m
% 1 次進み要素のゲインと位相差
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 1 次進み要素 P(s) = 1 + Ts のゲインと位相差')
disp('==================================================')

syms s
syms w positive
syms T positive     % 時定数 T

Ps = 1 + T*s

disp(' ')
disp(' ---- P(jw) ----')
Pjw = subs(Ps,s,j*w)

disp(' ')
disp(' ---- ゲイン Gg(w) ---- ')
a = real(Pjw);
b = imag(Pjw);
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp(' ---- 位相差 Gp(w) ---- ')
Gp = atan(b/a)
