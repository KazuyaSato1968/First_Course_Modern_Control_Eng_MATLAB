%á10.6

%VXep[^ð^¦é
A = [1 4;-3 1]; %Asñ
b = [2;-1]; %xNgb
c = [-3 1]; %xNgc

AT = A'; %AsñÌ]usñ
bT = b'; %xNgbÌ]u
cT = c'; %xNgcÌ]u

disp('A, bÌÂ§ä«sñ');
Uc1 = ctrb(A, b) %A, bÌÂ§ä«sñ
disp('A, cÌÂÏª«sñ');
Uo1 = obsv(A, c) %A, cÌÂÏª«sñ

disp('AT, cTÌÂ§ä«sñ');
Uc2 = ctrb(AT, cT) %AT, cTÌÂ§ä«sñ
disp('AT, bTÌÂÏª«sñ');
Uo2 = obsv(AT, bT) %AT, bTÌÂÏª«sñ

disp('Uo2Ì]usñ');
Uo2T = Uo2' %Uo2Ì]usñ
Uc1

disp('Uc2Ì]usñ');
Uc2T = Uc2' %Uc2Ì]usñ
Uo1