% �Ǻ����� �����ϴ� LU ���� �ڵ�(LUDecompPivot.m)�� ���� ����(LUBackSubstitution.m)�� �����Ͽ� �Ʒ� �ڵ尡
% �ùٷ� �����ϵ��� �����Ͻÿ�.
% 
% �ùٷ� ������ ��� �Ʒ��� ���� ��� ����� �� �� �ֽ��ϴ�.

% >>LUDecompTestScript
% Iteration 1 : 3 and 1 row has changed
% Iteration 2 : 3 and 2 row has changed
% x1=4.000000, x2=8.000000, x3=-2.000000 
% Iteration 1 : 3 and 1 row has changed
% Iteration 2 : 4 and 2 row has changed
% Iteration 3 : 4 and 3 row has changed
% x1=1.000000, x2=2.000000, x3=3.000000 x4=4.000000
% x1=4.000000, x2=3.000000, x3=2.000000 x4=1.000000

%-----------------------------------------------------------------------
% 3x3 Case
A = [ 2, -6, -1;
     -3, -1,  7;
     -8,  1, -2];
b = [-38;
     -34;
     -20];
 
[L,U,P] = LUDecompPivot(A);
x = LUBackSubstitution(L,U,P,b);
fprintf('x1=%f, x2=%f, x3=%f \n', x(1),x(2),x(3));

% 4x4 Case
A = [2,1,1,0;
     4,3,3,1;
     8,7,9,5;
     6,7,9,8];
b1 = [7;
    23;
    69;
    79];
b2 = [13;
    32;
    76;
    71];

[L,U,P] = LUDecompPivot(A);
x1 = LUBackSubstitution(L,U,P,b1);
fprintf('x1=%f, x2=%f, x3=%f x4=%f\n', x1(1),x1(2),x1(3),x1(4));
x2 = LUBackSubstitution(L,U,P,b2);
fprintf('x1=%f, x2=%f, x3=%f x4=%f\n', x2(1),x2(2),x2(3),x2(4));