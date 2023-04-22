% sample_rlocus2_customize.m
% ���O�ՁF�� 4.10�i�O���t�̃J�X�^�}�C�Y�j

close all
clear
format compact

s = tf('s');
sysPCd = 1/((s + 1)*(s + 4)*(s + 7));

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])
h = rlocusplot(sysPCd);

h2 = findobj(gcf,'type','Line');
n = length(h2);
for i = 1:n
    h2(i).MarkerSize = 10;
end

set(h2,'LineWidth',1.5)
set(gca,'FontName','Arial','FontSize',14)
set(gca,'XColor',[0 0 0],'YColor',[0 0 0])

p = getoptions(h);
p.Title.FontSize = 16;
p.XLabel.FontSize = 16;
p.YLabel.FontSize = 16;

setoptions(h,p)

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
