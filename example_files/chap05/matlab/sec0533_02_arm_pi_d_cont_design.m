% sec0533_02_arm_pi_d_cont_design.m
% 鉛直面を回転するアームの PI-D 制御
% （目標値応答に注目した部分的モデルマッチング法による kI, kP, kD の設計）
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('=====================================================')
disp(' 目標値応答に注目したアーム系の PI-D 制御')
disp('=====================================================')

syms s
syms a0 a1 b0 positive
syms kP kI kD positive
syms alpha1 wm positive

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 制御対象 y(s) = P(s)u(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)   % P(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ コントローラ u(s) = C2(s)r(s) - C1(s)y(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C2 = kP + kI/s              % C2(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyr(s) = P(s)*C2(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C2/(1 + P*C1);
Gyr = collect(Gyr,s)        % 降べきの順

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % 降べきの順

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 1/Gyr(s) をマクローリン展開')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 1/Gyr(s) = gamma0 + gamma1*s ')
disp('+                   + gamma2*s^2 + gamma3*s^3 + ...  ')
disp('+ gamma = [ gamma0')
disp('+           gamma1')
disp('+           gamma2')
disp('+           gamma3 ] ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

inv_Gyr = taylor(1/Gyr,s,0,'Order',4)
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 2 次の規範モデル')
disp('+                    wn^2          ')
disp('+ Gm2(s) = ------------------------')
disp('+          s^2 + alpha1*wn*s + wn^2')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gm2 = wm^2/(s^2 + alpha1*wm*s + wm^2)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 逆数 1/Gm2(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 1/Gm2(s) = gamma_m0 + gamma_m1*s  ')
disp('+                     + gamma_m2*s^2')
disp('+ gamma_m = [ gamma_m0')
disp('+             gamma_m1')
disp('+             gamma_m2')
disp('+             0        ] ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

gamma_m = coeffs(1/Gm2,s)';
gamma_m = [gamma_m; 0]

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 設計された PID パラメータ（gamma = gamma_m の解）')
disp('+ kP = sol_kP, kI = sol_kI, kD = sol_kD')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(gamma(2:4)-gamma_m(2:4),[kI kP kD], 'ReturnConditions', true);

sol_kI = sol.kI
sol_kP = sol.kP
sol_kD = sol.kD

% sol.conditions

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 設計された PID パラメータを用いたときの Gyr(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = subs(Gyr,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyr = collect(Gyr,s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 設計された PID パラメータを用いたときの Gyd(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = subs(Gyd,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyd = collect(Gyd,s)


