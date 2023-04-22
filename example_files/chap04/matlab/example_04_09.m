% example_04_09.m
% �� 4.9�F���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 4.9 ')
disp('==================================================')

s = tf('s');

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ����Ώ� P(s) = 5/(s^2 + 2s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP  = 5/(s^2 + 2*s + 2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �R���g���[�� C(s) = k Cd(s)')
disp('+ �@�@�@�@�@�@ Cd(s) = 1, k = kP')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysCd = 1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ P(s)Cd(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysPCd = sysP*sysCd

% =====================================================
% ���O��
% =====================================================

figure(1)
rlocus(sysPCd)

% �Â��o�[�W�����p�iR2018a �Ȃǁj
axis_x = findall(gcf,'String','���� (seconds^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (seconds^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');

% �ŋ߂̃o�[�W�����p
axis_x = findall(gcf,'String','���� (�b^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (�b^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');

% =====================================================
% �P�ʃX�e�b�v����
% =====================================================

t = 0:0.001:5;

for kP = [0.5 2 5]
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    sysGyr = minreal(sysL/(1 + sysL));
    
    y = step(sysGyr,t);
    
    figure(2)
    plot(t,y)
    hold on
end

figure(2)
hold off

xlabel('t [s]')
ylabel('y(t)')

legend('kP = 0.5','kP = 2','kP = 5')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')

    