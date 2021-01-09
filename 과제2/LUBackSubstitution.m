function x = LUBackSubstitution(L,U,P,b)
    % input:
    %   L,U,P : LUDecompPivot�� ���� A�� ���ص� ��� ��ĵ�
    %   b : Ax = b ������ Ǯ�� ���� b ����
    % output:
    %   x : AX = b ������ ���� x ����
    
    %-----------------------------------------------------
    %   LU ���ظ� ���� ���� L,U,P ����� ����,
    %   ���� �ý����� �ظ� ���ϴ� �ڵ带 �ۼ��Ͻÿ�.
    %
    %   P*A = L*U �̹Ƿ�, P*A*x = L*U*x = P*b�� �����ϴ� �ظ� ã�ƾ� �Ѵ�.
    %   ����, L*d = P*b�� �����ϴ� d�� ���ϴ� 1�� ������
    %   U*x = d�� �����ϴ� x�� ���ϴ� 2�� �������� ������ �ظ� ���Ѵ�.
    %   *(�߿�!!!!)��Ʈ�� ���� lu�Լ� �� �齽���� ������ ����� �� �����ϴ�.
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