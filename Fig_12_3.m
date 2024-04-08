%�}12.3

clear all; close all;

%
%�V�X�e���p�����[�^��^����
A = [0 1;-6 -5]; %�s��A
b = [0;1]; %�x�N�g��b
c = [1 0]; %�x�N�g��c
d = 0; %�X�J���[d

%�z�u����I�u�U�[�o�̋ɂ�^����
op = [-5;-6]; %-5, -6���I�u�U�[�o�̋ɂƂ���

%�I�u�U�[�o�Q�C�������߂�D�o�΃V�X�e��A^T��c^T�̏�ԃt�B�[�h�o�b�N�Q�C�������߁C�]�u�����ƃI�u�U�[�o�Q�C���ƂȂ�
h = acker(A',c',op)' %�o�΃V�X�e���ŋɔz�u���C�]�u�����߂�

%Ah = A-hc�ƃI�u�U�[�o�̋ɂ̌v�Z�ƕ\��
Ah = A - h*c; %Ah = A - h*c�̌v�Z
disp('A-hc�̌ŗL�l');
eig(A - h * c) %�I�u�U�[�o�̋ɂ��v�Z���\��

%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp = [-5; -6];

%�t�B�[�h�o�b�N�Q�C�������߂�
disp('���߂�t�B�[�h�o�b�N�Q�C��');
f =  acker(A,b,fbp)
Af = A - b * f
disp('���[�v��')
eig(A - b * f)

%�V�X�e���ƃI�u�U�[�o�i�덷�V�X�e���i11.15)���j�̏�ԋ�ԕ\�������߂�
cp = eye(2); %�I�u�U�[�o�̏�ԕϐ����v���b�g���邽�߂�C��P�ʍs��ɂ���
dp = [0;0]; %c�ɍ��킹��D�͗�x�N�g���Ƃ���

sys_s_fbk = ss(Af, b, cp, dp); %�V�X�e���̏�ԋ�ԕ\��

E = [Af -b*f;zeros(2) Ah]; %�g��V�X�e��(12.13)��A�s��
bE = [0;0;0;1]; %�����V�X�e��(12.13)�̃x�N�g��b
cE = eye(4); %�����V�X�e��(12.13)�̃x�N�g��c
dE = [0;0;0;0]; %�����V�X�e��(12.13)�̃x�N�g��d

e_sys = ss(E, bE, cE, dE); %�����V�X�e���̏�ԋ�ԕ\��

%���ԕϐ��̒�`
t = 0:0.01:5; %0����10�܂�0.01����

%�V�X�e���ƃI�u�U�[�o�̏����l��^����
x0 = [1;1]; %�V�X�e���̏����l
x0_ob = [0;0]; %�I�u�U�[�o�̏����l

%�����l�����̌v�Z
y = initial(sys_s_fbk,x0,t); %��ԃt�B�[�h�o�b�N�n�̏����l����

ye = initial(e_sys,[x0;x0_ob-x0],t); %�����V�X�e���̏����l����
%
h_x_1 = ye(:,3) + ye(:,1); %�����V�X�e���̏����l����
h_x_2 = ye(:,4) + ye(:,2); %�����V�X�e���̏����l����

%�}12.3(a)�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y(:,1),t,y(:,2),t,ye(:,1),t,ye(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-2.0 1.5]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)','x_sf1(t)','x_sf2(t)'); %�}��̕\��

%�}12.3(b)�̃v���b�g
figure(2) %�}�̃E�B���h�E���J��
plot(t,y(:,1),t,y(:,2),t,h_x_1,t,h_x_2); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-2.0 3]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)','hat{x}_1(t)','hat{x}_2(t)'); %�}��̕\��