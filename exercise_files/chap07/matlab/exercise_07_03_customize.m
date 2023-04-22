% exercise_07_03_customize.m
% ��� 7.3�F����]�T
% �ySymbolic Math Toolbox ���K�v�z

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 7.3 (1)�F����]�T ')
disp('==================================================')

syms s
syms w positive
syms kP positive

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ����Ώۂ̓`�B�֐� P(s) = 1/(s + 2)^4')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 2)^4

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �R���g���[���̓`�B�֐� C(s) = kP > 0 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Cs = kP

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �J���[�v�`�B�֐� L(s) = P(s)C(s) ')
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
disp(' ��L(jw)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

angle_Ljw

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ʑ������p���g�� wpc [rad/s] ')
disp(' (��L(jw) = -180 [deg] = -pi [rad] �ƂȂ� w = wpc) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

wpc = solve(angle_Ljw == -pi, w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' |L(j*wpc)| ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

abs_Ljwpc = subs(abs_Ljw,w,wpc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Q�C���]�T Gm = 20*log10(|L(j*wpc)|) [dB] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gm = - 20*log10(abs_Ljwpc)

% ------------------------------------------------------
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �Q�C�������p���g�� wgc [rad/s] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

[wgc params conds] = solve(abs_Ljw==1, w, 'ReturnConditions', true);

wgc
conds

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �ʑ��]�T Pm = 180 + ��L(jwgc) [deg] ')
disp(' �@�@�@�@    =  pi + ��L(jwgc) [rad] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pm = pi + subs(angle_Ljw,w,wgc)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' �i�C�L�X�g�̈��蔻�ʖ@�ɂ�������� ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

disp(' ')
disp(' ---- L(j*wpc) ---- ')
Ljwpc = simplify(subs(Ljw,w,wpc))

disp(' ')
disp(' ---- L(j*wpc) > -1 ���� kP > 0 ---- ')
sol = solve(Ljwpc > -1 & kP > 0, kP, 'ReturnConditions', true);
condition = subs(sol.conditions,kP)

% ------------------------------------------------------
figure(1)
subplot('Position',[0.15 0.15 0.7 0.775])

% ------------------------------------------------------
figure(1)
yyaxis left

fplot(Gm,[0 80],'LineWidth',1.5)

xlim([0 80])
ylim([-2.5 62.5]) 
set(gca,'XTick',0:10:80)
set(gca,'YTick',0:10:60)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('kP','FontSize',16,'FontName','Arial')
ylabel('Gm [dB]','FontSize',16,'FontName','Arial')

% ------------------------------------------------------
figure(1)
yyaxis right

fplot((180/pi)*Pm,[0 80],'LineWidth',1.5)

xlim([0 80])
ylim([-7.5 180+7.5])
set(gca,'XTick',0:10:80)
set(gca,'YTick',0:30:180)

set(gca,'FontSize',14,'FontName','Arial')

xlabel('kP','FontSize',16,'FontName','Arial')
ylabel('Pm [deg]','FontSize',16,'FontName','Arial')

grid on

% ------------------------------------------------------
disp(' ')
disp('==================================================')
disp(' ��� 7.3 (2)�F�ʑ��]�T�� Pm = 60 [deg] �ƂȂ�悤�� ')
disp(' �@�@        �@���Q�C�� kP ��݌v ')
disp('==================================================')

sol_kP = solve(Pm*180/pi == 60, kP)
double(sol_kP)

figure(1)
hold on
plot([0 80],[60 60])
plot(double(sol_kP),60,'o', ...    
                 'MarkerFaceColor',[1 1 1], ...
                 'LineWidth',1.5, ...
                 'MarkerSize',8);
hold off
