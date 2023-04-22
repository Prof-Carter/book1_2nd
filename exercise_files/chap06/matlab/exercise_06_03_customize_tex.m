% exercise_06_03_customize_tex.m
% ��� 6.3�F���g������
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 6.3�F���g������')
disp('==================================================')

syms s
syms w positive
syms t real
syms A real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = (s + 2)/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
Ps = (s + 2)/(s^2 + 2*s + 2)


disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ���g���`�B�֐� P(jw)')
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
disp(' �Q�C�� Gg(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ʑ��� Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �����g���� u(t) = A*sin(w*t)')
disp(' ���g������ y_app(t) = B(w)*sin(w*t + phi(w))')
disp(' �@�@�@�@�@     B(w) = A*Gg(w), phi(w) = Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

u     = A*sin(w*t)
y_app = A*Gg*sin(w*t + Gp)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' A = 1, w = 1 �̂Ƃ�')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

u     = subs(u    ,{A,w},{1,1})
y_app = subs(y_app,{A,w},{1,1})

% -----------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(u,[0 10],'LineWidth',1.5)
hold on
fplot(y_app,[0 10],'LineWidth',1.5)
hold off

set(gca,'FontName','Arial','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',16)
ylabel('$u(t)$ and $y_{\rm app}$(t)','Interpreter','latex','FontSize',16)

legend({'$u(t)$','$y_{\rm app}(t)$'},...
        'Location','southeast',...
        'Interpreter','latex','FontSize',16)

xlim([0 10])
ylim([-1.5 1.5])
set(gca,'XTick',0:2:10)
set(gca,'YTick',-1.5:0.5:1.5)

grid on






