% exercise_06_08_01.m
% ��� 6.8 (1)�FRLC ��H�̋��U�i���U�𐶂��Ȃ������j
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.8 (1)�F���U�𐶂��Ȃ�����')
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
disp(' ���U�𐶂��Ȃ� R �̏���')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(zeta >= 1/sqrt(2),R,'ReturnConditions',true);    % �� >= 1/sqrt(2) �� R �ɂ��ĉ���
condition = subs(sol.conditions,R);
condition = combine(condition)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L = 200 [mH], C = 10 [��F] �Ƃ����Ƃ���')
disp(' ���U�𐶂��Ȃ� R �̏���')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

subs(condition,{L,C},{200e-3,10e-6})





