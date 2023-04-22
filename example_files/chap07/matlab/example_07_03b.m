% example_07_03b_customize.m
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
    fplot(a_val, b_val,[1e-5 1e1],'Color',line_color);
    hold on
    fplot(a_val, b_val,[1e1  1e3],'Color',line_color)
end

% ------------------------------------------------------
figure(1)

plot(-1,0,'+')

legend(h,{'kP = 4','kP = 8','kP = 16'}, ...
          'Location','eastoutside')

xlim([-6 18])
set(gca,'XTick',-5:5:15)
ylim([-18 6])
set(gca,'YTick',-15:5:5)

hold off
axis square
grid on

xlabel('実軸')
ylabel('虚軸')


