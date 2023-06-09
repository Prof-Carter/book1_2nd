% exercise_05_04.m
% 問題 5.4：目標値応答に注目した台車系の I-PD 制御
% （目標値応答に注目した部分的モデルマッチング法による kI, kP, kD の設計）
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('=====================================================')
disp(' 問題 5.4：目標値応答に注目した台車系の I-PD 制御')
disp('=====================================================')

syms s
syms M c positive
syms kP kI kD positive
syms alpha1 alpha2 wm positive

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 y(s) = P(s)u(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = 1/(M*s^2 + c*s)        % P(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ u(s) = C3(s)r(s) - C1(s)y(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C3 =      kI/s              % C3(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C3(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C3/(1 + P*C1);
Gyr = collect(Gyr,s)        % 降べきの順

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % 降べきの順

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 1/Gyr(s) をマクローリン展開')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 1/Gyr(s) = gamma0 + gamma1*s ')
disp('                   + gamma2*s^2 + gamma3*s^3 + ...  ')
disp(' gamma = [ gamma0')
disp('           gamma1')
disp('           gamma2')
disp('           gamma3 ] ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

inv_Gyr = taylor(1/Gyr,s,0,'Order',4)
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 3 次の規範モデル')
disp('                            wn^3                    ')
disp(' Gm3(s) = ------------------------------------------')
disp('          s^3 + alpha2*wm*s^2 + alpha1*wn^2*s + wn^3')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 逆数 1/Gm3(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 1/Gm3(s) = gamma_m0 + gamma_m1*s ')
disp('                     + gamma_m2*s^2 + gamma_m3*s^3')
disp(' gamma_m = [ gamma_m0')
disp('             gamma_m1')
disp('             gamma_m2')
disp('             gamma_m3 ] ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

gamma_m = coeffs(1/Gm3,s)'

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータ（gamma = gamma_m の解）')
disp(' kP = sol_kP, kI = sol_kI, kD = sol_kD')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(gamma(2:4)-gamma_m(2:4),[kI kP kD], 'ReturnConditions', true);

sol_kI = sol.kI
sol_kP = sol.kP
sol_kD = sol.kD

% sol.conditions

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータを用いたときの Gyr(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = subs(Gyr,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyr = collect(Gyr,s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 設計された PID パラメータを用いたときの Gyd(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = subs(Gyd,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyd = collect(Gyd,s)
