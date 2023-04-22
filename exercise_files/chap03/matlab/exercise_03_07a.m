% exercise_03_07a.m
% 問題 3.7：1 次遅れ系のインパルス応答

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 3.7 ')
disp('==================================================')

s = tf('s');
t = 0:0.001:5;

% -------------------------------------------
K = 1;

for T_val = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' P(s) = K/(1 + T*s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysP = K/(1 + T_val*s)

    y = impulse(sysP,t);

    figure(1)
    plot(t,y)
    hold on
end

figure(1)
hold off

xlabel('t [s]')
ylabel('y(t)')
grid on

legend('T = 0.5, K = 1', 'T = 1, K = 1', 'T = 2, K = 1')

% -------------------------------------------
T = 1;

for K_val = [0.5 1 2]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' P(s) = K/(1 + T*s)')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysP = K_val/(1 + T*s)

    y = impulse(sysP,t);

    figure(2)
    plot(t,y)
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
