% exercise_03_10.m
% ��� 3.10�FRLC ��H���I�[�o�[�V���[�g�𐶂��Ȃ�����
% �ySymbolic Math Toolbox ���K�v�z

disp(' ')
disp('==================================================')
disp(' ��� 3.10 ')
disp('==================================================')

clear
format compact

syms s
syms R L C positive

disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = C/(L*C*s^2 + R*C*s + 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = C/(L*C*s^2 + R*C*s + 1)

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
disp(' �ŗL�p���g���F��n')
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
disp(' �I�[�o�[�V���[�g�𐶂��Ȃ� R �̏���')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(zeta >= 1,R,'ReturnConditions',true);    % �� >= 1 �� R �ɂ��ĉ���
condition = subs(sol.conditions,R)



