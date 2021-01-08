function [root,ea,iter] = myFzero(func, delta, es, maxit, incSearchRange,varargin)
    % input:
    %   func : 근을 찾을 함수 핸들
    %   delta : 수정 할선법에서 미분값 계산에 사용할 변동률
    %   es : 상대오차 종료조건
    %   maxit : 최대 반복 횟수
    %   incSearchRange : 해가 존재하는 구간을 찾기 위한 후보 x값들 (0:25:200로 주어짐)
    %   varargin : 함수 값 계산을 위한 추가 파라메터(t,g,cd)
    % output:
    %   root : 해
    %   ea : 마지막 iteration에서의 상대 오차
    %   iter : iteration 횟수
    
    %-----------------------------------------------------
    %   할선법의 사용을 위해 적절한 초기 추정치로 할선법 코드를 호출하여
    %   root, ea, es를 반환하는 코드를 작성하시오.
    %
    %   적절한 초기 추정치는, incSearchRange로 입력된 1 x 9 행렬의 인접한 두 값을
    %   각각 xl, xu로 사용하여 f(xl)과 f(xu)를 구한 뒤, 두 값의 부호가 다른 경우
    %   xu값을 초기 추정치로 사용한다.
    %   (HINT : 주어진 테스트 코드에서, 적절한 초기 추정치는 150이다.)
    %-----------------------------------------------------
   
    for k = incSearchRange % 초기추정치를 구합니다.
        xl = k;
        xu = k+25 ;
        if sign(func(k, varargin{:})) ~= sign(func(xu, varargin{:})); % 부호가 다른 두 경우를 찾습니다.
        xr =xu ;% 초기 추정치 값을 저장합니다.
        end
    end
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


