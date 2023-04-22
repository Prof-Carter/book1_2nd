% example_08_08.m
% 例 8.8：鉛直面を回転するアーム系（最適レギュレータによる目標値追従制御）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 8.8 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]

% -------------------------------------------
rc = 1;
dc = 1;
x0 = [ 0
       0 ];

% -------------------------------------------
for i = 1:3
    if i == 1
        q1 = 4;
    elseif i == 2
        q1 = 20;
    else
        q1 = 100;
    end

    q2 = 1e-3;
    
    disp(' --------------------------- ')
    Q = diag([q1 q2])
    R = 1

    K = - lqr(A,B,Q,R)
    
    M = [ A  B
          C  0 ];
    H = [ -K  1 ]*inv(M)*[ zeros(2,1)
                           1 ]

    sim('arm_sim_following')

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

% -------------------------------------------
figure(1)
hold off
xlabel('t [s]')
ylabel('y(t) = x1(t) [rad]')
ylim([0 1.5])
grid on

legend({'q1 = 4','q1 = 20','q1 = 100'},...
        'Location','southeast')

% -------------------------------------------
figure(2)
hold off
xlabel('t [s]')
ylabel('x2(t) [rad/s]')
ylim([-1 6])
grid on

% -------------------------------------------
figure(3)
hold off
xlabel('t [s]')
ylabel('u(t) [N{\cdot}m]')
ylim([-5 10])
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')

