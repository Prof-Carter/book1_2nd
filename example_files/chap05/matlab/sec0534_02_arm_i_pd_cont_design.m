% sec0533_02_arm_i_pd_cont_design.m
% �����ʂ���]����A�[���� I-PD ����
% �i�ڕW�l�����ɒ��ڂ��������I���f���}�b�`���O�@�ɂ�� kI, kP, kD �̐݌v�j
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

disp(' ')
disp('=====================================================')
disp(' �ڕW�l�����ɒ��ڂ����A�[���n�� I-PD ����')
disp('=====================================================')

syms s
syms a0 a1 b0 positive
syms kP kI kD positive
syms alpha1 alpha2 wm positive

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ ����Ώ� y(s) = P(s)u(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

P  = b0/(s^2 + a1*s + a0)   % P(s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �R���g���[�� u(s) = C3(s)r(s) - C1(s)y(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

C1 = kP + kI/s + kD*s       % C1(s)
C3 =      kI/s              % C3(s)


disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyr(s) = P(s)*C3(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = P*C3/(1 + P*C1);
Gyr = collect(Gyr,s)        % �~�ׂ��̏�

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ Gyd(s) = P(s)/(1 + P(s)*C1(s))')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = P/(1 + P*C1);
Gyd = collect(Gyd,s)        % �~�ׂ��̏�

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 1/Gyr(s) ���}�N���[�����W�J')
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
disp('+ 3 ���̋K�̓��f��')
disp('+                            wn^3                    ')
disp('+ Gm3(s) = ------------------------------------------')
disp('+          s^3 + alpha2*wm*s^2 + alpha1*wn^2*s + wn^3')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �t�� 1/Gm3(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ 1/Gm3(s) = gamma_m0 + gamma_m1*s ')
disp('+                     + gamma_m2*s^2 + gamma_m3*s^3')
disp('+ gamma_m = [ gamma_m0')
disp('+             gamma_m1')
disp('+             gamma_m2')
disp('+             gamma_m3 ] ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

gamma_m = coeffs(1/Gm3,s)'

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �݌v���ꂽ PID �p�����[�^�igamma = gamma_m �̉��j')
disp('+ kP = sol_kP, kI = sol_kI, kD = sol_kD')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(gamma(2:4)-gamma_m(2:4),[kI kP kD], 'ReturnConditions', true);

sol_kI = sol.kI
sol_kP = sol.kP
sol_kD = sol.kD

% sol.conditions

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �݌v���ꂽ PID �p�����[�^��p�����Ƃ��� Gyr(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyr = subs(Gyr,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyr = collect(Gyr,s)

disp(' ')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('+ �݌v���ꂽ PID �p�����[�^��p�����Ƃ��� Gyd(s)')
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++')

Gyd = subs(Gyd,[kI kP kD],[sol_kI sol_kP sol_kD]);
Gyd = collect(Gyd,s)
