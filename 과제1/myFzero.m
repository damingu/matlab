function [root,ea,iter] = myFzero(func, delta, es, maxit, incSearchRange,varargin)
    % input:
    %   func : ���� ã�� �Լ� �ڵ�
    %   delta : ���� �Ҽ������� �̺а� ��꿡 ����� ������
    %   es : ������ ��������
    %   maxit : �ִ� �ݺ� Ƚ��
    %   incSearchRange : �ذ� �����ϴ� ������ ã�� ���� �ĺ� x���� (0:25:200�� �־���)
    %   varargin : �Լ� �� ����� ���� �߰� �Ķ����(t,g,cd)
    % output:
    %   root : ��
    %   ea : ������ iteration������ ��� ����
    %   iter : iteration Ƚ��
    
    %-----------------------------------------------------
    %   �Ҽ����� ����� ���� ������ �ʱ� ����ġ�� �Ҽ��� �ڵ带 ȣ���Ͽ�
    %   root, ea, es�� ��ȯ�ϴ� �ڵ带 �ۼ��Ͻÿ�.
    %
    %   ������ �ʱ� ����ġ��, incSearchRange�� �Էµ� 1 x 9 ����� ������ �� ����
    %   ���� xl, xu�� ����Ͽ� f(xl)�� f(xu)�� ���� ��, �� ���� ��ȣ�� �ٸ� ���
    %   xu���� �ʱ� ����ġ�� ����Ѵ�.
    %   (HINT : �־��� �׽�Ʈ �ڵ忡��, ������ �ʱ� ����ġ�� 150�̴�.)
    %-----------------------------------------------------
   
    for k = incSearchRange % �ʱ�����ġ�� ���մϴ�.
        xl = k;
        xu = k+25 ;
        if sign(func(k, varargin{:})) ~= sign(func(xu, varargin{:})); % ��ȣ�� �ٸ� �� ��츦 ã���ϴ�.
        xr =xu ;% �ʱ� ����ġ ���� �����մϴ�.
        end
    end
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


