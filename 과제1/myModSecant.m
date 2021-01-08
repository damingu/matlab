function [root,ea,iter] = myModSecant(func, delta, xr, es, maxit, varargin)
    % input:
    %   func : ���� ã�� �Լ� �ڵ�
    %   delta : ���� �Ҽ������� �̺а� ��꿡 ����� ������
    %   xr : �ʱ� ����ġ
    %   maxit : �ִ� �ݺ� Ƚ��
    %   es : ������ �������� 
    %   varargin : �Լ� �� ����� ���� �߰� �Ķ����(t,g,cd)
    % output:
    %   root : ��
    %   ea : ������ iteration������ ��� ����
    %   iter : iteration Ƚ��
    
    %-----------------------------------------------------
    %
    %   ���� 177������ newton-raphson�� �ڵ带 �����Ͽ� �Ҽ��� �ڵ带 �����Ͻÿ�.    
    %
    %----------------------------------------------------- 

    iter = 0 ; %�ݺ�Ƚ���� �ʱ�ȭ�մϴ�. 
    while(1)
        xrold = xr ; %xi ���� �����մϴ�. 
        xr = xr - (delta*xr*func(xr,varargin{:}))/(func(xr+xr*delta,varargin{:})-func(xr, varargin{:})); %�����Ҽ������� ���� ����ġ(xi+1)�� ���մϴ�.
        iter = iter + 1 ; %�ݺ�Ƚ���� +1ī��Ʈ �մϴ�. 
        if xr ~= 0, ea =abs((xr-xrold)/xr)*100 ; end %Ea�� ���մϴ�. 
        if ea <= es || iter >=maxit, break, end % ���� ������ ã�ų� �ݺ�Ƚ���� �ʰ����� �� �ݺ����� Ż���մϴ�.
    end 
    root = xr ; % �ظ� ���߽��ϴ�. 
end