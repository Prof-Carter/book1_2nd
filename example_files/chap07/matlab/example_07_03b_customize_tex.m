% example_07_03b_customize_tex.m
% 例 7.3：簡略化されたナイキストの安定判別法の利用例 (2)（図 7.8）
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.3 ')
disp('==================================================')

syms s
syms w real
syms kP real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1)^3 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)^3

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' C(s) = kP ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = kP

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(s) = P(s)C(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ls = Ps*Cs

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(jw) = a + jb ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ljw = subs(Ls,s,j*w)

a = real(Ljw);
a = simplify(a)

b = imag(Ljw);
b = simplify(b)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' b = Im[L(jw)] = 0 となる w = wpc ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

assume(w > 0)
wpc = solve(b,w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' L(jwpc) = a_wpc + j*b_wpc')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

a_wpc = subs(a,w,wpc)
b_wpc = subs(b,w,wpc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ナイキストの安定判別法による安定条件 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sol = solve(-1 < a_wpc < 0 & kP > 0, kP,'ReturnConditions',true);
condition = subs(sol.conditions,kP)

% ------------------------------------------------------
figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

num = 0;
for kP_val = [4 8 16]
    a_val = subs(a,kP,kP_val);
    b_val = subs(b,kP,kP_val);
    num = num + 1;

    if num == 1
        line_color = [  0 114 189]/255;
    elseif num == 2
        line_color = [217  83  25]/255;
    else
        line_color = [237 177  32]/255;
    end
    h(num) = ...
    fplot(a_val, b_val,[1e-5 1e1],'Color',line_color,'LineWidth',1.5);
    hold on
    fplot(a_val, b_val,[1e1  1e3],'Color',line_color,'LineWidth',1.5)
end

% ------------------------------------------------------
figure(1)

plot(-1,0,'+','LineWidth',2,'MarkerSize',10)

legend(h,{'${k}_{\rm P} = 4$','${k}_{\rm P} = 8$','${k}_{\rm P} = 16$'}, ...
          'Interpreter','latex','FontSize',16, ...
          'Location','eastoutside')

xlim([-6 18])
set(gca,'XTick',-5:5:15)
ylim([-18 6])
set(gca,'YTick',-15:5:5)

hold off
axis square
grid on

set(gca,'FontSize',14,'FontName','Arial')

xlabel('実軸','FontSize',16,'FontName','MS UI Gothic')
ylabel('虚軸','FontSize',16,'FontName','MS UI Gothic')

movegui('north')

