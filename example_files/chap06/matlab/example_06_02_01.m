% example_06_02_01.m
% α 6.2 (1)Fόg`BΦΖQCCΚ·
% ySymbolic Math Toolbox ͺKvz

clear
format compact

syms s
syms w positive

disp(' ')
disp('==================================================')
disp(' α 6.2 (1) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[P(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Pjw = real(Pjw);
real_Pjw = simplify(real_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Im[P(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

imag_Pjw = imag(Pjw);
imag_Pjw = simplify(imag_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gg(w) = |P(jw)| ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg = sqrt(real_Pjw^2 + imag_Pjw^2);
Gg = simplify(Gg)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gp(w) = ΪP(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp = atan(imag_Pjw/real_Pjw);
Gp = simplify(Gp)
