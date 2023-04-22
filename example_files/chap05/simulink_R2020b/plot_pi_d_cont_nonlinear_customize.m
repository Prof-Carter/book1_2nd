% plot_pid_cont_nonlinear_customize.m
% �����ʂ���]����A�[���n�� PI-D ����̔���`�V�~�����[�V����
% �i�O���t�̕`����J�X�^�}�C�Y�j

close all
clear
format compact

arm_para
a0 = M*g*l/J; a1 = c/J; b0 = 1/J;
% ---------------------------------------
wm = 10; alpha1 = 1.4;

disp('***** �ڕW�l�����ɒ��ڂ��� PI-D ���� *****')
kI = (wm*a0)/(alpha1*b0)
kP = wm^2/b0
kD = (alpha1*wm)/b0 - a1/b0 + a0/(alpha1*wm*b0)

for k = [1 4]
    rc = k*30*(pi/180);
    dc = k*0.5;

    sim('arm_sim_pi_d_cont')
    figure(k)
    subplot('Position',[0.15 0.15 0.8 0.8])
    plot(t,y*(180/pi),'LineWidth',1.5)
    hold on

    sim('arm_sim_pi_d_cont_nonlinear')
    figure(k)
    plot(t,y*(180/pi),'LineWidth',1.5)
    hold off
    % ---------------------------------------
    set(gca,'FontName','arial','FontSize',14)
    xlabel('t [s]','FontName','arial','FontSize',16)
    ylabel('y(t) [deg]','FontName','arial','FontSize',16)

    grid on
    legend('���`�V�~�����[�V����','����`�V�~�����[�V����')
    set(legend,'FontName','MS Gothic','FontSize',14)
    ylim(k*[0 45])
    set(gca,'YTick',k*[0:7.5:45])
end

figure(1); movegui('northwest')
figure(4); movegui('northeast')
