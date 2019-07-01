%図8.4
clear all; close all;

%システムパラメータを与える
A = [0 1;0 0]; %行列A
b = [0;0]; %ベクトルb
c = [1 0;0 1]; %x_1とx_2をプロットするためにcを単位行列にする
d = [0;0]; %cに合わせてdは零ベクトルとする

%システムの状態空間表現を与える
sysP = ss(A,b,c,d); %状態空間表現

%システム行列Aの固有値を求める
eig(A) %システム行列Aの固有値

%時間変数の定義
t = 0:0.01:50; %0から50まで0.01刻み

%システムの初期値を与える
x0 = [1;1]; %x(0) = [1;1]'

%初期値応答の計算
y = initial(sysP,x0,t); %初期値応答を求める

%図8.4のプロット
plot(t,y(:,1),'-b',t,y(:,2),'-r'); %x_1とx_2を抽出してプロット
xlim([0 20]); %横軸（時間軸）の範囲の指定
ylim([0.0 50]); %縦軸の範囲の設定
grid; %罫線を表示
xlabel('time t[s]'); %横軸のラベル表示
ylabel('x_1(t),x_2(t)'); %縦軸のラベル表示
legend('x_1(t)','x_2(t)'); %凡例の表示
