% sample_rlocus2.m
% ���O�ՁF�� 4.10

close all
clear
format compact

s = tf('s');
sysPCd = 1/((s + 1)*(s + 4)*(s + 7));

figure(1); rlocus(sysPCd)

% �ŋ߂̃o�[�W�����p
axis_x = findall(gcf,'String','���� (�b^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (�b^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');

% �Â��o�[�W�����p (R2018a �Ȃǁj
axis_x = findall(gcf,'String','���� (seconds^{-1})'); % ���ׂẴO���t�B�b�N�X�I�u�W�F�N�g���當���������
axis_y = findall(gcf,'String','���� (seconds^{-1})');
set(axis_x,'String','����'); % ��������Ē�`
set(axis_y,'String','����');