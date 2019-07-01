%例10.6

%システムパラメータを与える
A = [1 4;-3 1]; %A行列
b = [2;-1]; %ベクトルb
c = [-3 1]; %ベクトルc

AT = A'; %A行列の転置行列
bT = b'; %ベクトルbの転置
cT = c'; %ベクトルcの転置

disp('A, bの可制御性行列');
Uc1 = ctrb(A, b) %A, bの可制御性行列
disp('A, cの可観測性行列');
Uo1 = obsv(A, c) %A, cの可観測性行列

disp('AT, cTの可制御性行列');
Uc2 = ctrb(AT, cT) %AT, cTの可制御性行列
disp('AT, bTの可観測性行列');
Uo2 = obsv(AT, bT) %AT, bTの可観測性行列

disp('Uo2の転置行列');
Uo2T = Uo2' %Uo2の転置行列
Uc1

disp('Uc2の転置行列');
Uc2T = Uc2' %Uc2の転置行列
Uo1