% sec0631_03.m
% ���[�p�X�t�B���^�F1 ���x��v�f�ɂ��m�C�Y�����i�} 6.8�j

close all
clear
format compact

sim('sim_noise_reduction')

% --------------------------------
figure(1)
plot(t,y)
ylabel('y(t)')
title('����g�M��')

% --------------------------------
figure(2)
plot(t,n)
ylabel('n(t)')
title('�m�C�Y�i�����g�M���j')

% --------------------------------
figure(3)
plot(t,y+n)

ylabel('y(t) + n(t)')
title('����g�M�� + �m�C�Y')

% --------------------------------
figure(4)
plot(t,y+n)
hold on
plot(t,yf)
hold off
ylabel('yf(t)')
title('���[�p�X�t�B���^�ʉߌ�̐M��')

legend('y(t) + n(t)','yf(t)')

% --------------------------------
for i = 1:4
    figure(i)
    grid on

    ylim([-1.5 1.5])
    xlim([0 2*pi])

    xlabel('t [s]')

    set(gca,'XTick',0:pi/4:2*pi)
    set(gca,'XTickLabel',{'0','','\pi/2','','\pi','','3\pi/2','','2\pi'})
end

figure(1); movegui('northwest')
figure(2); movegui('northeast')
figure(3); movegui('southwest')
figure(4); movegui('southeast')


