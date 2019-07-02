%�}14.2, 14.3, 14.4, 14.5

clear all; close all;

%�V�X�e���p�����[�^��^����
A = [0 1;-6 -5]; %�s��A
b = [0;1]; %�x�N�g��b
c = [1 0]; %�x�N�g��c
d = 0; %�X�J���[d

%�}14.2(a)
%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp1 = [-3; -3];

%�t�B�[�h�o�b�N�Q�C�������߂�
disp('���߂�t�B�[�h�o�b�N�Q�C��');
f1 =  acker(A,b,fbp1)
Af1 = A - b * f1
disp('���[�v��')
eig(A - b * f1)

%�V�X�e���̏�ԋ�ԕ\�������߂�
cp = eye(2); %�I�u�U�[�o�̏�ԕϐ����v���b�g���邽�߂�C��P�ʍs��ɂ���
dp = [0;0]; %c�ɍ��킹��D�͗�x�N�g���Ƃ���

sys_s_fbk1 = ss(Af1, b, cp, dp); %�V�X�e���̏�ԋ�ԕ\��

%���ԕϐ��̒�`
t = 0:0.01:5; %0����5�܂�0.01����

%�V�X�e���̏����l��^����
x0 = [-1;0]; %�V�X�e���̏����l

%�����l�����̌v�Z
y1 = initial(sys_s_fbk1,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}14.2(a)�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y1(:,1),t,y1(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 4]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}14.2(b)
%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp2 = [-5; -5];

%�t�B�[�h�o�b�N�Q�C�������߂�
disp('���߂�t�B�[�h�o�b�N�Q�C��');
f2 =  acker(A,b,fbp2)
Af2 = A - b * f2
disp('���[�v��')
eig(A - b * f2)

sys_s_fbk2 = ss(Af2, b, cp, dp); %�V�X�e���̏�ԋ�ԕ\��

%�����l�����̌v�Z
y2 = initial(sys_s_fbk2,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}14.2(b)�̃v���b�g
figure(2) %�}�̃E�B���h�E���J��
plot(t,y2(:,1),t,y2(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 4]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}14.3

u1 = - f1(1) * y1(:,1) - f1(2) * y1(:,2); %Case #-3�̏ꍇ�̓��͂̌v�Z
u2 = - f2(1) * y2(:,1) - f2(2) * y2(:,2); %Case #-5�̏ꍇ�̓��͂̌v�Z

%�}14.3�̃v���b�g
figure(3) %�}�̃E�B���h�E���J��
plot(t,u1,t,u2); %���͂��v���b�g
xlim([0 4]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-5 20]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('u(t)'); %�c���̃��x���\��
legend('Case #-3', 'Case #-5'); %�}��̕\��

%�}14.5

y112 = power(y1(:,1),2); %Case #-3�̏ꍇ��x_1��2��̌v�Z
y122 = power(y1(:,2),2); %Case #-3�̏ꍇ��x_2��2��̌v�Z
y212 = power(y2(:,1),2); %Case #-5�̏ꍇ��x_1��2��̌v�Z
y222 = power(y2(:,2),2); %Case #-5�̏ꍇ��x_2��2��̌v�Z
u12 = power(u1,2); %Case #-3�̏ꍇ�̓��͂�2��̌v�Z
u22 = power(u2,2); %Case #-5�̏ꍇ�̓��͂�2��̌v�Z

%�}14.5(a)�̃v���b�g
figure(4) %�}�̃E�B���h�E���J��
plot(t,y112,t,y212); %�v���b�g
xlim([0 2.5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-0.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('x_1^2(t)'); %�c���̃��x���\��
legend('Case #-3', 'Case #-5'); %�}��̕\��

%�}14.5(b)�̃v���b�g
figure(5) %�}�̃E�B���h�E���J��
plot(t,y122,t,y222); %�v���b�g
xlim([0 2.5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([0 4]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('x_2^2(t)'); %�c���̃��x���\��
legend('Case #-3', 'Case #-5'); %�}��̕\��

%�}14.5(b)�̃v���b�g
figure(5) %�}�̃E�B���h�E���J��
plot(t,u12,t,u22); %�v���b�g
xlim([0 2.5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([0 200]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('u^2(t)'); %�c���̃��x���\��
legend('Case #-3', 'Case #-5'); %�}��̕\��