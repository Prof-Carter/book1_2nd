% example_06_03_02.m
% ó· 6.3 (2)ÅFÉQÉCÉìÇ∆à ëäç∑ÇÃï÷óòÇ»ãÅÇﬂï˚
% ÅySymbolic Math Toolbox Ç™ïKóvÅz

clear
format compact

syms s
syms w positive

disp(' ')
disp('==================================================')
disp(' ó· 6.3 (2) ')
disp('==================================================')

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 5(s + 3)/((s + 1)(s + 2)) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 5*(s + 3)/((s + 1)*(s + 2))

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = N(s)/D(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' N(s) = N1(s)N2(s)...Nm(s) ')
disp(' D(s) = D1(s)D2(s)...Dn(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Ns Ds] = numden(Ps);

Ns = factor(Ns)
Ds = factor(Ds)

% ------------------------------
m = length(Ns);
for i = 1:m
    Njw(i) = subs(Ns(i),s,j*w);
    
    real_Njw(i) = real(Njw(i));
    real_Njw(i) = simplify(real_Njw(i));
    
    imag_Njw(i) = imag(Njw(i));
    imag_Njw(i) = simplify(imag_Njw(i));
    
    abs_Njw(i) = sqrt(real_Njw(i)^2 + imag_Njw(i)^2);
    abs_Njw(i) = simplify(abs_Njw(i));
    
    angle_Njw(i) = atan(imag_Njw(i)/real_Njw(i));
    angle_Njw(i) = simplify(angle_Njw(i));
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [N1(jw)  N2(jw)  ...  Nm(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [|N1(jw)|  |N2(jw)|  ...  |Nm(jw)|] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Njw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [Å⁄N1(jw)  Å⁄N2(jw)  ...  Å⁄Nm(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Njw

% ------------------------------
n = length(Ds);
for i = 1:n
    Djw(i) = subs(Ds(i),s,j*w);
    
    real_Djw(i) = real(Djw(i));
    real_Djw(i) = simplify(real_Djw(i));
    
    imag_Djw(i) = imag(Djw(i));
    imag_Djw(i) = simplify(imag_Djw(i));
    
    abs_Djw(i) = sqrt(real_Djw(i)^2 + imag_Djw(i)^2);
    abs_Djw(i) = simplify(abs_Djw(i));
    
    angle_Djw(i) = atan(imag_Djw(i)/real_Djw(i));
    angle_Djw(i) = simplify(angle_Djw(i));
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [D1(jw)  D2(jw)  ...  Dn(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [|D1(jw)|  |D2(jw)|  ...  |Dn(jw)|] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Djw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' [Å⁄D1(jw)  Å⁄D2(jw)  ...  Å⁄Dn(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Djw

% ------------------------------
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
disp('         |N1(jw)||N2(jw)|...|Nm(jw)|')
disp(' Gg(w) = ---------------------------')
disp('         |D1(jw)||D2(jw)|...|Dn(jw)|')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' Gp(w) = Å⁄N1(jw) + Å⁄N2(jw) + ... + Å⁄Nm(jw)')
disp('       - (Å⁄D1(jw) + Å⁄D2(jw) + ... + Å⁄Dn(jw))')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp


