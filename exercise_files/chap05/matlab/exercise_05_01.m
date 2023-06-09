% exercise_05_01.m
% 問題 5.1：目標値応答に注目したアーム系の P 制御
% 【Symbolic Math Toolbox が必要】

clear
format compact

disp(' ')
disp('==================================================')
disp(' 問題 5.1：目標値応答に注目したアーム系の P 制御')
disp('==================================================')

syms s
syms a1 a0 b0 positive
syms kP positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 制御対象 y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)       % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' コントローラ u(s) = C(s)e(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C = kP                          % C(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C/(1 + P*C);
Gyr = collect(Gyr,s)            % 降べきの順

[Nyr Dyr] = numden(Gyr);        % Gyr(s) = Nyr(s)/Dyr(s)

pyr = fliplr(coeffs(Dyr,s));    % Dyr(s) の係数の抽出
qyr = fliplr(coeffs(Nyr,s));    % Nyr(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C);
Gyd = collect(Gyd,s)            % 降べきの順

[Nyd Dyd] = numden(Gyd);        % Gyd(s) = Nyd(s)/Dyd(s)

pyd = fliplr(coeffs(Dyd,s));    % Dyd(s) の係数の抽出
qyd = fliplr(coeffs(Nyd,s));    % Nyd(s) の係数の抽出

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('                   K1*wn^2        ')
disp(' Gyr(s) = ------------------------')
disp('          s^2 + 2*zeta*wn*s + wn^2')
disp('                   K2*wn^2        ')
disp(' Gyd(s) = ------------------------')
disp('          s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms wn zeta K1 K2 positive

sol = solve([pyr(2)-2*zeta*wn ...
             pyr(3)-wn^2 ...
             qyr-K1*wn^2 ...
             qyd-K2*wn^2],[wn zeta K1 K2]);    % 2 次遅れ要素の標準形のパラメータ

wn   = simplify(sol.wn)
zeta = simplify(sol.zeta)
K1   = simplify(sol.K1)
K2   = simplify(sol.K2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' zeta = zeta_m となるような kP > 0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms zeta_m positive

sol = solve(zeta-zeta_m, kP, 'ReturnConditions', true);
kP = sol.kP
conditions = sol.conditions




