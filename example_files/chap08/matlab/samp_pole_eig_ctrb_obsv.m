% samp_pole_eig_ctrb_obsv.m
% ���萫�C���䐫�C�ϑ���

arm_ss      % arm_ss.m �̎��s

[A B C D] = ssdata(sys);

disp(' ')
disp('*******************************')
disp('--- �V�X�e���̋� ---')
pole(sys)

disp(' ')
disp('--- A �̌ŗL�l ---')
eig(A)

disp(' ')
disp('*******************************')
disp('--- ����s�� Vc ---')
Vc = ctrb(A,B)

disp(' ')
disp('--- |Vc| ---')
det(Vc)

disp(' ')
disp('--- rank(Vc) ---')
rank(Vc)

disp(' ')
disp('*******************************')
disp('--- �ϑ��s�� Vo ---')
Vo = obsv(A,C)

disp(' ')
disp('--- |Vo| ---')
det(Vo)

disp(' ')
disp('--- rank(Vo) ---')
rank(Vo)
