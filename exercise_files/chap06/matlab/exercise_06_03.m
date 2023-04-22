% exercise_06_03.m
% ñ‚ëË 6.3ÅFé¸îgêîâûìö
% ÅySymbolic Math Toolbox Ç™ïKóvÅz

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ñ‚ëË 6.3ÅFé¸îgêîâûìö')
disp('==================================================')

syms s
syms w positive
syms t real
syms A real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ì`íBä÷êî P(s) = (s + 2)/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
Ps = (s + 2)/(s^2 + 2*s + 2)


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' é¸îgêîì`íBä÷êî P(jw)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)
Pjw = simplify(Pjw);
Pjw = collect(Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Re[P(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Re_Pjw = real(Pjw);
Re_Pjw = simplify(Re_Pjw);
Re_Pjw = collect(Re_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Im[P(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Im_Pjw = imag(Pjw);
Im_Pjw = simplify(Im_Pjw);
Im_Pjw = collect(Im_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ÉQÉCÉì Gg(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' à ëäç∑ Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ê≥å∑îgì¸óÕ u(t) = A*sin(w*t)')
disp(' é¸îgêîâûìö y_app(t) = B(w)*sin(w*t + phi(w))')
disp(' Å@Å@Å@Å@Å@     B(w) = A*Gg(w), phi(w) = Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

u     = A*sin(w*t)
y_app = A*Gg*sin(w*t + Gp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' A = 1, w = 1 ÇÃÇ∆Ç´')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

u     = subs(u    ,{A,w},{1,1})
y_app = subs(y_app,{A,w},{1,1})

% -----------------------------------------------
figure(1)
fplot(u,[0 10])
hold on
fplot(y_app,[0 10])
hold off

xlabel('t [s]')
ylabel('u(t) and y_{app}(t)')

legend('u(t)','y_{app}(t)')


