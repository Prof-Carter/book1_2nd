% exercise_03_07b.m
% ��� 3.7�F1 ���x��n�̃C���p���X����
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 3.7 ')
disp('==================================================')

syms s
syms t real
syms T K positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = K/(1 + T*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = K/(1 + T*s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(t) = ��(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' u(s) = L[u(t)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ut = dirac(t)       % �������͈ȉ��̂悤�ɋL�q
us = laplace(ut)    % us = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

ys = Ps*us

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �C���p���X���� y(t)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

yt = ilaplace(ys)

% -------------------------------------------
for T_val = [0.5 1 2]
    figure(1)
    fplot(subs(yt,{T,K},{T_val,1}),[0 5])
    hold on
end

figure(1)
hold off

xlabel('t [s]')
ylabel('y(t)')
grid on

legend('T = 0.5, K = 1', 'T = 1, K = 1', 'T = 2, K = 1')

% -------------------------------------------
for K_val = [0.5 1 2]
    figure(2)
    fplot(subs(yt,{T,K},{1,K_val}),[0 5])
    hold on
end

figure(2)
hold off

xlabel('t [s]')
ylabel('y(t)')
grid on

legend('T = 1, K = 0.5', 'T = 1, K = 1', 'T = 1, K = 2')

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
