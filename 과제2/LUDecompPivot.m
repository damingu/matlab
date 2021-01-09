function [L,U,P] = LUDecompPivot(A)
    % input:
    %   A : 분해의 대상이 되는 행렬
    % output:
    %   L : 분해 결과 Lower Triangular Matrix
    %   U : 분해 결과 Upper Triangular Matrix
    %   P : Pivoting에 의한 열의 치환 정보를 저장한 Matrix
    
    %-----------------------------------------------------
    %   A 행렬을 입력으로 피봇팅을 통해 LU 분해를 하고, 
    %   피봇팅 과정에서 치환된 열의 정보를 P행렬에 저장하여 
    %   출력하는 코드를 작성하시오.
    %   결과적으로 P*A = L*U 여야 합니다.
    %
    %   교재 282페이지 및 8.1.2절의 P 행렬에 대한 설명을 참고하여 코드를 작성하시오.
    %   *문제 조건과 같은 결과를 출력하려면, 열의 치환이 발생할 때 명령창에 정보를 출력해야 합니다.
    %   *가우스 소거법 코드를 참고하여 시작하면 좋습니다.
    %   *(중요!!!!)매트랩 내장 lu함수 및 백슬래시 연산은 사용할 수 없습니다.
    %-----------------------------------------------------
    
    [m,n] = size(A); %정사각 행렬이여야 한다.
    if m~=n, error('Matrix A must be square'); end
    
    P = eye(n) ; %   P : 치환행렬 정의
    L = eye(n); 
    U = A;

    for k = 1:n-1
        [~,i] = max(abs(U(k:n,k)));
        ipr = i+k-1;
        if ipr ~= k
            U([k,ipr],:) = U([ipr,k],:);
            P([k ipr],:) = P([ipr k],:);
           if k >= 2
               L([k, ipr],1:k-1) = L([ipr, k],1:k-1) ;
           end
        end
        for i = k+1:n
            L(i,k)= U(i,k)/U(k,k);
            U(i,k) = 0;
            U(i,k+1:n) = U(i,k+1:n)-L(i,k)*U(k,k+1:n);
            
        end
    end 
end

