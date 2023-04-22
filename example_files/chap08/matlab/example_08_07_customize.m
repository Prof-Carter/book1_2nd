% example_08_07_customize_tex.m
% �� 8.7�F�����ʂ���]����A�[���n�i�œK���M�����[�^�ɂ��݌v�j
% �i�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 8.7 ')
disp('==================================================')

arm_para

A = [ 0  1
     -M*g*l/J  -c/J ]
B = [ 0
      1/J ]
C = [ 1  0 ]

% -------------------------------------------
for i = 1:3
    figure(i)
    subplot('Position',[0.15 0.15 0.775 0.775])
end

% -------------------------------------------
for q1 = [4 20 100]
    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' ')
    disp('--- �d�� Q, R ---')
    Q = diag([q1 0.001])
    R = 1

    disp(' ')
    disp('--- ��ԃt�B�[�h�o�b�N�Q�C�� K ---')
    K = - lqr(A,B,Q,R)

    disp(' ')
    disp('--- A + B*K �̌ŗL�l ---')
    eig(A + B*K)

    sys = ss(A+B*K,[],eye(2),[]);

    t = 0:0.001:1.5;
    x0 = [ 1
           0 ];
    x = initial(sys,x0,t);

    u = K*x';

    figure(1)
    plot(t,x(:,1),'LineWidth',1.5)
    hold on

    figure(2)
    plot(t,x(:,2),'LineWidth',1.5)
    hold on

    figure(3)
    plot(t,u,'LineWidth',1.5)
    hold on
end

% -------------------------------------------
figure(1)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x1(t) [rad]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-0.5 1])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-0.5:0.25:1.5)

grid on

legend({'q1 = 4','q1 = 20','q1 = 100'}, ...
        'FontName','Arial','FontSize',14)

% -------------------------------------------
figure(2)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('x2(t) [rad/s]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-6 3])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-6:1.5:3)

grid on

% -------------------------------------------
figure(3)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('t [s]','FontName','Arial','FontSize',16)
ylabel('u(t) [N{\cdot}m]','FontName','Arial','FontSize',16)

xlim([0 1.5])
ylim([-10 5])
set(gca,'XTick',0:0.5:1.5)
set(gca,'YTick',-10:2.5:5)

grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')


