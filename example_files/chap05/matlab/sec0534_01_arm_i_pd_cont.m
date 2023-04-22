% sec0534_01_arm_i_pd_cont.m
% 鉛直面を回転するアームの I-PD 制御系の伝達関数
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms s
syms a1 a0 b0 positive
syms kP kI kD positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)   % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ コントローラ u(s) = C3(s)r(s) - C1(s)y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C3 =      kI/s              % C2(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyr(s) = P(s)*C3(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C3/(1 + P*C1);
Gyr = collect(Gyr,s)        % 降べきの順

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % 降べきの順
