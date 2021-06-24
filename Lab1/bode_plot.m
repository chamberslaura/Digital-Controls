clc;
close all;
clear;

K = 2.2;
C = 4;
tau = 0.025;

num = [K*C];
den = [tau 1 K*C];
H = tf(num,den);

f = [3.141592654
    6.283185307
    15.70796327
    31.41592654
    62.83185307
    157.0796327
    314.1592654];

g = [1
    1
    0.977810475
    0.401070744
    0.132697121
    0.026997791
    0.0071276
];
    
p = [0
    -1.08
    -45
    -97.2
    -133.2
    -162
    -171
];

[mag,phase,wout] = bode(H);
mag_db = 20*log10(mag);

figure(1)
subplot(2,1,1)
semilogx(wout, squeeze(mag_db))
title('Gain vs. Frequency');
ylabel('Gain (dB)');
hold on
scatter(f,20*log10(g));
legend('Theoretical', 'Simulated');
hold off
grid
subplot(2,1,2)
semilogx(wout, squeeze(phase))
title('Phase vs. Frequency');
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
hold on
scatter(f,p);
legend('Theoretical', 'Simulated');
hold off
grid;

