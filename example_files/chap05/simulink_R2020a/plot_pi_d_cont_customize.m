% plot_pid_cont_customize.m
% �����ʂ���]����A�[���n�� PI-D ����i�O���t�̕`����J�X�^�}�C�Y�j

close all
clear
format compact

arm_para
a0 = M*g*l/J; a1 = c/J; b0 = 1/J;

rc = 30*(pi/180);
dc = 0.5;
% ---------------------------------------
wm = 10; alpha1 = 1.4;

disp('***** �ڕW�l�����ɒ��ڂ��� PI-D ���� *****')
kI = (wm*a0)/(alpha1*b0)
kP = wm^2/b0
kD = (alpha1*wm)/b0 - a1/b0 + a0/(alpha1*wm*b0)

sim('arm_sim_pi_d_cont')

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])

plot(t,y*(180/pi),'LineWidth',1.5);
hold on
% ---------------------------------------
wm = 10; alpha1 = 2; alpha2 = 2;

disp('***** �O�������ɒ��ڂ��� PI-D ���� *****')
kI = wm^3/b0
kP = (alpha1*wm^2)/b0 - a0/b0
kD = (alpha2*wm)/b0 - a1/b0

sim('arm_sim_pi_d_cont')

figure(1); plot(t,y*(180/pi),'--','LineWidth',1.5)
hold off
% ---------------------------------------

set(gca,'FontName','arial','FontSize',14)
xlabel('t [s]','FontName','arial','FontSize',16)
ylabel('y(t) [deg]','FontName','arial','FontSize',16)

ylim([0 45])
set(gca,'YTick',[0:7.5:45])

grid on

legend('�ڕW�l�����ɒ���','�O�������ɒ���')
set(legend,'FontName','MS Gothic','FontSize',14)

