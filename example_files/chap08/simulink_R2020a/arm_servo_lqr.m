% arm_servo_lqr.m
% 最適レギュレータによる積分型サーボ制御（鉛直面を回転するアーム系）

%close all
clear
format compact

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ];
B = [ 0
      1/J ];
C = [ 1  0 ];

rc = 1;
dc = 1;
x0 = [ 0
       0 ];

Ae = [ A  zeros(2,1)
      -C  0 ];
Be = [ B
       0 ];
   
q1 = 1e-3;
q2 = 1e-3;
q3 = 5e4;
Q = diag([q1 q2 q3])
R = 1

Ke = - lqr(Ae,Be,Q,R);
    
K = Ke(1:2)
G = Ke(3)

sim('arm_sim_servo')

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t) = x1(t) [rad]')
ylim([0 1.5])
grid on

figure(2)
plot(t,u)
xlabel('t [s]')
ylabel('u(t) [Nm]')
ylim([-5 10])
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
