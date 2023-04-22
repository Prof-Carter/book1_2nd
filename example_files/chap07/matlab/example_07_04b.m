% example_07_04b.m
% —á 7.4FˆÀ’è—]—Ti} 7.13, 7.14j
% ySymbolic Math Toolbox ‚ª•K—vz

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' —á 7.4 ')
disp('==================================================')

syms s
syms w positive
syms kP positive

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
disp(' L(s) = N(s)/D(s) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[Ns Ds] = numden(Ls)

Ns = factor(Ns);
Ds = factor(Ds);

% ------------------------------------------------------
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

% ------------------------------------------------------
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

% ------------------------------------------------------
abs_Ljw   = 1;
angle_Ljw = 0;

for i = 1:m
    abs_Ljw   = abs_Ljw*abs_Njw(i);
    angle_Ljw = angle_Ljw + angle_Njw(i);
end

for i = 1:n
    abs_Ljw   = abs_Ljw/abs_Djw(i);
    angle_Ljw = angle_Ljw - angle_Djw(i);
end

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |L(jw)| ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Ljw

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ÚL(jw)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Ljw

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ˆÊ‘ŠŒð·ŠpŽü”g” wpc [rad/s] ')
disp(' (ÚL(jw) = -180 [deg] = -pi [rad] ‚Æ‚È‚é w = wpc) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wpc = solve(angle_Ljw == -pi, w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |L(j*wpc)| ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Ljwpc = subs(abs_Ljw,w,wpc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ƒQƒCƒ“—]—T Gm = 20*log10(|L(j*wpc)|) [dB] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gm = - 20*log10(abs_Ljwpc)

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ƒQƒCƒ“Œð·ŠpŽü”g” wgc [rad/s] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[wgc params conds] = solve(abs_Ljw==1, w, 'ReturnConditions', true);

wgc
conds

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ˆÊ‘Š—]—T Pm = 180 + ÚL(jwgc) [deg] ')
disp(' @@@@    =  pi + ÚL(jwgc) [rad] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pm = pi + subs(angle_Ljw,w,wgc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ƒiƒCƒLƒXƒg‚ÌˆÀ’è”»•Ê–@‚É‚æ‚éˆÀ’èðŒ ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp(' ')
disp(' ---- L(j*wpc) ---- ')
Ljwpc = simplify(subs(Ljw,w,wpc))

disp(' ')
disp(' ---- L(j*wpc) > -1 ‚©‚Â kP > 0 ---- ')
sol = solve(Ljwpc > -1 & kP > 0, kP,'ReturnConditions',true);
condition = subs(sol.conditions,kP)

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1)
yyaxis left

fplot(Gm,[0 10])
xlabel('kP')
ylabel('Gm [dB]')

% ------------------------------------------------------
figure(1)
yyaxis right

fplot((180/pi)*Pm,[0 10])
xlabel('kP')
ylabel('Pm [deg]')

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(2)

us = 1/s;

num = 0;
for kP_val = 2:2:8
    num = num + 1;

    Gyrs = collect(Ps*kP_val/(1 + Ps*kP_val),s);
    ys = Gyrs*us;
    yt = ilaplace(ys);

    h(num) = fplot(yt,[0 10]);
    hold on
end

figure(2)
plot([0 10],[1 1],'k')

xlim([0 10])
set(gca,'XTick',0:2:10)
ylim([0 2])
set(gca,'YTick',0:0.5:2)

xlabel('t [s]')
ylabel('y(t)')

hold off
grid on

legend(h,{'kP = 2','kP = 4','kP = 6','kP = 8'})

% ++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure(1); movegui('northwest')
figure(2); movegui('northeast')
