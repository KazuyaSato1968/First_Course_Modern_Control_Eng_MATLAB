%chapter11のオブザーバの例

clear
format compact
clf
%
%システムの記述
A = [0 1;-6 -5];
B = [0;1];
C = [1 0];
D = 0;
x0 = [1;1];

%システム，オブザーバ用のCとDの定義
C_pl = eye(2);
D_pl = [0;0];
C_ob = eye(2);
D_ob = [0;0];

%--
disp('システムの極')
eig(A)

%状態フィードバックによる閉ループの極
fbp = [-5; -6];

%---
disp('求めるフィードバックゲイン');
F =  acker(A,B,fbp)
disp('閉ループ極')
eig(A - B * F)

%オブザーバの初期値
x0_ob = [0;0];

%オブザーバの極
p(1) = -1;
p(2) = -2;

L = acker(A',C',p)'

disp('A-hcの固有値');
eig(A - L * C)

%Simulinkで実行
tstart = 0.0;
tfinal = 5.0;
SimuTime = [tstart,tfinal];
sim('obs_sf_sim');%併合系のシミュレーションmdl file

%結果をプロット
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

