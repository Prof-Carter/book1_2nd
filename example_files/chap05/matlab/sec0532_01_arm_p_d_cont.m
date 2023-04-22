% sec0532_01_arm_p_d_cont.m
% ‰”’¼–Ê‚ð‰ñ“]‚·‚éƒA[ƒ€‚Ì P-D §ŒäŒn‚Ì“`’BŠÖ”‚Æ
% 2 ŽŸ’x‚ê—v‘f‚Ì•W€Œ`‚Ö‚Ì•ÏŠ·
% ySymbolic Math Toolbox ‚ª•K—vz

clear
format compact

syms s
syms a1 a0 b0 positive
syms kP kD positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ §Œä‘ÎÛ y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)       % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ƒRƒ“ƒgƒ[ƒ‰ u(s) = C2(s)r(s) - C1(s)y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kD*s                  % C1(s)
C2 = kP                         % C2(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyr(s) = P(s)*C2(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C2/(1 + P*C1);          % Gyr(s) = P(s)*C1(s)/(1 + P(s)*C2(s))
Gyr = collect(Gyr,s)            % ~‚×‚«‚Ì‡

[Nyr Dyr] = numden(Gyr);        % Gyr(s) = Nyr(s)/Dyr(s)

pyr = fliplr(coeffs(Dyr,s));    % Dyr(s) ‚ÌŒW”‚Ì’Šo
qyr = fliplr(coeffs(Nyr,s));    % Nyr(s) ‚ÌŒW”‚Ì’Šo

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyd(s) = P(s)/(1 + P(s)*C(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);             % Gyd(s) = P(s)/(1 + P(s)*C1(s))
Gyd = collect(Gyd,s)            % ~‚×‚«‚Ì‡

[Nyd Dyd] = numden(Gyd);        % Gyd(s) = Nyd(s)/Dyd(s)

pyd = fliplr(coeffs(Dyd,s));    % Dyd(s) ‚ÌŒW”‚Ì’Šo
qyd = fliplr(coeffs(Nyd,s));    % Nyd(s) ‚ÌŒW”‚Ì’Šo

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+                   K1*wn^2        ')
disp('+ Gyr(s) = ------------------------')
disp('+          s^2 + 2*zeta*wn*s + wn^2')
disp('+                   K2*wn^2        ')
disp('+ Gyd(s) = ------------------------')
disp('+          s^2 + 2*zeta*wn*s + wn^2')
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
disp('+ zeta = zeta_m, wn = wm ‚Æ‚È‚é‚æ‚¤‚È kP > 0, kD > 0')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms wm zeta_m positive

sol2 = solve([wn-wm zeta-zeta_m], {kP,kD}, 'ReturnConditions', true);
kP = sol2.kP
kD = sol2.kD
conditions = sol2.conditions


