% B2_03_save_simulink1.m
% �t�^ B.2
% Simulink ���f���̐}�Ƃ��Ă̕ۑ�
% �@�@PDF �t�@�C���C�g�����^�t�@�C���C
% �@�@JPEG �t�@�C���CPNG �t�@�C��
clc
clear
format compact

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PDF �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dpdf')")
disp('+  >> % sample; print -s -dpdf model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dpdf')
% sample; print -s -dpdf model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �g�����^�t�@�C�� (Windows �̂�)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dmeta')")
disp('+  >> % sample; print -s -dmeta model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dmeta')
% sample; print -s -dmeta model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ JPEG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-djpeg')")
disp('+  >> % sample; print -s -djpeg model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-djpeg')
% sample; print -s -djpeg model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PNG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dpng')")
disp('+  >> % sample; print -s -djpeg model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dpng')
% sample; print -s -dpng model

