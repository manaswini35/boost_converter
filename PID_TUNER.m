clc
clear
close all

% Plant Transfer Function
num = [-2.084e4 4.023e8];
den = [1 625 1.207e7];

G = tf(num,den);

% Open PID Tuner
pidTuner(G,'PI')