% exercise_04_08_02b.m
% ��� 4.8 (2)�F�P�ʃX�e�b�v�O���ɑ΂�����l
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 4.8 (2) ')
disp('==================================================')

syms s
syms kP kI real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ����Ώ� P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �R���g���[�� C(s) = (kP*s + kI)/s')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = (kP*s + kI)/s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyds = Ps/(1 + Ps*Cs);
Gyds = collect(Gyds,s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �t���r�b�c�̈��蔻�ʖ@')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[N D] = numden(Gyds);
Delta = D;
Delta = collect(Delta,s)

hurwitz_sym     % hurwitz_sym.m �̎��s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �P�ʃX�e�b�v�O���ɑ΂�����l y_inf = Gyd(0)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

y_inf = subs(Gyds,s,0)

