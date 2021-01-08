function [root,ea,iter] = myModSecant(func, delta, xr, es, maxit, varargin)
    % input:
    %   func : 근을 찾을 함수 핸들
    %   delta : 수정 할선법에서 미분값 계산에 사용할 변동률
    %   xr : 초기 추정치
    %   maxit : 최대 반복 횟수
    %   es : 상대오차 종료조건 
    %   varargin : 함수 값 계산을 위한 추가 파라메터(t,g,cd)
    % output:
    %   root : 해
    %   ea : 마지막 iteration에서의 상대 오차
    %   iter : iteration 횟수
    
    %-----------------------------------------------------
    %
    %   교재 177페이지 newton-raphson법 코드를 참고하여 할선법 코드를 구현하시오.    
    %
    %----------------------------------------------------- 

    iter = 0 ; %반복횟수를 초기화합니다. 
    while(1)
        xrold = xr ; %xi 값을 저장합니다. 
        xr = xr - (delta*xr*func(xr,varargin{:}))/(func(xr+xr*delta,varargin{:})-func(xr, varargin{:})); %수정할선법으로 다음 추정치(xi+1)을 구합니다.
        iter = iter + 1 ; %반복횟수를 +1카운트 합니다. 
        if xr ~= 0, ea =abs((xr-xrold)/xr)*100 ; end %Ea를 구합니다. 
        if ea <= es || iter >=maxit, break, end % 적정 오차를 찾거나 반복횟수를 초과했을 때 반복문을 탈출합니다.
    end 
    root = xr ; % 해를 구했습니다. 
end