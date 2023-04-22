% example_08_06_02.m
% 例 8.6：鉛直面を回転するアーム系：極配置法による設計

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.6 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]
   
for i = 1:3
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    if i == 1
        p(1) = - 4 + 8j;
        p(2) = - 4 - 8j;
    elseif i == 2
        p(1) = - 8 + 8j;
        p(2) = - 8 - 8j;
    else
        p(1) = - 4 + 16j;
        p(2) = - 4 - 16j;
    end

    disp(' ')
    disp('--- 指定する極 p ---')
    p'

    disp(' ')
    disp('--- 状態フィードバックゲイン K ---')
    K = - acker(A,B,p)

    disp(' ')
    disp('--- A + B*K の固有値 ---')
    eig(A + B*K)

    sys = ss(A+B*K,[],eye(2),[]);

    t = 0:0.001:1.5;
    x0 = [ 1
           0 ];
    x = initial(sys,x0,t);

    u = K*x';

    figure(1)
    plot(t,x(:,1))
    hold on

    figure(2)
    plot(t,x(:,2))
    hold on

    figure(3)
    plot(t,u)
    hold on
end


figure(1)
hold off
xlabel('t [s]')
ylabel('x1(t) [rad]')
ylim([-0.5 1])
grid on

legend('-4+8j, -4-8j',...
       '-8+8j, -8-8j',...
       '-4+16j, -4-16j')

figure(2)
hold off
xlabel('t [s]')
ylabel('x2(t) [rad/s]')
ylim([-12 6])
grid on

figure(3)
hold off
xlabel('t [s]')
ylabel('u(t) [N{\cdot}m]')
ylim([-20 10])
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


