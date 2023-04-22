% plot_pi_d_cont_nonlinear.m
% �����ʂ���]����A�[���n�� PI-D ����̔���`�V�~�����[�V����

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
    figure(k); plot(t,y*(180/pi))
    hold on

    sim('arm_sim_pi_d_cont_nonlinear')
    figure(k); plot(t,y*(180/pi))
    hold off
    % ---------------------------------------
    xlabel('t [s]'); ylabel('y(t) [deg]')
    grid on
    legend('���`�V�~�����[�V����','����`�V�~�����[�V����')
    ylim(k*[0 45])
    set(gca,'YTick',k*[0:7.5:45])
end

figure(1); movegui('northwest')
figure(4); movegui('northeast')

