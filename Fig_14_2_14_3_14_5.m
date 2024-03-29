%図14.2, 14.3, 14.4, 14.5

clear all; close all;

%システムパラメータを与える
A = [0 1;-6 -5]; %行列A
b = [0;1]; %ベクトルb
c = [1 0]; %ベクトルc
d = 0; %スカラーd

%図14.2(a)
%状態フィードバックによる閉ループの極
fbp1 = [-3; -3];

%フィードバックゲインを求める
disp('求めるフィードバックゲイン');
f1 =  acker(A,b,fbp1)
Af1 = A - b * f1
disp('閉ループ極')
eig(A - b * f1)

%システムの状態空間表現を求める
cp = eye(2); %オブザーバの状態変数をプロットするためにCを単位行列にする
dp = [0;0]; %cに合わせてDは零ベクトルとする

sys_s_fbk1 = ss(Af1, b, cp, dp); %システムの状態空間表現

%時間変数の定義
t = 0:0.01:5; %0から5まで0.01刻み

%システムの初期値を与える
x0 = [-1;0]; %システムの初期値

%初期値応答の計算
y1 = initial(sys_s_fbk1,x0,t); %状態フィードバック系の初期値応答

%図14.2(a)のプロット
figure(1) %図のウィンドウを開く
plot(t,y1(:,1),t,y1(:,2)); %各状態を抽出してプロット
xlim([0 4]); %横軸（時間軸）の範囲の指定
ylim([-1.2 2]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('state'); %縦軸のラベル表示
legend('x_1(t)','x_2(t)'); %凡例の表示

%図14.2(b)
%状態フィードバックによる閉ループの極
fbp2 = [-5; -5];

%フィードバックゲインを求める
disp('求めるフィードバックゲイン');
f2 =  acker(A,b,fbp2)
Af2 = A - b * f2
disp('閉ループ極')
eig(A - b * f2)

sys_s_fbk2 = ss(Af2, b, cp, dp); %システムの状態空間表現

%初期値応答の計算
y2 = initial(sys_s_fbk2,x0,t); %状態フィードバック系の初期値応答

%図14.2(b)のプロット
figure(2) %図のウィンドウを開く
plot(t,y2(:,1),t,y2(:,2)); %各状態を抽出してプロット
xlim([0 4]); %横軸（時間軸）の範囲の指定
ylim([-1.2 2]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('state'); %縦軸のラベル表示
legend('x_1(t)','x_2(t)'); %凡例の表示

%図14.3

u1 = - f1(1) * y1(:,1) - f1(2) * y1(:,2); %Case #-3の場合の入力の計算
u2 = - f2(1) * y2(:,1) - f2(2) * y2(:,2); %Case #-5の場合の入力の計算

%図14.3のプロット
figure(3) %図のウィンドウを開く
plot(t,u1,t,u2); %入力をプロット
xlim([0 4]); %横軸（時間軸）の範囲の指定
ylim([-5 20]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('u(t)'); %縦軸のラベル表示
legend('Case #-3', 'Case #-5'); %凡例の表示

%図14.5

y112 = power(y1(:,1),2); %Case #-3の場合のx_1の2乗の計算
y122 = power(y1(:,2),2); %Case #-3の場合のx_2の2乗の計算
y212 = power(y2(:,1),2); %Case #-5の場合のx_1の2乗の計算
y222 = power(y2(:,2),2); %Case #-5の場合のx_2の2乗の計算
u12 = power(u1,2); %Case #-3の場合の入力の2乗の計算
u22 = power(u2,2); %Case #-5の場合の入力の2乗の計算

%図14.5(a)のプロット
figure(4) %図のウィンドウを開く
plot(t,y112,t,y212); %プロット
xlim([0 2.5]); %横軸（時間軸）の範囲の指定
ylim([-0.2 1.2]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('x_1^2(t)'); %縦軸のラベル表示
legend('Case #-3', 'Case #-5'); %凡例の表示

%図14.5(b)のプロット
figure(5) %図のウィンドウを開く
plot(t,y122,t,y222); %プロット
xlim([0 2.5]); %横軸（時間軸）の範囲の指定
ylim([0 4]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('x_2^2(t)'); %縦軸のラベル表示
legend('Case #-3', 'Case #-5'); %凡例の表示

%図14.5(b)のプロット
figure(5) %図のウィンドウを開く
plot(t,u12,t,u22); %プロット
xlim([0 2.5]); %横軸（時間軸）の範囲の指定
ylim([0 200]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('u^2(t)'); %縦軸のラベル表示
legend('Case #-3', 'Case #-5'); %凡例の表示