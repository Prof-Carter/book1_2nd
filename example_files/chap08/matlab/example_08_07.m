% example_08_07.m
% 例 8.7：鉛直面を回転するアーム系（最適レギュレータによる設計）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.7 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]
   
for q1 = [4 20 100]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' ')
    disp('--- 重み Q, R ---')
    Q = diag([q1 0.001])
    R = 1

    disp(' ')
    disp('--- 状態フィードバックゲイン K ---')
    K = - lqr(A,B,Q,R)

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

legend('q1 = 4','q1 = 20','q1 = 100')

figure(2)
hold off
xlabel('t [s]')
ylabel('x2(t) [rad/s]')
ylim([-6 3])
grid on

figure(3)
hold off
xlabel('t [s]')
ylabel('u(t) [N{\cdot}m]')
ylim([-10 5])
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


