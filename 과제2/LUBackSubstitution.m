function x = LUBackSubstitution(L,U,P,b)
    % input:
    %   L,U,P : LUDecompPivot에 의해 A가 분해된 결과 행렬들
    %   b : Ax = b 문제를 풀기 위한 b 벡터
    % output:
    %   x : AX = b 문제의 해인 x 벡터
    
    %-----------------------------------------------------
    %   LU 분해를 통해 얻은 L,U,P 행렬을 통해,
    %   선형 시스템의 해를 구하는 코드를 작성하시오.
    %
    %   P*A = L*U 이므로, P*A*x = L*U*x = P*b를 만족하는 해를 찾아야 한다.
    %   따라서, L*d = P*b를 만족하는 d를 구하는 1번 과정과
    %   U*x = d를 만족하는 x를 구하는 2번 과정으로 나누어 해를 구한다.
    %   *(중요!!!!)매트랩 내장 lu함수 및 백슬래시 연산은 사용할 수 없습니다.
    %-----------------------------------------------------
   
    n = length(L); 
    IL = zeros(n,n) ;
    nb = n+1 ;
    
    for k=1:n
        en=zeros(n,1) ;
        en(k) =1;
        Aug = [L en] ;
        a = zeros(n,1);
        a(1) = Aug(1,nb)/Aug(1,1) ;
        
        for i =2:1:n
            a(i) =(Aug(i,nb)-Aug(i,1:i-1)*a(1:i-1))/Aug(i,i);
        end
        IL(:,k) =a ;
    end
    
    d = IL*P*b ;
    n = length(L);
    IU = zeros(n,n) ;
    nb = n+1 ;
    
    for k=1:n
        en=zeros(n,1);
        en(k)=1;
        Aug=[U en];
        c = zeros(n,1) ;
        c(n) = Aug(n,nb)/Aug(n,n);
        
        for i =n-1:-1:1
            c(i) = (Aug(i,nb)-Aug(i,i+1:n)*c(i+1:n))/Aug(i,i);
        end
        IU(:,k) = c ;
    end
    x = IU*d ;
end