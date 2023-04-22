% example_06_04a_customize_tex.m
% 例 6.4：ベクトル軌跡とナイキスト軌跡

close all
clear
format compact

disp(' ')
disp('==================================================')
disp(' 例 6.4 ')
disp('==================================================')

% ============================================
% 表 6.1 の作成 
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
for w = [0 1/2 1 2 Inf]
    a = 1/(w^2 + 1);
    fprintf('%12s\t|',char(sym(a)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| b = Re[P(jw)]\t|')
for w = [0 1/2 1 2 Inf]
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);
    fprintf('%12s\t|',char(sym(b)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('|       |P(jw)|\t|')
for w = [0 1/2 1 2 Inf]
    a =   1/(w^2 + 1);
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);
    Gg = sqrt(a^2 + b^2);
    fprintf('%12s\t|',char(sym(Gg)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| ∠P(jw) [deg]\t|')
for w = [0 1/2 1 2 Inf]
    Gp = - atan(w);
    fprintf('%12.3f\t|',Gp*180/pi)
end
disp(' ')

% ============================================
disp(' ')
disp(' ---- w = 0, -1/2, -1, -2, -Inf ---- ')
disp(' ')
fprintf('|     w [rad/s]\t|')
for w = [0 -1/2 -1 -2 -Inf]
    fprintf('%12s\t|',char(sym(w)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| a = Re[P(jw)]\t|')
for w = [0 -1/2 -1 -2 -Inf]
    a = 1/(w^2 + 1);
    fprintf('%12s\t|',char(sym(a)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| b = Im[P(jw)]\t|')
for w = [0 -1/2 -1 -2 -Inf]
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);
    fprintf('%12s\t|',char(sym(b)))
end
disp(' ')
disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('|       |P(jw)|\t|')
for w = [0 -1/2 -1 -2 -Inf]
    a =   1/(w^2 + 1);
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);
    Gg = sqrt(a^2 + b^2);
end
disp(' ')

disp('+---------------+---------------+---------------+---------------+---------------+---------------+')
fprintf('| ∠P(jw) [deg]\t|')
for w = [0 -1/2 -1 -2 -Inf]
    Gp = - atan(w);
    fprintf('%12.3f\t|',Gp*180/pi)
end
disp(' ')

% ============================================
% 図 6.4 の描画 
% ============================================
figure(1)
set(gcf,'Position',[100 100 800 420]) 
subplot('Position',[0.15 0.15 0.775 0.775])

w = logspace(-5,3,10001)
a =   1./(w.^2 + 1);
b = - w./(w.^2 + 1);

plot(a,b,'LineWidth',1.5)
hold on

w = - logspace(-5,3,10001)
a =   1./(w.^2 + 1);
b = - w./(w.^2 + 1);

plot(a,b,'LineWidth',1.5)

plot([-0.1 1.1],[0 0],'k')
plot([0 0],[-0.55 0.55],'k')

i = 0;
for w = [0 1/2 1 2 Inf]
    i = i + 1;

    a =   1/(w^2 + 1);
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);

    h(i) = plot(a,b,...
        'o', ...
        'MarkerFaceColor',[1 1 1], ...
        'LineWidth',1.5, ...
        'MarkerSize',8);
end
for w = [-1/2 -1 -2 -Inf]
    i = i + 1;

    a =   1/(w^2 + 1);
%    b = - w/(w^2 + 1);     % この式だと，w = Inf のときに b = NaN になるので，分子が 1 になるように式変形
    b = - 1/(w + 1/w);

    h(i) = plot(a,b,...
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
