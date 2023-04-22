% sample_lsim1.m
% ”CˆÓ‚Ì“ü—Í‚É‘Î‚·‚é‰ž“š‚Ì•`‰æ

close all
clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

u1 = t;
figure(1); lsim(sysP,u1,t)

u2 = sin(4*t);
figure(2); lsim(sysP,u2,t)

% -------------------------------------------
figure(1); movegui('northwest')
figure(2); movegui('northeast')