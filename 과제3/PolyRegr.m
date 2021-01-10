function [R2,A] = PolyRegr(XData, YData, order)
    
	% order 차원의 다항식 회귀분석을 수행하는 코드를 작성하시오.
	% polyfit과 polyval은 사용 불가
	
    % 데이터를 plot하기위한 코드를 작성하시오.
	% scatter 및 plot 내장함수를 사용하시오.
	% RegressionScript.m을 실행했을 때, 8개의 그래프가 모두 각기 다른 window에 그려지도록 작성하시오.
	% plot 데이터의 x축 간격은 0.1이 되도록 구현하시오.
    
    % input : 
    %          XData = independent variable(코로나 검색결과)
    %          YData = dependent variable(종속변수) 
    %          order = 차원
    
    % output :
    %           R2 = vector of slope, r(1), and intercept, r(2) 
    %           A = coefficient of determination(결정계수)
    
    %데이터가 한쌍으로 들어와야 한다.
    n = length(XData) ; 
    if length(YData) ~=n, error('x and y must be same length'); end 
   
    %기울기와 절편을 반환 
    d = order+1
    Z = zeros(n,d);
    for i=1:d
        Z(:, i) = XData.^(i-1) ;
    end
    A = pinv(Z)*YData ;
    %R2 잔차를 구하는 코드 
    Sr = sum((YData-Z*A).^2) ;
    R2 = 1-Sr/sum((YData-mean(YData)).^2);
    
    %결정된 식을 그래프로 그리자.
    
    q = (min(XData):max(XData)/100:max(XData))' ;
    qq = zeros(length(q),d);
    for i = 1:d
        qq(:,i) = q.^(i-1);
    end
    figure;scatter(XData, YData);
    hold on
    
    plot(q,qq*A,'r') ;
    title(R2);
end