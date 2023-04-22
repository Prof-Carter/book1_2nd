% exercise_03_08.m
% ��� 3.9�FRL ��H�̃p�����[�^����
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 3.9')
disp('==================================================')

syms s
syms R L positive
syms T K positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(L*s + R) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(L*s + R)

[Ns Ds] = numden(Ps);            % P(s) = N(s)/D(s)
alpha = fliplr(coeffs(Ds,s));    % D(s) �̌W���̒��o

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = Np(s)/Dp(s)�iDp(s) �̒萔���� 1 �Ɂj')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Nps = collect(Ns/alpha(2),s)     % Np(s)
Dps = collect(Ds/alpha(2),s)     % Dp(s)

a = fliplr(coeffs(Dps,s));       % Dp(s) �̌W���̒��o
b = fliplr(coeffs(Nps,s));       % Np(s) �̌W���̒��o

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = K/(1 + T*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve([a(1)-T b-K],[T K]); % 1 ���x��v�f�̕W���`�̃p�����[�^

T = combine(sol.T)
K = combine(sol.K)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �} 3.2 ����ǂݎ���� T, K �̒l')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

T_val = 4e-3
K_val = 2e-2
 
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���肳�ꂽ R, L �̒l')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol2 = solve([T-T_val K-K_val],[R L]);

R = sol2.R
L = sol2.L

disp(' ')
R = double(R)
L = double(L)




