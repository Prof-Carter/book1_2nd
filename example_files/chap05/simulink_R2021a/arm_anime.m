% arm_anime.m
% 鉛直面を回転するアーム系の非線形シミュレーションのアニメーション表示

close all

n = length(y);
h = 20;     % 間引きする間隔

for i = 1:n
    if mod(t(i)*1000,h) == 0
        figure(10)
        movegui('northwest')

        clf
        box on
        axis([-0.5 0.5 -0.5 0.5])
        axis('square')
        set(gca,'FontSize',12,'FontName','arial')
        set(gca,'XTick',[])        % 横軸の目盛
	    set(gca,'XTickLabel',[])   % 横軸の目盛のラベル
	    set(gca,'YTick',[])        % 縦軸の目盛
	    set(gca,'YTickLabel',[])   % 縦軸の目盛のラベル
    
        % アーム取り付け台
        xaxis = [-0.05 -0.05 0.05 0.05 -0.05];
        yaxis = [-0.05 0.05 0.05 -0.05 -0.05]; 
        patch(xaxis,yaxis,[0.6 0.6 0.6])
    
        % 足
        xaxis = [-0.13 -0.13 -0.12 -0.12 -0.13];
        yaxis = [-0.1 -0.015 -0.015 -0.1 -0.1]; 
        patch(xaxis,yaxis,'k')
    
        xaxis = [0.13 0.13 0.12 0.12 0.13];
        yaxis = [-0.1 -0.015 -0.015 -0.1 -0.1]; 
        patch(xaxis,yaxis,'k')
    
        xaxis = [-0.15 -0.15 -0.1 -0.1 -0.15];
        yaxis = [-0.09 -0.1 -0.1 -0.09 -0.09]; 
        patch(xaxis,yaxis,'k')
    
        xaxis = [0.15 0.15 0.1 0.1 0.15];
        yaxis = [-0.09 -0.1 -0.1 -0.09 -0.09]; 
        patch(xaxis,yaxis,'k')
    
        % 台
        xaxis = [-0.175 -0.175 0.175 0.175 -0.175];
        yaxis = [-0.07 -0.05 -0.05 -0.07 -0.07]; 
        patch(xaxis,yaxis,[0.6 0.6 0.6])
    
        % 地面
        xaxis = [-0.35 -0.35 0.35 0.35 -0.35];
        yaxis = [-0.1 -0.5 -0.5 -0.1 -0.1]; 
        patch(xaxis,yaxis,[218 180 142]/255)
    
        % アーム
        line([0 -2*l*sin(y(i))],[0 -2*l*cos(y(i))],'Color',[68 114 196]/255,'LineWidth',12.5);
       
        % 目標値
        line([0 -1*sin(rc)],[0 -1*cos(rc)],'Color',[1 0 0])
       
        % 時間
        text(0.575,0.4,num2str(ceil(100*t(i))/100),'fontsize',12,'fontname','arial')
        text(0.7,0.4,'[s]','fontsize',12,'fontname','arial')
    
        drawnow

        % ====================================================
        % グラフ
        figure(11)
        movegui('northeast')
        subplot('Position',[0.15 0.15 0.8 0.8])
        plot([0 3],rc*(180/pi)*[1 1],'Color',[1 0 0])
        hold on
        plot(t(1:i),y(1:i)*180/pi,'LineWidth',1.5,'Color',[68 114 196]/255)
        hold off

        xlim([0 3])
        ylim(k*[0 45])
        set(gca,'YTick',k*[0:7.5:45])
        set(gca,'FontName','arial','FontSize',14)
        xlabel('t [s]','FontName','arial','FontSize',16)
        ylabel('y(t) [deg]','FontName','arial','FontSize',16)

        grid on

        drawnow
    end

end