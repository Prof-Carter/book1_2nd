% eoc04_03_fbk_step.m
% �t�B�[�h�o�b�N����n�ɂ����� Gyr(s), Gyr(s), Gyr(s), Gyr(s) �̓��o��
% �ڕW�l�����C�O�������̕`��

close all
clear
format compact

sysP = tf([5],[1 2 2])
sysC = 2
sysL = minreal(sysP*sysC)

% Gyr(s), Gyr(s), Gyr(s), Gyr(s) �̓��o
sysGyr = minreal(sysL/(1 + sysL))
sysGyd = minreal(sysP/(1 + sysL))
sysGer = 1 - sysGyr
sysGed = - sysGyd

% �V�~�����[�V�������Ԃ̒�`
t = 0:0.01:10;

% �ڕW�l�����̕`��
y = step(sysGyr,t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')

% �O�������̕`��
y = step(sysGyd,t);

figure(2)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
