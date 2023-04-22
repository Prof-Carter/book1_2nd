% sec0631_03_customize.m
% ���[�p�X�t�B���^�F1 ���x��v�f�ɂ��m�C�Y�����i�} 6.8�j

close all
clear
format compact

sim('sim_noise_reduction')

% --------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y,'LineWidth',1.5)
ylabel('y(t)','FontName','Arial','FontSize',16)

% --------------------------------
figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,n,'LineWidth',1.5)
ylabel('n(t)','FontName','Arial','FontSize',16)

% --------------------------------
figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y+n,'LineWidth',1.5)

ylabel('y(t) + n(t)','FontName','Arial','FontSize',16)

% --------------------------------
figure(4)
subplot('Position',[0.15 0.15 0.775 0.775])
plot(t,y+n,'LineWidth',1.5)
hold on
plot(t,yf,'LineWidth',1.5)
hold off
ylabel('yf(t)','FontName','Arial','FontSize',16)

legend({'y(t) + n(t)','yf(t)'},...
    'FontName','Arial','FontSize',16)

% --------------------------------
for i = 1:4
    figure(i)
    grid on

    ylim([-1.5 1.5])
    xlim([0 2*pi])

    xlabel('t [s]','FontName','Arial','FontSize',16)

    set(gca,'XTick',0:pi/4:2*pi)
    set(gca,'XTickLabel',{'0','','\pi/2','','\pi','','3\pi/2','','2\pi'})
    set(gca,'FontName','Arial','FontSize',14)
    set(gca,'XTickLabelRotation',0)
end

figure(1); title('����g�M��','FontName','MS UI Gothic','FontSize',16)
figure(2); title('�m�C�Y�i�����g�M���j','FontName','MS UI Gothic','FontSize',16)
figure(3); title('����g�M�� + �m�C�Y','FontName','MS UI Gothic','FontSize',16)
figure(4); title('���[�p�X�t�B���^�ʉߌ�̐M��','FontName','MS UI Gothic','FontSize',16)

figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


