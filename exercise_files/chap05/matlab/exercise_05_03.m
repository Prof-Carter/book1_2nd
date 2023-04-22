% exercise_05_02.m
% 問題 5.3：：目標値応答に注目したアーム系の PI-D 制御
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 5.3：目標値応答に注目したアーム系の PI-D 制御')
disp('==================================================')

syms s
syms a1 a0 b0 positive
syms kP kI kD positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)   % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ u(s) = C2(s)r(s) - C1(s)y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C2 = kP + kI/s              % C2(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C2(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C2/(1 + P*C1);
Gyr = collect(Gyr,s)        % 降べきの順

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % 降べきの順


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' kI, kP, kI')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms wm alpha1 positive

design_kI = wm*a0/(alpha1*b0)
design_kP = wm^2/b0
design_kD = alpha1*wm/b0 - a1/b0 + a0/(alpha1*wm*b0)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータを用いたときの')
disp(' Gyr(s) = Nyr(s)/Dyr(s) の Nyr(s), Dyr(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Nyr Dyr] = numden(Gyr);     % Gyr(s) = Nyr(s)/Dyr(s)

Nyr = subs(Nyr,{kP,kI,kD},{design_kP,design_kI,design_kD});
Nyr = collect(Nyr,s);
Nyr = collect(Nyr,alpha1)

Dyr = subs(Dyr,{kP,kI,kD},{design_kP,design_kI,design_kD});
Dyr = collect(Dyr,s);
Dyr = simplify(Dyr)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータを用いたときの Gyr(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = simplify(Nyr/Dyr)

