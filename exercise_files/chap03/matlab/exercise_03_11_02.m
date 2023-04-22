% exercise_03_11_02.m
% 問題 3.11 (2), (3)
% マス・ばね・ダンパ系のパラメータ同定

disp(' ')
disp('==================================================')
disp(' 問題 3.11 (2) ')
disp('==================================================')

clear
format compact

ymax = 0.05
yinf = 0.04
Tp   = 0.5

Amax = ymax - yinf

K    = yinf;
xi   = - (1/Tp)*log(Amax/yinf);
wn   = sqrt(xi^2 + (pi/Tp)^2);
zeta = xi/wn;

fprintf('\n')
fprintf('K    = %5.4e\n',K)
fprintf('xi   = %5.4e\n',xi)
fprintf('wn   = %5.4e\n',wn)
fprintf('zeta = %5.4e\n',zeta)

disp(' ')
disp('==================================================')
disp(' 問題 3.11 (3) ')
disp('==================================================')

k = 1/K;
M = k/wn^2;
c = 2*zeta*wn*M;

fprintf('k = %5.4e\n',k)
fprintf('M = %5.4e\n',M)
fprintf('c = %5.4e\n',c)

