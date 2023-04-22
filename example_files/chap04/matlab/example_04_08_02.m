% example_04_08_02.m
% �� 4.8 (2)�F���E�X�̈��蔻�ʖ@�i�����n�j

clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 4.8 (2) ')
disp('==================================================')

s = tf('s');
Delta = s^4 + 4*s^3 + 11*s^2 + 14*s + 10

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ���E�X�̈��蔻�ʖ@')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

denP = tfdata(Delta,'v');

rhStabilityCriterion_jpn    % rhStabilityCriterion_jpn.m �̎��s

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ���������� ��(s) = 0 �̉�')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

roots(denP)
