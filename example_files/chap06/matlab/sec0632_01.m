% sec0632_01.m
% 2 ���x��v�f�̃Q�C���ƈʑ���
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 2 ���x��v�f�̃Q�C���ƈʑ��� ')
disp('==================================================')

syms s
syms w positive   
syms eta positive   % eta = w/wn
syms wn zeta positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('   �@�@�@�@�@                  wn^2')
disp(' 2 ���x��v�f P(s) = -------------------------')
disp('   �@�@�@�@�@        s^2 + 2*zeta*wn*s + wn^2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

% P(s) = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� P(jw) (eta = w/wn)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)
Pjw = subs(Pjw,w,wn*eta);
Pjw = simplify(Pjw)

% Pjw = P(j*w)
% Pjw = P(j*wn*eta)
% Pjw = simplify(Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���� a = Re[P(jw)] ')
disp(' ���� b = Im[P(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

a = real(Pjw)
b = imag(Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Q�C�� Gg(w) = sqrt(a^2 + b^2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

% Gg = abs(Pjw)
Gg = sqrt(a^2 + b^2);
Gg = simplify(expand(Gg))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ʑ��� Gp(w) = atan(b/a) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp = atan(b/a)

