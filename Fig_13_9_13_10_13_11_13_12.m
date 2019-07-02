%�}13.9, 13.10, 13.11, 13.12

clear all; close all;

%�V�X�e���p�����[�^��^����
A = [0 1;-6 -5]; %�s��A
b = [0;1]; %�x�N�g��b
c = [1 0]; %�x�N�g��c
d = 0; %�X�J���[d

%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp = [-3; -3];

%�t�B�[�h�o�b�N�Q�C�������߂�
disp('���߂�t�B�[�h�o�b�N�Q�C��');
f =  acker(A,b,fbp)
Af = A - b * f
disp('���[�v��')
eig(A - b * f)

%���ԕϐ��̒�`
t = 0:0.01:10; %0����10�܂�0.01����

%�T�[�{�V�X�e���̏����l��^����
x0 = [-1;0;0]; %�V�X�e���̏����l

%�}13.9
g1 = 0;

%�T�[�{�V�X�e��
E1 = [Af b*g1;-c 0];
bE = [-b;0];
cE = eye(3);
dE = [0;0;0];

sys_servo1 = ss(E1, bE, cE, dE); %�V�X�e���̏�ԋ�ԕ\��

u_step = ones([1,length(t)]); %�P�ʃX�e�b�v�M���ŕ\��������

%�X�e�b�v�����̌v�Z
y1 = lsim(sys_servo1,u_step,t,x0); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.9�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y1(:,1),t,y1(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 10]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}13.10
g2 = 1;

%�T�[�{�V�X�e��
E2 = [Af b*g2;-c 0];

sys_servo2 = ss(E2, bE, cE, dE); %�V�X�e���̏�ԋ�ԕ\��

%�X�e�b�v�����̌v�Z
y2 = lsim(sys_servo2,u_step,t,x0); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.10�̃v���b�g
figure(2) %�}�̃E�B���h�E���J��
plot(t,y2(:,1),t,y2(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 10]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}13.11
g3 = 5;

%�T�[�{�V�X�e��
E3 = [Af b*g3;-c 0];

sys_servo3 = ss(E3, bE, cE, dE); %�V�X�e���̏�ԋ�ԕ\��

%�X�e�b�v�����̌v�Z
y3 = lsim(sys_servo3,u_step,t,x0); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.10�̃v���b�g
figure(3) %�}�̃E�B���h�E���J��
plot(t,y3(:,1),t,y3(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 10]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}13.12
g4 = 1.3;

%�T�[�{�V�X�e��
E4 = [Af b*g4;-c 0];

sys_servo4 = ss(E4, bE, cE, dE); %�V�X�e���̏�ԋ�ԕ\��

%�X�e�b�v�����̌v�Z
y4 = lsim(sys_servo4,u_step,t,x0); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.11�̃v���b�g
figure(4) %�}�̃E�B���h�E���J��
plot(t,y4(:,1),t,y4(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 10]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��