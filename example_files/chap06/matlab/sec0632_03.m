% sec0632_03.m
% 2 ���x��v�f�̃s�[�N�p���g���Ƌ��U�s�[�N
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' 2 ���x��v�f�̃s�[�N�p���g���Ƌ��U�s�[�N ')
disp('==================================================')

syms s

syms w positive   
syms eta positive   % eta = w/wn

syms wn zeta positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   �@�@�@�@�@                  wn^2')
disp(' 2 ���x��v�f P(s) = -------------------------')
disp('   �@�@�@�@�@        s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� P(jw) (eta = w/wn)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)
Pjw = simplify(subs(Pjw,w,wn*eta))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Q�C�� Gg(w) = sqrt(a^2 + b^2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

% Gg = abs(Pjw)
a = real(Pjw);
b = imag(Pjw);
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Q�C�� Gg(w) = 1/sqrt(f(eta))')
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
disp(' f''(eta) = 0 �ƂȂ� eta = eta_p ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(df,eta,'ReturnConditions',true);
eta_p = sol.eta

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' eta_p �����݂��邽�߂� zeta �̏��� ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol_conditions = sol.conditions;
sol_zeta = solve(sol_conditions,zeta,'ReturnConditions',true);
subs(sol_zeta.conditions,sol_zeta.zeta,zeta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �s�[�N�p���g�� wp = wn*eta_p ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wp = wn*eta_p

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ŏ��l fmin = f(eta_p) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

fmin = subs(f,eta,eta_p);
fmin = simplify(fmin)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���U�s�[�N Mp = Gg(wp) = 1/sqrt(fmin)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Mp = 1/sqrt(fmin)

