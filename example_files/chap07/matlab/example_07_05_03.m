% example_07_05_03.m
% 例 7.5：ボード線図と安定余裕（表 7.1）
% 　===> example_07_05_02.m よりもこちらの方が精度が良い
% 　    （関数 bode でゲイン，位相差を求めてから安定余裕を計算）

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
w = logspace(-1,1,10000);

num = 0;
for kP = [2 8 20]
    num = num + 1;

    sysL = minreal(sysP*kP);
    [Gg Gp] = bode(sysP*kP,w);
    Gg = Gg(:,:);
    Gp = Gp(:,:);

    [Gm Pm wpc wgc] = margin(Gg,Gp,w);

    fprintf('=====================\n')
    fprintf('kP = %7.3f\n',kP)
    fprintf('=====================\n')
    fprintf('wpc = %7.3f [rad/s]\n',wpc)
    fprintf('Gm  = %7.3f [dB]\n',   20*log10(Gm))
    fprintf('wgc = %7.3f [rad/s]\n',wgc)
    fprintf('Pm  = %7.3f [deg]\n',  Pm)
    fprintf('\n')
end
