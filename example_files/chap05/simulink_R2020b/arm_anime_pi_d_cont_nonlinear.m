% arm_anime_pi_d_cont_nonlinear.m
% �����ʂ���]����A�[���n�� PI-D ����̔���`�V�~�����[�V�������ʂ�
% �A�j���[�V�����\��

close all
clear
format compact

arm_para    % arm_para.m �̎��s
a0 = M*g*l/J; a1 = c/J; b0 = 1/J;

% ---------------------------------------
wm = 10; alpha1 = 1.4;

disp('***** �ڕW�l�����ɒ��ڂ��� PI-D ���� *****')
kI = (wm*a0)/(alpha1*b0)
kP = wm^2/b0
kD = (alpha1*wm)/b0 - a1/b0 + a0/(alpha1*wm*b0)

% ---------------------------------------
k= 4;
rc = k*30*(pi/180);
dc = k*0.5;

sim('arm_sim_pi_d_cont_nonlinear')

arm_anime   % arm_anime.m �̎��s
