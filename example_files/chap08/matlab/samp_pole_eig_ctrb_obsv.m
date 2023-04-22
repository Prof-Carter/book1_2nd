% samp_pole_eig_ctrb_obsv.m
% 安定性，可制御性，可観測性

arm_ss      % arm_ss.m の実行

[A B C D] = ssdata(sys);

disp(' ')
disp('*******************************')
disp('--- システムの極 ---')
pole(sys)

disp(' ')
disp('--- A の固有値 ---')
eig(A)

disp(' ')
disp('*******************************')
disp('--- 可制御行列 Vc ---')
Vc = ctrb(A,B)

disp(' ')
disp('--- |Vc| ---')
det(Vc)

disp(' ')
disp('--- rank(Vc) ---')
rank(Vc)

disp(' ')
disp('*******************************')
disp('--- 可観測行列 Vo ---')
Vo = obsv(A,C)

disp(' ')
disp('--- |Vo| ---')
det(Vo)

disp(' ')
disp('--- rank(Vo) ---')
rank(Vo)
