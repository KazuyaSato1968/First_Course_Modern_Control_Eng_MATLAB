%�}14.6

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

%�V�X�e���̏�ԋ�ԕ\�������߂�
cp = eye(2); %�I�u�U�[�o�̏�ԕϐ����v���b�g���邽�߂�C��P�ʍs��ɂ���
dp = [0;0]; %c�ɍ��킹��D�͗�x�N�g���Ƃ���

sys_s_fbk = ss(Af, b, cp, dp); %�V�X�e���̏�ԋ�ԕ\��

%���ԕϐ��̒�`
t = 0:0.01:5; %0����5�܂�0.01����

%�V�X�e���̏����l��^����
x0 = [-1;0]; %�V�X�e���̏����l

%�����l�����̌v�Z
y_sf = initial(sys_s_fbk,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}14.6(a)�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y_sf(:,1),t,y_sf(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1 2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%%%%%%%%%%%%%
% LQ ����
%%%%%%%%%%%%%

Q1=[13 0; 0 1];
R1=1;
[f_lqr_1, P1, e1] = lqr(A,b,Q1,R1);
disp('�œK���M�����[�^�ɂ��t�B�[�h�o�b�N�Q�C��')
f_lqr_1

A_lqr1 = A - b * f_lqr_1; %�œK���M�����[�^�ɂ��Af=A-bf�̌v�Z
sys_s_lqr1 = ss(A_lqr1, b, cp, dp); %�œK���M�����[�^�ɂ��V�X�e���̏�ԋ�ԕ\��
%�����l�����̌v�Z
y_lqr1 = initial(sys_s_lqr1,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}14.6(b)�̃v���b�g
figure(2) %�}�̃E�B���h�E���J��
plot(t,y_lqr1(:,1),t,y_lqr1(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1 2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

%�}14.6(c)

u_sf = - f(1) * y_sf(:,1) - f(2) * y_sf(:,2); %�ɔz�u�̏ꍇ�̓��͂̌v�Z
u_lqr1 = - f_lqr_1(1) * y_lqr1(:,1) - f_lqr_1(2) * y_lqr1(:,2); %�œK����̏ꍇ�̓��͂̌v�Z�ir=�̏ꍇ�j

%�}14.6(c)�̃v���b�g
figure(3) %�}�̃E�B���h�E���J��1
plot(t,u_sf,t,u_lqr1); %�v���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([0 3]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('u(t)'); %�c���̃��x���\��
legend('�ɔz�u�@', '�œK���䑥'); %�}��̕\��

%%%%%%%%%%%%%%%%%%%%%%
Q2=[1 0; 0 1];
R2=3;
[f_lqr_2, P2, e2] = lqr(A,b,Q2,R2);
disp('�œK���M�����[�^�ɂ��t�B�[�h�o�b�N�Q�C��')
f_lqr_2

A_lqr2 = A - b * f_lqr_2; %�œK���M�����[�^�ɂ��Af=A-bf�̌v�Z
sys_s_lqr2 = ss(A_lqr2, b, cp, dp); %�œK���M�����[�^�ɂ��V�X�e���̏�ԋ�ԕ\��
%�����l�����̌v�Z
y_lqr2 = initial(sys_s_lqr2,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}14.6(d)

u_lqr2 = - f_lqr_2(1) * y_lqr2(:,1) - f_lqr_2(2) * y_lqr2(:,2); %�œK����̏ꍇ�̓��͂̌v�Z�ir=3�̏ꍇ�j

%�}14.6(d)�̃v���b�g
figure(4) %�}�̃E�B���h�E���J��
plot(t,u_lqr1,t,u_lqr2); %�v���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-0.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('u(t)'); %�c���̃��x���\��
legend('r=1', 'r=3'); %�}��̕\��

