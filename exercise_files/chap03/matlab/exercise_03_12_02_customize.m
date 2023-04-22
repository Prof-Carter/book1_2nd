% exercise_03_12_02_customize.m
% ��� 3.12�F��� 3.4 (2) �̓`�B�֐��ɑ΂��鎞�ԉ���

close all
clear
format compact

s = tf('s');

t = 0:0.001:8;

disp(' ')
disp('==================================================')
disp(' ��� 3.12�@<===�@��� 3.4 (2)')
disp('==================================================')

sysP = (s + 4)/((s + 1)*(s + 2))

% ------------------------------------------
y1 = impulse(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y1,'LineWidth',1.5)

ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

% ------------------------------------------
y2 = step(sysP,t);

figure(2)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y2,'LineWidth',1.5)

ylim([0 3])
set(gca,'YTick',0:1:3)

% ------------------------------------------
u  = t;
y3 = lsim(sysP,u,t);

figure(3)
subplot('Position',[0.15 0.15 0.775 0.775])

plot(t,y3,'LineWidth',1.5)

ylim([0 14])
set(gca,'YTick',0:2:14)

% ------------------------------------------
for i = 1:3
    figure(i)
    set(gca,'FontName','Arial','FontSize',14)
    xlabel('t [s]','FontName','Arial','FontSize',16)
    ylabel('y(t)','FontName','Arial','FontSize',16)
    grid on

    xlim([0 8])
    set(gca,'XTick',0:1:8)
end

figure(1); title('�C���p���X����','FontName','MS Gothic','FontSize',16)
figure(2); title('�P�ʃX�e�b�v����','FontName','MS Gothic','FontSize',16)
figure(3); title('�P�ʃ����v����','FontName','MS Gothic','FontSize',16)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('north')
figure(3); movegui('northeast')
