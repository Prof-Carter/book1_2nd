% B2_03_save_simulink1.m
% 付録 B.2
% Simulink モデルの図としての保存
% 　　PDF ファイル，拡張メタファイル，
% 　　JPEG ファイル，PNG ファイル
clc
clear
format compact

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PDF ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dpdf')")
disp('+  >> % sample; print -s -dpdf model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dpdf')
% sample; print -s -dpdf model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 拡張メタファイル (Windows のみ)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dmeta')")
disp('+  >> % sample; print -s -dmeta model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dmeta')
% sample; print -s -dmeta model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ JPEG ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-djpeg')")
disp('+  >> % sample; print -s -djpeg model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-djpeg')
% sample; print -s -djpeg model

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ PNG ファイル')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp("+  >> sample; print('-s','model','-dpng')")
disp('+  >> % sample; print -s -djpeg model')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

sample; print('-s','model','-dpng')
% sample; print -s -dpng model

