%�}13.5, 13.6

clear all; close all;
set(0, 'DefaultAxesLineWidth', 1);
set(0, 'DefaultLineLineWidth', 2);
set(0, 'defaultAxesFontSize', 12);

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
y = initial(sys_s_fbk,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.5�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y(:,1),t,y(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

dd = ones([1,length(t)]); %�P�ʃX�e�b�v�M���ŕ\�����O��

%�����l�����̌v�Z
yd = lsim(sys_s_fbk,-dd,t,x0); %��ԃt�B�[�h�o�b�N�n�̏����l����

%�}13.6�̃v���b�g
figure(2) %�}�̃E�B���h�E���J��
plot(t,yd(:,1),t,yd(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1.2 1.2]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��