% arm_trans.m
% �����ʂ���]����A�[���n�̓`�B�֐�

disp('�A�[���p�x�̕��t�_����͂��ĉ�����');      % �R�}���h�E�B���h�E�ւ̕\��
ye = input('ye = ');            % y(t) �̕��t�_ ye ���R�}���h�E�B���h�E�œ���
ue = M*l*g*sin(ye)              % u(t) �̕��t�_ ue

numP = 1;                       % �`�B�֐� P(s) �̕��q������ N(s)
denP = [J c M*l*g*cos(ye)];     % �`�B�֐� P(s) �̕��ꑽ���� D(s)
sysP = zpk(tf(numP,denP))       % �`�B�֐� P(s) = N(s)/D(s) �̒�`
pole(sysP)                      % �`�B�֐� P(s) �̋�
