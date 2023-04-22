% exercise_07_01.m
% ��� 7.1�FL(s) = P(s)C(s) �̃x�N�g���O�Ղ�����������ƌ����_
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 7.1�F ')
disp(' L(s) = P(s)C(s) �̃x�N�g���O�Ղ�����������ƌ����_ ')
disp('==================================================')

syms s
syms w real   
syms eta positive   % eta = w/wn
syms wn zeta positive

syms kP positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   �@�@�@�@�@                  wn^2')
disp(' 2 ���x��v�f P(s) = -------------------------')
disp('   �@�@�@�@�@        s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)
Cs = kP

% P(s) = wn^2/(s^2 + 2*zeta*wn*s + wn^2)
% C(s) = kP

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �J���[�v�`�B�֐� L(s) = P(s)C(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ls = Ps*Cs

% L(s) = P(s)*C(s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� L(jw) (eta = w/wn)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw = subs(Ls,s,j*w)
Ljw = subs(Ljw,w,wn*eta);
Ljw = simplify(Ljw)

% Ljw = L(j*w)
% Ljw = L(j*wn*eta)
% Ljw = simplify(Ljw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[L(jw)] = 0 �ƂȂ� eta = eta1 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Ljw = real(Ljw)

eta1 = solve(real_Ljw,eta)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �n�_�Fw -> 0 (eta -> 0) �Ƃ����Ƃ��� L(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

limit_Ljw_0 = limit(Ljw,eta,0)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �I�_�Fw -> infty (eta -> infty) �Ƃ����Ƃ��� L(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

limit_Ljw_inf = limit(Ljw,eta,Inf)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[L(jw)] = 0 �ƂȂ� w = w1 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

w1 = wn*eta1

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(jw) �������ƌ����_ (0, beta) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw1 = subs(Ljw,eta,eta1);

beta = imag(Ljw1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Im[L(jw)] = 0 �ƂȂ� 0 < eta < Inf ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

imag_Ljw = imag(Ljw)

disp(' ')
sol = solve(imag_Ljw,eta)

disp(' ')
if isempty(sol) == 1    % sol ����s�� (Empty) �Ȃ� isempty(sol) �� 1
    disp('sol �� Empty �Ȃ̂ŁCIm[L(jw)] = 0 �ƂȂ�iL(jw) �������ƌ����j')
    disp('�悤�� 0 < eta < Inf �͑��݂��Ȃ�')
end


