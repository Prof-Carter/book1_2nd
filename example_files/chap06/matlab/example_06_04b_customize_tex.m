% example_06_04b_customize_tex.m
% ó· 6.4ÅFÉxÉNÉgÉããOê’Ç∆ÉiÉCÉLÉXÉgãOê’
% ÅySymbolic Math Toolbox Ç™ïKóvÅz

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' ó· 6.4 ')
disp('==================================================')

syms s
syms w real

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(s) = 1/(s + 1) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Ps = 1/(s + 1)
% P(s) = 1/(s + 1)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' é¸îgêîì`íBä÷êî P(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Pjw = subs(Ps,s,j*w)
% Pjw = P(j*w)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(jw) ÇÃé¿ïî a = Re[P(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

real_Pjw = real(Pjw);
a = simplify(real_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' P(jw) ÇÃãïïî b = Im[P(jw)] ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

imag_Pjw = imag(Pjw);
b = simplify(imag_Pjw)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' (a - 1/2)^2 + b^2 ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

eq = (a - 1/2)^2 + b^2
eq = simplify(eq)

% ============================================
disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' ÉQÉCÉì Gg(w) = |P(jw)| ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gg = sqrt(real_Pjw^2 + imag_Pjw^2);
Gg = simplify(Gg)

disp(' ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')
disp(' à ëäç∑ Gp(w) = Å⁄P(jw) ')
disp('++++++++++++++++++++++++++++++++++++++++++++++++++')

Gp = atan(imag_Pjw/real_Pjw);
Gp = simplify(Gp)

% ============================================
% ï\ 6.1 ÇÃçÏê¨ 
% ============================================
disp(' ')
disp(' ---- w = 0, 1/2, 1, 2, Inf ---- ')
disp(' ')
fprintf('|     w [rad/s]\t|')
for num_w = [0 1/2 1 2 Inf]
    fprintf('%12s\t|',char(sym(num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| a = Re[P(jw)]\t|')
for num_w = [0 1/2 1 2 Inf]
    fprintf('%12s\t|',char(limit(a,w,num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| b = Im[P(jw)]\t|')
for num_w = [0 1/2 1 2 Inf]
    fprintf('%12s\t|',char(limit(b,w,num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('|       |P(jw)|\t|')
for num_w = [0 1/2 1 2 Inf]
    fprintf('%12s\t|',char(limit(Gg,w,num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| Å⁄P(jw) [deg]\t|')
for num_w = [0 1/2 1 2 Inf]
    fprintf('%12.3f\t|',double(limit(Gp*180/pi,w,num_w)))
end
disp(' ')

% ============================================
disp(' ')
disp(' ---- w = 0, -1/2, -1, -2, -Inf ---- ')
disp(' ')
fprintf('|     w [rad/s]\t|')
for num_w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12s\t|',char(sym(num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| a = Re[P(jw)]\t|')
for num_w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12s\t|',char(limit(a,w,num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| b = Im[P(jw)]\t|')
for num_w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12s\t|',char(limit(b,w,num_w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('|       |P(jw)|\t|')
for num_w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12s\t|',char(limit(Gg,w,num_w)))
end
disp(' ')

disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| Å⁄P(jw) [deg]\t|')
for num_w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12.3f\t|',double(limit(Gp*180/pi,w,num_w)))
end
disp(' ')

% ============================================
% ê} 6.4 ÇÃï`âÊ 
% ============================================
figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

fplot(a,b,[ 1e-5 1e1 ],'Color',[0 114 189]/255,'LineWidth',1.5)
hold on
fplot(a,b,[ 1e1  1e3 ],'Color',[0 114 189]/255,'LineWidth',1.5)

fplot(a,b,[-1e1 -1e-5],'--','Color',[217 83 25]/255,'LineWidth',1.5)
fplot(a,b,[-1e3 -1e1 ],'--','Color',[217 83 25]/255,'LineWidth',1.5)

plot([-0.1 1.1],[0 0],'k')
plot([0 0],[-0.55 0.55],'k')

i = 0;
for num_w = [0 1/2 1 2 Inf]
    i = i + 1;
    h(i) = plot(limit(a,w,num_w),limit(b,w,num_w),...
          'o', ...
          'MarkerFaceColor',[1 1 1], ...
          'LineWidth',1.5, ...
          'MarkerSize',8);
end
for num_w = [-1/2 -1 -2 -Inf]
    i = i + 1;
    h(i) = plot(limit(a,w,num_w),limit(b,w,num_w),...
          '*', ...
          'LineWidth',1.5, ...
          'MarkerSize',8);
end
hold off

grid on

set(gca,'FontName','Arial','FontSize',14)
xlabel('Real part','FontName','Arial','FontSize',16)
ylabel('Imaginary part','FontName','Arial','FontSize',16)

axis('square')
xlim([-0.1 1.1])
ylim([-0.55 0.55])

set(gca,'XTick',-0.1:0.1:1.1)
set(gca,'XTickLabel',{'',0,'','','','',0.5,'','','','',1,''})
set(gca,'XTickLabelRotation',0)

set(gca,'YTick',-0.5:0.1:0.5)
set(gca,'YTickLabel',{-0.5,'','','','',0,'','','','',0.5})

legend(h,{'$\omega = 0$','$\omega = 1/2$',' $\omega = 1$',' $\omega = 2$',' $\omega = \infty$', ...
                         '$\omega = -1/2$','$\omega = -1$','$\omega = -2$','$\omega = -\infty$'}, ...
          'Interpreter','latex','FontSize',16, ...
          'Location','eastoutside')
