% exercise_04_08_01a.m
% ��� 4.8 (1)�F�P�ʃX�e�b�v�O���ɑ΂�����l

clear
format compact

disp(' ')
disp('==================================================')
disp(' ��� 4.8 (1) ')
disp('==================================================')

s = tf('s');

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ����Ώ� P(s) = 5/(s^2 + 2*s + 2)')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

sysP = 5/(s^2 + 2*s + 2);

for kP = [2 5]

    disp(' ')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp(' �R���g���[�� C(s) = kP')
    disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

    sysC = kP

    disp(' ')
    disp('--------------------------------------------------')
    disp('  Gyd(s) = P(s)/(1 + P(s)*C(s))')
    disp('--------------------------------------------------')

    sysL   = minreal(sysP*sysC);
    sysGyd = minreal(sysP/(1 + sysL))
    
    [numGyd denGyd] = tfdata(sysGyd,'v');
    
    disp(' ')
    disp('--------------------------------------------------')
    disp('  �P�ʃX�e�b�v�O���ɑ΂�����l y_inf = Gyd(0)')
    disp('--------------------------------------------------')

    y_inf = sym(numGyd(end)/denGyd(end))
end
