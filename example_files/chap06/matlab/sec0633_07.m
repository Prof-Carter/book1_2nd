% sec0633_07.m
% 1 Ÿi‚İ—v‘f‚ÌƒQƒCƒ“‚ÆˆÊ‘Š·
% ySymbolic Math Toolbox ‚ª•K—vz

clear
format compact

disp(' ')
disp('==================================================')
disp(' 1 Ÿi‚İ—v‘f P(s) = 1 + Ts ‚ÌƒQƒCƒ“‚ÆˆÊ‘Š·')
disp('==================================================')

syms s
syms w positive
syms T positive     % ’è” T

Ps = 1 + T*s

disp(' ')
disp(' ---- P(jw) ----')
Pjw = subs(Ps,s,j*w)

disp(' ')
disp(' ---- ƒQƒCƒ“ Gg(w) ---- ')
a = real(Pjw);
b = imag(Pjw);
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp(' ---- ˆÊ‘Š· Gp(w) ---- ')
Gp = atan(b/a)
