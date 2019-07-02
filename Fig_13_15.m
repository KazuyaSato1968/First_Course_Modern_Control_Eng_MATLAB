%�}13.15

clear all; close all;

%�V�X�e���p�����[�^��^����
A = [0 1;-6 -5]; %�s��A
b = [0;1]; %�x�N�g��b
c = [1 0]; %�x�N�g��c
d = 0; %�X�J���[d

%(13.46)���̊g��V�X�e�������߂�
AE = [A [0;0];-c 0];
bE = [0;1;0]

%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp = [-3; -3; -3];

%�t�B�[�h�o�b�N�Q�C�������߂�
disp('���߂�t�B�[�h�o�b�N�Q�C��');
f =  acker(AE,bE,fbp)
ff = [f(1,1) f(1,2)]
Af = A - b * ff
disp('���[�v��')
eig(Af)

%���ԕϐ��̒�`
t = 0:0.01:5; %0����5�܂�0.01����

%�T�[�{�V�X�e���̏����l��^����
x0 = [-1;0;0]; %�V�X�e���̏����l

%�T�[�{�V�X�e��
g = f(1,3) %g�𔲂��o��

%(13.36)���̕��[�v�V�X�e�������߂�
E = [Af b*(-g);-c 0]; 
bE = [-b;1];
cE = eye(3);
dE = [0;0;0];

sys_servo = ss(E, bE, cE, dE); %���[�v�V�X�e���̏�ԋ�ԕ\��

u_step = ones([1,length(t)]); %�P�ʃX�e�b�v�M���ŕ\��������

%���[�v�V�X�e���̃X�e�b�v�����̌v�Z
y = lsim(sys_servo,u_step,t,x0); %���[�v�V�X�e���̃X�e�b�v�����̌v�Z

%�}13.15�̃v���b�g
figure(1) %�}�̃E�B���h�E���J��
plot(t,y(:,1),t,y(:,2)); %�e��Ԃ𒊏o���ăv���b�g
xlim([0 5]); %�����i���Ԏ��j�͈̔͂̎w��
ylim([-1 3]); %�c���͈̔͂̐ݒ�
grid; %�r����\��
xlabel('time t[s]'); %�����̃��x���\��
ylabel('state'); %�c���̃��x���\��
legend('x_1(t)','x_2(t)'); %�}��̕\��

