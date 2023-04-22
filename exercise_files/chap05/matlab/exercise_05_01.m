% exercise_05_01.m
% –â‘è 5.1F–Ú•W’l‰ž“š‚É’–Ú‚µ‚½ƒA[ƒ€Œn‚Ì P §Œä
% ySymbolic Math Toolbox ‚ª•K—vz

clear
format compact

disp(' ')
disp('==================================================')
disp(' –â‘è 5.1F–Ú•W’l‰ž“š‚É’–Ú‚µ‚½ƒA[ƒ€Œn‚Ì P §Œä')
disp('==================================================')

syms s
syms a1 a0 b0 positive
syms kP positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' §Œä‘ÎÛ y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)       % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ƒRƒ“ƒgƒ[ƒ‰ u(s) = C(s)e(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C = kP                          % C(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C/(1 + P*C);
Gyr = collect(Gyr,s)            % ~‚×‚«‚Ì‡

[Nyr Dyr] = numden(Gyr);        % Gyr(s) = Nyr(s)/Dyr(s)

pyr = fliplr(coeffs(Dyr,s));    % Dyr(s) ‚ÌŒW”‚Ì’Šo
qyr = fliplr(coeffs(Nyr,s));    % Nyr(s) ‚ÌŒW”‚Ì’Šo

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C);
Gyd = collect(Gyd,s)            % ~‚×‚«‚Ì‡

[Nyd Dyd] = numden(Gyd);        % Gyd(s) = Nyd(s)/Dyd(s)

pyd = fliplr(coeffs(Dyd,s));    % Dyd(s) ‚ÌŒW”‚Ì’Šo
qyd = fliplr(coeffs(Nyd,s));    % Nyd(s) ‚ÌŒW”‚Ì’Šo

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
             qyd-K2*wn^2],[wn zeta K1 K2]);    % 2 ŽŸ’x‚ê—v‘f‚Ì•W€Œ`‚Ìƒpƒ‰ƒ[ƒ^

wn   = simplify(sol.wn)
zeta = simplify(sol.zeta)
K1   = simplify(sol.K1)
K2   = simplify(sol.K2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' zeta = zeta_m ‚Æ‚È‚é‚æ‚¤‚È kP > 0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms zeta_m positive

sol = solve(zeta-zeta_m, kP, 'ReturnConditions', true);
kP = sol.kP
conditions = sol.conditions




