% example_03_04.m
% �� 3.4�F�P�ʃC���p���X�֐��i�f���^�֐��j f(t) = ��(t) �̃��v���X�ϊ�
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 3.4�F�P�ʃC���p���X�֐��i�f���^�֐��jf(t) = ��(t)')
disp(' �@�@�@�@�̃��v���X�ϊ�')
disp('==================================================')

syms s
syms t real
syms e real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �C���p���X�֐� delta_e(t) = 1/e (0 <= t <= e)')
disp('+ �@�@�@�@�@�@�@�it < 0, e < t �ł� delta_e(t) = 0�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

delta_e(t) = 1/e

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ��`���Ɋ�Â��C���p���X�֐� delta_e(t) �̃��v���X�ϊ�')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Delta_e(s) = �� delta_e(t)*exp(-s*t) dt')
disp('+                      �i�ϕ���ԁF0 <= t <= e�j')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Delta_e(s) = int(delta_e(t)*exp(-s*t),t,0,e)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ��`���Ɋ�Â��P�ʃC���p���X�֐��i�f���^�֐��j��(t) ��')
disp('+ ���v���X�ϊ� F(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ F(s) = limit Delta_e(s)')
disp('+        e->0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

F(s) = limit(Delta_e(s),e,0)