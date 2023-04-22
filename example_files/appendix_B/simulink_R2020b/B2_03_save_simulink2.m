% B2_03_save_simulink1.m
% 付録 B.2
% Simulink モデルの図としての保存（解像度の変更）
% 　　JPEG ファイル，PNG ファイル
clc
clear
format compact

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ JPEG ファイル')
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
disp('+ PNG ファイル')
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

