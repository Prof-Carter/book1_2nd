% exercise_06_02_03.m
% ��� 6.2 (3)�F�Q�C�� Gg(w) �ƈʑ��� Gp(w)
% �ySymbolic Math Toolbox ���K�v�z

clear
format compact

syms s
syms w positive

disp(' ')
disp('==================================================')
disp(' ��� 6.2 (3) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('                        s*(s + 1)')
disp(' �`�B�֐� P(s) = --------------------------')
disp('                 2*(s + 3)*(s + 4)*(s + 5)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = s*(s + 1)/(2*(s + 3)*(s + 4)*(s + 5))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �`�B�֐� P(s) = N(s)/D(s) �̕��q N(s)�C���� D(s)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Ns Ds] = numden(Ps)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' N(s) = N1(s)...Nm(s) �̈��� [N1(s), ...,  Nm(s)]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

N = factor(Ns)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' D(s) = D1(s)...Dn(s) �̈��� [D1(s), ...,  Dn(s)]')
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
disp(' �����F [Re[N1(jw)], ...,  Re[Nm(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Re_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �����F [Im[N1(jw)], ...,  Im[Nm(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Im_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �傫���F [|N1(jw)|, ...,  |Nm(jw)|]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Ίp�F [��N1(jw), ...,  ��Nm(jw)]')
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
disp(' �����F [Re[D1(jw)], ...,  Re[Dn(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Re_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �����F [Im[D1(jw)], ...,  Im[Dn(jw)]]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Im_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �傫���F [|D1(jw)|, ...,  |Dn(jw)|]')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Ίp�F [��D1(jw), ...,  ��Dn(jw)]')
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
disp(' �Q�C�� Gg(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ʑ��� Gp(w)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp


