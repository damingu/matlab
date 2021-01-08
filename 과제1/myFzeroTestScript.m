% ���� �Ҽ���(myModSecant.m)�� ���� Ž����(myFzero.m)�� �����Ͽ� �Ʒ� �ڵ尡
% �ùٷ� �����ϵ��� �Ͻÿ�.
% �ùٷ� ������ ��� �Ʒ��� ���� ��� ����� �� �� �ֽ��ϴ�.
% >>myFzeroTestScript
% �Ҽ��� Root : 142.737633, Ea : 0.000004, in iteration 6
% ����Ž�� �� �Ҽ��� Root : 142.737633, Ea : 0.000000, in iteration 4

func = @(m,t,g,cd) sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t) - 36;
[root,ea,iter] = myModSecant(func,10e-06,50,10e-5,100,4,9.81,0.25);
fprintf('�Ҽ��� Root : %f, Ea : %f, in iteration %d\n', root, ea, iter);

incSearchRange = 0:25:200;
[root,ea,iter] = myFzero(func,10e-06,10e-5,100,incSearchRange,4,9.81,0.25);
fprintf('����Ž�� �� �Ҽ��� Root : %f, Ea : %f, in iteration %d\n', root, ea, iter);