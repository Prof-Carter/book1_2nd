% example_07_05_02.m
% 例 7.5：ボード線図と安定余裕（表 7.1）
% 　===> 精度が少し悪い（角周波数のデータの細かさを指定できないので）

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.5 ')
disp('==================================================')

s = tf('s');
sysP = 1/(s + 1)^3;

% -----------------------------------
num = 0;
for kP = [2 8 20]
    num = num + 1;

    sysL = minreal(sysP*kP);

    [inv_Ljw Pm wpc wgc] = margin(sysL);

    fprintf('=====================\n')
    fprintf('kP = %7.3f\n',kP)
    fprintf('=====================\n')
    fprintf('wpc = %7.3f [rad/s]\n',wpc)
    fprintf('Gm  = %7.3f [dB]\n',   20*log10(inv_Ljw))
    fprintf('wgc = %7.3f [rad/s]\n',wgc)
    fprintf('Pm  = %7.3f [deg]\n',  Pm)
    fprintf('\n')
end
