% example_07_02b.m
% 例 7.2：簡略化されたナイキストの安定判別法の利用例 (1)（図 7.7）
% 【Symbolic Math Toolbox が必要】

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 7.2 ')
disp('==================================================')

syms s
syms w real
syms T positive
syms kP real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(1 + Ts) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(1 + T*s)

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

% ------------------------------------------------------
syms wT positive

Ljw = subs(Ljw,w,wT/T);
a = real(Ljw);
b = imag(Ljw);

% ------------------------------------------------------
figure(1)

num = 0;
for kP_val = [0.5 1 2]
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
    h(num) = fplot(a_val, b_val,[1e-5 1e1],'Color',line_color);
    hold on
    fplot(a_val, b_val,[1e1  1e3],'Color',line_color)
end

% ------------------------------------------------------
figure(1)

plot(-1,0,'+')
hold off

legend(h,{'kP = 0.5','kP = 1','kP = 2'}, ...
          'Location','eastoutside')

xlim([-1.2 2.2])
set(gca,'XTick',-1:0.5:2)
ylim([-2.2 1.2])
set(gca,'YTick',-2:0.5:1)

axis square
grid on

xlabel('実軸')
ylabel('虚軸')


