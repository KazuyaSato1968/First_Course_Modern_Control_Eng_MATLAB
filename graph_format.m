%%　初期化
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(0, 'DefaultAxesLineWidth', 1); %軸の太さ
set(0, 'DefaultLineLineWidth', 4); %グラフ線の太さ
set(0, 'defaultAxesFontSize', 24); %軸のフォントの大きさ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% データの読み込み
t=0:pi/20:2*pi;
y1=sin(t);
y2=cos(t);

%% データをプロットしましょう
figure(1);

hold on;

plot(t,y1,'r',t,y2,'b');

xlim([0 2*pi])
ylim([-1 1])

xlabel('time \boldmath{$$t$$}[s]','interpreter','latex');
ylabel('\boldmath{$$y$$}[m]','interpreter','latex');

grid on;

leg = legend('$\sin \left(t \right)$','$\cos \left(t \right)$');
set(leg, 'Location','SouthWest', 'interpreter','latex');
