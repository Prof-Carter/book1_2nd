% exercise_06_04_01b_customize_tex.m
% âč 6.4 (1)FxNgOŐ

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' âč 6.4 (1)FP(j*w) ĚĺŤł |P(j*w)| ĆÎpÚP(j*w)')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' `BÖ P(s) = exp(-L*s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

syms s
syms w real
syms L positive

P(s) = exp(-L*s)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' üg`BÖ P(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = P(j*w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' üg`BÖ P(j*w) đIC[ĚöŽĹŤˇŚ')
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
disp(' |P(j*w)|')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Pjw = sqrt(real_Pjw^2 + imag_Pjw^2)
abs_Pjw = simplify(abs_Pjw)


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ÚP(j*w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Pjw = atan(imag_Pjw/real_Pjw)

assume(L*w < 1 & -1 < L*w)
angle_Pjw = simplify(angle_Pjw)
assume(w,'clear')

%  ----- xNgOŐĚ`ć -----------------------------

a = subs(real_Pjw,L,1)
b = subs(imag_Pjw,L,1)

figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(a,b,[0 1e2],'LineWidth',1.5)

set(gca,'FontName','Arial','FontSize',14)
xlabel('${\rm Re}[P(j\omega)]$','Interpreter','latex','FontSize',16)
ylabel('${\rm Im}[P(j\omega)]$','Interpreter','latex','FontSize',16)
title('$L = 1$','Interpreter','latex','FontSize',16)

xlim([-1.2 1.2])
ylim([-1.2 1.2])

grid on
axis('square')


