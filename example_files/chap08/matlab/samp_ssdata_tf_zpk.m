% samp_ssdata_tf_zpk.m
% ��ԋ�ԕ\���̌W���s��̒��o
% ��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ�

arm_ss      % arm_ss.m �̎��s

disp(' ')
disp('--- ��ԋ�ԕ\���̌W���s��̒��o ---')
[A B C D] = ssdata(sys)

disp(' ')
disp('--- ��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ� ---')
sysP = tf(sys)


disp(' ')
disp('--- ��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ� ---')
disp('--- �i��_/��/�Q�C�����f���j ---')
sysP = zpk(sys)
