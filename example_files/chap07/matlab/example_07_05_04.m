% example_07_05_04.m
% �� 7.5�F�{�[�h���}�ƈ���]�T�i�\ 7.1�j
% �@===> �� 7.4 �̌��ʂ𗘗p���Čv�Z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' �� 7.5 ')
disp('==================================================')

num = 0;
for kP = [2 8 20]
    num = num + 1;

    wpc = sqrt(3);
    Gm  = - 20*log10(kP/8);

    wgc = sqrt(kP^(2/3) - 1);    
    Pm  = pi - 3*atan(wgc);
    Pm  = rad2deg(Pm);

    fprintf('=====================\n')
    fprintf('kP = %7.3f\n',kP)
    fprintf('=====================\n')
    fprintf('wpc = %7.3f [rad/s]\n',wpc)
    fprintf('Gm  = %7.3f [dB]\n',   Gm)
    fprintf('wgc = %7.3f [rad/s]\n',wgc)
    fprintf('Pm  = %7.3f [deg]\n',  Pm)
    fprintf('\n')
end
