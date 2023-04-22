% sec0633_07.m
% 1 ���i�ݗv�f�̃Q�C���ƈʑ���
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' 1 ���i�ݗv�f P(s) = 1 + Ts �̃Q�C���ƈʑ���')
disp('==================================================')

syms s
syms w positive
syms T positive     % ���萔 T

Ps = 1 + T*s

disp(' ')
disp(' ---- P(jw) ----')
Pjw = subs(Ps,s,j*w)

disp(' ')
disp(' ---- �Q�C�� Gg(w) ---- ')
a = real(Pjw);
b = imag(Pjw);
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp(' ---- �ʑ��� Gp(w) ---- ')
Gp = atan(b/a)
