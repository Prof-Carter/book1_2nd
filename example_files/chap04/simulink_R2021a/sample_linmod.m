% sample_linmod.m
% Simulink �𗘗p�����u���b�N���}�̌���

[A B C D] = linmod('fbk_block');    % Simulink ���f�� fbk_block.slx ������͂� In1, In2�C
sys = ss(A,B,C,D);                  % �o�͂� Out1, Out2 �Ƃ�����ԋ�ԕ\���𐶐�
sys = tf(sys);      % ��ԋ�ԕ\����`�B�֐��\���ɕϊ�

sysGyr = sys(1,1)   % r(s) (In1) ���� y(s) (Out1) �ւ̓`�B�֐� Gyr(s)
sysGyd = sys(1,2)   % d(s) (In2) ���� y(s) (Out1) �ւ̓`�B�֐� Gyd(s)
sysGer = sys(2,1)   % r(s) (In1) ���� e(s) (Out2) �ւ̓`�B�֐� Ger(s)
sysGed = sys(2,2)   % d(s) (In2) ���� e(s) (Out2) �ւ̓`�B�֐� Ged(s)