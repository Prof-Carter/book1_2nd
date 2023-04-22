% plot_data.m
% M �t�@�C��

close all

clear                   % �������̏�����
format compact          % �]���ȉ��s�̗}��
x = -5:0.1:5;           % �����f�[�^
y = x.^2 - 2*x - 5;     % �c���f�[�^
figure(2)
plot(x,y,'r--','LineWidth',2)
set(gca,'FontSize',16,'FontName','Arial')
xlim([-4 4]); set(gca,'XTick',-4:1:4)
ylim([-10 20]); set(gca,'YTick',-10:5:20)
xlabel('x','FontSize',18,'FontName','Arial')
ylabel('y','FontSize',18,'FontName','Arial')
grid on