% B2_03_save_simulink1.m
% �t�^ B.2
% Simulink ���f���̐}�Ƃ��Ă̕ۑ��i�𑜓x�̕ύX�j
% �@�@JPEG �t�@�C���CPNG �t�@�C��
clc
clear
format compact

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ JPEG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> sample')
disp("+  >> print('-s','model1','-djpeg')")
disp("+  >> print('-s','-r600','model2','-djpeg')")
disp("+  >> % print -s -djpeg model")
disp("+  >> % print -s -r600 -djpeg model")
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample
print('-s','model1','-djpeg')
print('-s','-r600','model2','-djpeg')
% print -s -djpeg model
% print -s -r600 -djpeg model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PNG �t�@�C��')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+  >> sample')
disp("+  >> print('-s','model1','-dpng')")
disp("+  >> print('-s','-r600','model2','-dpng')")
disp("+  >> % print -s -dpng model")
disp("+  >> % print -s -r600 -dpng model")
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model1','-dpng')
sample; print('-s','-r600','model2','-dpng')
% print -s -dpng model
% print -s -r600 -dpng model

