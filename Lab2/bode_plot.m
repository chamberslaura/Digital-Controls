clc;
close all;
clear;

numP = 2.2;
denP = [0.025, 1, 0];
P = tf(numP, denP);

numC = [2.2 215.6];
denC = [1 36];
C = tf(numC, denC);

S = 1;

sys = feedback(P*C, S);
bode(sys);

