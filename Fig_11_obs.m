%chapter11�̃I�u�U�[�o�̗�

clear
format compact
clf
%
%�V�X�e���̋L�q
A = [0 1;-6 -5];
B = [0;1];
C = [1 0];
D = 0;
x0 = [1;1];

%�V�X�e���C�I�u�U�[�o�p��C��D�̒�`
C_pl = eye(2);
D_pl = [0;0];
C_ob = eye(2);
D_ob = [0;0];

%--
disp('�V�X�e���̋�')
eig(A)

%��ԃt�B�[�h�o�b�N�ɂ����[�v�̋�
fbp = [-5; -6];

%---
disp('���߂�t�B�[�h�o�b�N�Q�C��');
F =  acker(A,B,fbp)
disp('���[�v��')
eig(A - B * F)

%�I�u�U�[�o�̏����l
x0_ob = [0;0];

%�I�u�U�[�o�̋�
p(1) = -1;
p(2) = -2;

L = acker(A',C',p)'

disp('A-hc�̌ŗL�l');
eig(A - L * C)

%Simulink�Ŏ��s
tstart = 0.0;
tfinal = 5.0;
SimuTime = [tstart,tfinal];
sim('obs_sf_sim');%�����n�̃V�~�����[�V����mdl file

%���ʂ��v���b�g
figure(1)
x1 = plot(t,x_xob(:,1));
hold on
x2 = plot(t,x_xob(:,2));
hold on
%x_ob_1 = plot(t,x_xob(:,3));
hold on
%x_ob_2 = plot(t,x_xob(:,4));
hold on
x_wo_1 = plot(t,x_xob(:,5));
hold on
x_wo_2 = plot(t,x_xob(:,6));
grid;

axis([0 5 -2 1.5])

lineobj = findobj('type', 'line');
set(x1, 'linewidth', 2.0, 'color', 'k','linestyle','-');
set(x2,'linewidth', 2.0, 'color', 'k','linestyle', '--');
%set(x_ob_1, 'linewidth', 2.0, 'color', 'k','linestyle',':');
%set(x_ob_2,'linewidth', 2.0, 'color', 'k','linestyle', '-.');
set(x_wo_1, 'linewidth', 2.0, 'color', 'k','linestyle',':');
set(x_wo_2,'linewidth', 2.0, 'color', 'k','linestyle', '-.');
%
set(gca,'FontSize',[18]);
set(gca,'FontWeight','Bold');
set(gca,'Box','on');
xlabel('{\bf time   t[s]}');
%ylabel('x_1, x_2,\hat{x}_1,\hat{x}_2')
%legend('x_1','x_2','\hat{x}_1','\hat{x}_2');

ylabel('x_1, x_2,x_{sf1},x_{sf2}')
legend('x_1','x_2','x_{sf1}','x_{sf2}');

