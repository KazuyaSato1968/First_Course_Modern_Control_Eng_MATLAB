%��10.6

%�V�X�e���p�����[�^��^����
A = [1 4;-3 1]; %A�s��
b = [2;-1]; %�x�N�g��b
c = [-3 1]; %�x�N�g��c

AT = A'; %A�s��̓]�u�s��
bT = b'; %�x�N�g��b�̓]�u
cT = c'; %�x�N�g��c�̓]�u

disp('A, b�̉��䐫�s��');
Uc1 = ctrb(A, b) %A, b�̉��䐫�s��
disp('A, c�̉ϑ����s��');
Uo1 = obsv(A, c) %A, c�̉ϑ����s��

disp('AT, cT�̉��䐫�s��');
Uc2 = ctrb(AT, cT) %AT, cT�̉��䐫�s��
disp('AT, bT�̉ϑ����s��');
Uo2 = obsv(AT, bT) %AT, bT�̉ϑ����s��

disp('Uo2�̓]�u�s��');
Uo2T = Uo2' %Uo2�̓]�u�s��
Uc1

disp('Uc2�̓]�u�s��');
Uc2T = Uc2' %Uc2�̓]�u�s��
Uo1