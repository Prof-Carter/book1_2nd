% exercise_03_01_02b.m
% ��� 3.1 (2)
% f(t) = sin(w*t) 
%        exp(jw*t) - exp(-jw*t)
%      = ----------------------
%                 2j
% �̃��v���X�ϊ��i�I�C���[�̌����𗘗p�j
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 3.1 (2)')
disp('==================================================')

syms s
syms t real
syms w positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' f(t) = sin(w*t)')
disp('        exp(jw*t) - exp(-jw*t)')
disp('      = ----------------------')
disp('                 2j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

f(t) = (exp(j*w*t) - exp(-j*w*t))/2j

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �s��ϕ� F_indef(s) = �� f(t)*exp(-s*t) dt')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_indef(s) = int(f(t)*exp(-s*t),t)

assume(real(s) > 0)
assumptions(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' F_inf(s) = lim F_indef(s)')
disp('           t->inf')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_inf(s) = limit(F_indef(s),t,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' F_0(s) = lim F_indef(s)')
disp('          t->0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F_0(s) = limit(F_indef(s),t,0)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ��`���Ɋ�Â����u���X�ϊ� F(s) = F_inf(s) - F_0(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F(s) = F_inf(s) - F_0(s)


