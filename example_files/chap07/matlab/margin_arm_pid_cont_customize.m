% margin_arm_pid_cont_customize.m
% 周波数整形によるアーム系の PID 制御
% （グラフのカスタマイズ）

close all
clear
format compact

v = ver('MATLAB');
if v.Release < "(R2021a)"
    disp('****************************')
    disp('R2021a 以降で動作します')
    disp('****************************')
else

    arm_para
    
    s = tf('s');
    sysP = 1/(J*s^2 + c*s + M*g*l);
    
    t = 0:0.001:1.5;
    w = logspace(-2,3,1000);
    
    % -----------------------------------
    options1 = bodeoptions;            % ボード線図のオプション一覧
    
    options1.Xlabel.String = '角周波数';            % 横軸のラベル
    options1.Ylabel.String = {'ゲイン'  '位相'};    % 縦軸のラベル
    
    options1.Title.FontSize     = 14;  % タイトルのフォントサイズ
    options1.Xlabel.FontSize    = 16;  % 横軸のラベルのフォントサイズ
    options1.YLabel.FontSize    = 16;  % 縦軸のラベルのフォントサイズ
    options1.TickLabel.FontSize = 14;  % 軸のフォントサイズ
    
    % -----------------------------------
    options2 = timeoptions;            % 時間応答のオプション一覧
    
    options2.Title.String = 'ステップ応答';
    
    options2.Title.FontSize     = 14;
    options2.XLabel.FontSize    = 16;
    options2.YLabel.FontSize    = 16;
    options2.TickLabel.FontSize = 14;
    
    % -----------------------------------
    for i = 1:7
        figure(i)
        subplot('Position',[0.15 0.15 0.775 0.775])
    end
    
    % -----------------------------------
    for i = 1:3
        if i == 1
            kP = 5.75; TI = 0.75; TD = 0.026;
            Tf = 0;
            line_type = 'b--';
        elseif i == 2
            kP = 5.75; TI = 0.75; TD = 0.026;
            Tf = TD/2;
            line_type = 'r-';
        else
            kP = 5.75; TI = 0.75; TD = 0;
            Tf = 0;
            line_type = 'g-.';
        end
        
        sysC = kP*(1 + 1/(TI*s) + TD*s/(1 + Tf*s));
        figure(7); bode(sysC,w,options1,line_type); hold on

        sysL = minreal(sysP*sysC);
        figure(i); margin(sysL,options1)
    
        h = findobj(gcf,'type','Line');   % Line という名前のオブジェクトを検索
        set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
        
        ax = findall(gcf,'type','Axes');
        set(ax(2),'Xlim',[1e-2 1e3])	% 横軸目盛範囲
        set(ax(2),'Ylim',[-200 -25])    % 位相：縦軸目盛範囲
        set(ax(3),'Ylim',[-80 60])      % ゲイン：縦軸目盛範囲
    
        set(ax(2),'Ytick',-180:45:0)      % 位相：縦軸目盛
        set(ax(3),'Ytick',-80:20:60)      % ゲイン：縦軸目盛
    
        sysS = minreal(   1/(1 + sysL));
        sysT = minreal(sysL/(1 + sysL));
    
        figure(4); step(sysT,t,options2,line_type); hold on    
        figure(5); bodemag(sysS,w,options1,line_type); hold on    
        figure(6); bodemag(sysT,w,options1,line_type); hold on
    end
    
    figure(4); hold off
    ylim([0 1.5])
    
    figure(5); hold off; grid on
    ylim([-60 20])
    
    figure(6); hold off; grid on
    ylim([-60 20])
    
    for i = 4:7
        figure(i)
        h = findobj(gcf,'type','Line');   % Line という名前のオブジェクトを検索
        set(h,'LineWidth',1.5)            % 線の太さを 1.5 ポイントに変更
    
        [~, hobj, ~, ~] = legend({'PID (Tf = 0)','PID (Tf = TD/2)','PI'}, ...
                                  'FontSize',14,'FontName','Arial');
        hh = findobj(hobj,'type','Line');
        set(hh,'LineWidth',1.5)
    end
    
    figure(4); set(legend,'Location','southeast')
    figure(5); set(legend,'Location','southeast')
    figure(6); set(legend,'Location','southwest')
    figure(7); set(legend,'Location','northwest')
    
    % -----------------------------------
    figure(1); movegui('northwest')
    figure(2); movegui('north')
    figure(3); movegui('northeast')
    figure(4); movegui('southwest')
    figure(5); movegui('south')
    figure(6); movegui('southeast')
    figure(7); movegui('center'); grid on

end