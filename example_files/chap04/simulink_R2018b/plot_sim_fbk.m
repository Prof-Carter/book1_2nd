% plot_sim_fbk.m
% Simulink �𗘗p�����ڕW�l�����ƊO�������̕`��

close all
clear
format compact

% ---------------------------------------
rc = 1;  dc = 0;                    % �ڕW�l r(t) = rc = 1�C�O�� d(t) = dc = 0
sim('sim_fbk')                      % Simulink ���f�� sim_fbk.slx �̎��s

figure(1)                           % Figure 1 ���w��
plot(t,y)                           % �ڕW�l���� y(t) ��`��
xlabel('t [s]'); ylabel('y(t)')     % �����̃��x���C�c���̃��x��

% ---------------------------------------
rc = 0;  dc = 1;                    % �ڕW�l r(t) = rc = 0�C�O�� d(t) = dc = 1
sim('sim_fbk')                      % Simulink ���f�� sim_fbk.slx �̎��s

figure(2)                           % Figure 2 ���w��
plot(t,y)                           % �O������ y(t) ��`��
xlabel('t [s]'); ylabel('y(t)')     % �����̃��x���C�c���̃��x��

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
