% example_04_10a.m
% �� 4.10�F���O�Ղ̐����̗��p�i���O�Ղ̕`��̂݁j

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 4.10 ')
disp('==================================================')

s = tf('s');
sysP  = 1/((s + 1)*(s + 4)*(s + 7));
sysCd = 1;

sysPCd = sysP*sysCd;

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

t = 0:0.001:2.5;

for kP = [150 300 440]
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

legend('kP = 150','kP = 300','kP = 440')
grid on

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')
    