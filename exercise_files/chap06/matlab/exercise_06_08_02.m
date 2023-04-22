% exercise_06_08_02.m
% ��� 6.8 (2)�FRLC ��H�̋��U�i���U�𐶂���Ƃ��̃s�[�N�l�j
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.8 (2)�F���U�𐶂���Ƃ��̃s�[�N�l')
disp('==================================================')

syms s
syms R L C positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(L*C*s^2 + R*C*s + 1)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(L*C*s^2 + R*C*s + 1)

[Ns Ds] = numden(Ps);            % P(s) = N(s)/D(s)
alpha = fliplr(coeffs(Ds,s));    % D(s) �̌W���̒��o

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = Np(s)/Dp(s)�iDp(s) �� s^2 �̌W���� 1 �Ɂj')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Nps = collect(Ns/alpha(1),s)     % Np(s)
Dps = collect(Ds/alpha(1),s)     % Dp(s)

a = fliplr(coeffs(Dps,s));       % Dp(s) �̌W���̒��o
b = fliplr(coeffs(Nps,s));       % Np(s) �̌W���̒��o

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('P(s) = K*wn^2/(s^2 + 2*zeta*wn*s + wn^2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ŗL�p���g���Fwn')
disp(' �����W���F��')
disp(' �Q�C���FK')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms wn zeta K positive

sol = solve([a(2)-2*zeta*wn ...
             a(3)-wn^2 ...
             b-K*wn^2],[wn zeta K]);    % 2 ���x��v�f�̕W���`�̃p�����[�^

wn   = combine(sol.wn)      % combine �ɂ�蓯���㐔�I�\���̍�������
zeta = combine(sol.zeta)    % combine �ɂ�蓯���㐔�I�\���̍�������
K    = combine(sol.K)       % combine �ɂ�蓯���㐔�I�\���̍�������


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L = 200 [mH], C = 10 [��F], R = 100 [��]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

L_val = 200e-3
C_val =  10e-6
R_val = 100

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ŗL�e���g�� wn')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wn = subs(wn,{L,C,R},{L_val,C_val,R_val});
wn = simplify(wn)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �����W�� ��')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

zeta = subs(zeta,{L,C,R},{L_val,C_val,R_val});
zeta = simplify(zeta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('  �s�[�N�p���g�� wp = wn*(1 - 2*zeta^2)^(1/2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wp = wn*sqrt(1 - 2*zeta^2)
wp = double(wp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���U�s�[�N Mp = 1/(2*zeta*(1 - zeta^2)^(1/2)) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Mp = 1/(2*zeta*sqrt(- zeta^2 + 1));
Mp = simplify(Mp)
Mp = double(Mp)



