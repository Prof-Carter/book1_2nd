% exercise_05_02.m
% ��� 5.3�F�F�ڕW�l�����ɒ��ڂ����A�[���n�� PI-D ����
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 5.3�F�ڕW�l�����ɒ��ڂ����A�[���n�� PI-D ����')
disp('==================================================')

syms s
syms a1 a0 b0 positive
syms kP kI kD positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ����Ώ� y(s) = P(s)u(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)   % P(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �R���g���[�� u(s) = C2(s)r(s) - C1(s)y(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C2 = kP + kI/s              % C2(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyr(s) = P(s)*C2(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C2/(1 + P*C1);
Gyr = collect(Gyr,s)        % �~�ׂ��̏�

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % �~�ׂ��̏�


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
disp(' �݌v���ꂽ PID �p�����[�^��p�����Ƃ���')
disp(' Gyr(s) = Nyr(s)/Dyr(s) �� Nyr(s), Dyr(s)')
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
disp(' �݌v���ꂽ PID �p�����[�^��p�����Ƃ��� Gyr(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = simplify(Nyr/Dyr)

