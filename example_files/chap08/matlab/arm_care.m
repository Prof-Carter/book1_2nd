% arm_care.m
% リッカチ方程式と最適レギュレータ（鉛直面を回転するアーム系）

close all
clear
format compact

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ];
B = [ 0
      1/J ];
   
Q = diag([20 0.001]);
R = 1;
P = care(A,B,Q,R)
K = - inv(R)*B'*P

eig(A + B*K)

sys = ss(A+B*K,[],eye(2),[]);

t = 0:0.001:1.5;
x0 = [ 1
       0 ];
x = initial(sys,x0,t);

u = K*x';

figure(1)
plot(t,x(:,1))
xlabel('t [s]')
ylabel('x1(t) [rad]')
ylim([-0.5 1])
grid on

figure(2)
plot(t,x(:,2))
xlabel('t [s]')
ylabel('x2(t) [rad/s]')
ylim([-10 5])
grid on

figure(3)
plot(t,u)
xlabel('t [s]')
ylabel('u(t) [Nm]')
ylim([-10 5])
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')

