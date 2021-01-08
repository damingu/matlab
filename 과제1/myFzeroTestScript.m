% 수정 할선법(myModSecant.m)과 증분 탐색법(myFzero.m)을 구현하여 아래 코드가
% 올바로 동작하도록 하시오.
% 올바로 구현된 경우 아래와 같은 출력 결과를 볼 수 있습니다.
% >>myFzeroTestScript
% 할선법 Root : 142.737633, Ea : 0.000004, in iteration 6
% 증분탐색 후 할선법 Root : 142.737633, Ea : 0.000000, in iteration 4

func = @(m,t,g,cd) sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t) - 36;
[root,ea,iter] = myModSecant(func,10e-06,50,10e-5,100,4,9.81,0.25);
fprintf('할선법 Root : %f, Ea : %f, in iteration %d\n', root, ea, iter);

incSearchRange = 0:25:200;
[root,ea,iter] = myFzero(func,10e-06,10e-5,100,incSearchRange,4,9.81,0.25);
fprintf('증분탐색 후 할선법 Root : %f, Ea : %f, in iteration %d\n', root, ea, iter);