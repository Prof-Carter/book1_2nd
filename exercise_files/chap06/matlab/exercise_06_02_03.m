% exercise_06_02_03.m
% 問題 6.2 (3)：ゲイン Gg(w) と位相差 Gp(w)
% 【Symbolic Math Toolbox が必要】

clear
format compact

syms s
syms w positive

disp(' ')
disp('==================================================')
disp(' 問題 6.2 (3) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('                        s*(s + 1)')
disp(' 伝達関数 P(s) = --------------------------')
disp('                 2*(s + 3)*(s + 4)*(s + 5)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = s*(s + 1)/(2*(s + 3)*(s + 4)*(s + 5))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 伝達関数 P(s) = N(s)/D(s) の分子 N(s)，分母 D(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Ns Ds] = numden(Ps)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' N(s) = N1(s)...Nm(s) の因数 [N1(s), ...,  Nm(s)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

N = factor(Ns)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' D(s) = D1(s)...Dn(s) の因数 [D1(s), ...,  Dn(s)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

D = factor(Ds)

% =========================
m = length(N);
for i = 1:m
    Njw(i) = subs(N(i),s,j*w);
    
    Re_Njw(i) = real(Njw(i));
    Re_Njw(i) = simplify(Re_Njw(i));
    Re_Njw(i) = collect(Re_Njw(i));

    Im_Njw(i) = imag(Njw(i));
    Im_Njw(i) = simplify(Im_Njw(i));
    Im_Njw(i) = collect(Im_Njw(i));

    abs_Njw(i) = sqrt(Re_Njw(i)^2 + Im_Njw(i)^2);
    abs_Njw(i) = simplify(abs_Njw(i));
    abs_Njw(i) = collect(abs_Njw(i));

    angle_Njw(i) = atan(Im_Njw(i)/Re_Njw(i));
    angle_Njw(i) = simplify(angle_Njw(i));
    angle_Njw(i) = collect(angle_Njw(i));
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [N1(jw), ...,  Nm(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 実部： [Re[N1(jw)], ...,  Re[Nm(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Re_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 虚部： [Im[N1(jw)], ...,  Im[Nm(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Im_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 大きさ： [|N1(jw)|, ...,  |Nm(jw)|]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 偏角： [∠N1(jw), ...,  ∠Nm(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Njw
    
% =========================
n = length(D);
for i = 1:n
    Djw(i) = subs(D(i),s,1j*w);
    
    Re_Djw(i) = real(Djw(i));
    Re_Djw(i) = simplify(Re_Djw(i));
    Re_Djw(i) = collect(Re_Djw(i));

    Im_Djw(i) = imag(Djw(i));
    Im_Djw(i) = simplify(Im_Djw(i));
    Im_Djw(i) = collect(Im_Djw(i));

    abs_Djw(i) = sqrt(Re_Djw(i)^2 + Im_Djw(i)^2);
    abs_Djw(i) = simplify(abs_Djw(i));
    abs_Djw(i) = collect(abs_Djw(i));

    angle_Djw(i) = atan(Im_Djw(i)/Re_Djw(i));
    angle_Djw(i) = simplify(angle_Djw(i));
    angle_Djw(i) = collect(angle_Djw(i));
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [D1(jw), ...,  Dn(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 実部： [Re[D1(jw)], ...,  Re[Dn(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Re_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 虚部： [Im[D1(jw)], ...,  Im[Dn(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Im_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 大きさ： [|D1(jw)|, ...,  |Dn(jw)|]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 偏角： [∠D1(jw), ...,  ∠Dn(jw)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Djw

% =========================
Gg = 1;
Gp = 0;
for i = 1:m
    Gg = Gg*abs_Njw(i);
    Gp = Gp + angle_Njw(i);
end
for i = 1:n
    Gg = Gg/abs_Djw(i);
    Gp = Gp - angle_Djw(i);
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ゲイン Gg(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' 位相差 Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp


