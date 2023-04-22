% arm_acker_customize_tex.m
% �ɔz�u�@�i�����ʂ���]����A�[���n�j
% �F�A�b�J�[�}���̋ɔz�u�A���S���Y��
% �i�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ];
B = [ 0
      1/J ];
   
p(1) = - 8 + 8j;
p(2) = - 8 - 8j;

K = - acker(A,B,p)

eig(A + B*K)

sys = ss(A+B*K,[],eye(2),[]);

t = 0:0.001:1.5;
x0 = [ 1
       0 ];
x = initial(sys,x0,t);

u = K*x';

% -------------------------------------------
for i = 1:3
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
figure(1)
plot(t,x(:,1),'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-0.5 1])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-0.5:0.25:1.5)

grid on

% -------------------------------------------
figure(2)
plot(t,x(:,2),'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:5:5)

grid on

% -------------------------------------------
figure(3)
plot(t,u,'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:5:5)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
