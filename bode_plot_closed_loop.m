clc
clear
close all

num = [-2.084e4 4.023e8];
den = [1 625 1.207e7];

G = tf(num,den);

Kp = 0;
Ki = 7.3324;

C = pid(Kp,Ki);

T = feedback(C*G,1);

figure
bode(T)
grid on
title('Closed Loop Frequency Response using PID Tuner')

figure
margin(C*G)
grid on
title('Gain Margin and Phase Margin using PID Tuner')

figure
step(T)
grid on
title('Closed Loop Step Response using PID Tuner')

disp('Closed-loop poles:')
pole(T)

disp('Closed-loop zeros:')
zero(T)

S = stepinfo(T);

fprintf('\n------ Time Domain Specifications ------\n');
fprintf('Rise Time       : %.6f s\n',S.RiseTime);
fprintf('Settling Time   : %.6f s\n',S.SettlingTime);
fprintf('Overshoot       : %.2f %%\n',S.Overshoot);
fprintf('Undershoot      : %.2f %%\n',S.Undershoot);
fprintf('Peak            : %.4f\n',S.Peak);
fprintf('Peak Time       : %.6f s\n',S.PeakTime);