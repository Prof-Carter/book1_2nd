% exercise_06_04_02b_customize.m
% ��� 6.4 (2)�F�x�N�g���O��

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.4 (2)�FP(j*w) �̑傫�� |P(j*w)| �ƕΊp��P(j*w)')
disp('�@�@�@�@�@�@�@�@�x�N�g���O�Ղ̕`��')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = exp(-L*s)/(T*s + 1)')
disp(' �@�@�@�@    L = 1, T = 0.2')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms s
syms w real
syms L T positive

P(s) = exp(-L*s)/(T*s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� P(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = P(j*w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� P(j*w) ���I�C���[�̌����ŏ�������')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = rewrite(Pjw,'sincos')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[P(j*w)], Im[P(j*w)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Pjw = real(Pjw)
imag_Pjw = imag(Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(j*w) = N(j*w)/D(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Njw Djw] = numden(Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[N(j*w)], Im[N(j*w)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Njw = real(Njw)
imag_Njw = imag(Njw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |N(j*w)|')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Njw = sqrt(real_Njw^2 + imag_Njw^2);
abs_Njw = simplify(abs_Njw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ��N(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms w real

angle_Njw = atan(imag_Njw/real_Njw)

assume(L*w < 1 & -1 < L*w)
angle_Njw = simplify(angle_Njw)
assume(w,'clear')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[D(j*w)], Im[D(j*w)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Djw = real(Djw)
imag_Djw = imag(Djw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |D(j*w)|')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Djw = sqrt(real_Djw^2 + imag_Djw^2);
abs_Djw = simplify(abs_Djw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ��D(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Djw = atan(imag_Djw/real_Djw)
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |P(j*w)| = |N(j*w)|/|D(j*w)|')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Pjw = abs_Njw/abs_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ��P(j*w) = ��N(j*w) - ��D(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Pjw = angle_Njw - angle_Djw

%  ----- �x�N�g���O�Ղ̕`�� -----------------------------

a = subs(real_Pjw,{L,T},{1,0.2})
b = subs(imag_Pjw,{L,T},{1,0.2})

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(a,b,[0 1e2],'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('����','FontName','MS Gothic','FontSize',16)
ylabel('����','FontName','MS Gothic','FontSize',16)
title('L = 1, T = 0.2','FontName','Arial','FontSize',16)

xlim([-1.2 1.2])
ylim([-1.2 1.2])

grid on
axis('square')





