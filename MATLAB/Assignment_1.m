%  Institute: Indian Institute of Information Technology Nagpur
%  Laboratory: Wireless Communication
%  Engineer: Ar 
%  Create Date: 22.01.2024 16:41:17
%  Project Name: Sampling and Quantization of given signal 
%  Tool: Matlab

clc
clear all
close all

% take input of sampling frequency
fs = input('Enter sampling frequency: ');

% take input of signal frequency
f1 = input('Enter signal frequency: ');

% define time
t = 0:1/fs:1;

% define signal
x = 2*sin(2*pi*f1*t) + 5*cos(2*pi*f1*t);

% plot original signal
subplot(2, 2, 1)
plot(t, x)
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('Continuous Original Signal');

% plot discrete version of original signal
subplot(2, 2, 2)
stem(t, x)
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('Discrete Original Signal');

% extract time for sampling purpose
t1 = t(1:2:end);

% define signal for sampling
x1 = 2*sin(2*pi*f1*t1) + 5*cos(2*pi*f1*t1);

% plot sample signal with fewer samples
subplot(2, 2, 3)
plot(t1, x1)
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('Continuous Sampled Signal');

% plot discrete version of sampled signal
subplot(2, 2, 4)
stem(t1, x1)
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('Discrete Sampled Signal');

% extreme values of signal
x_max = max(x1);
x_min = min(x1);
xquan = x1 / x_max;

% number of quantization levels
n = 16;

% step size to accommodate n quantization levels
d = (x_max - x_min) / n;

% store values of levels for quantization purpose
q = (x_min:d:x_max);
q1 = zeros(1, n);

for ii = 1:n
    q1(ii) = (q(ii) + q(ii + 1)) / 2;
end

% quantize the signal and convert to decimal value
deci = zeros(size(x1));

for jj = 1:n
    indices = find((q1(jj) - d/2 <= x1) & (x1 <= q1(jj) + d/2));
    xquan(indices) = q1(jj) * ones(1, length(indices));
    deci(indices) = (jj - 1) * ones(1, length(indices));
end

% plot quantized signal
figure;
plot(t1, xquan);
xlabel('Time');
ylabel('Amplitude');
title('Quantized Signal');

% change decimal values of levels into binary numbers or encoded strings
bina = cell(size(deci));

for kk = 1:length(deci)
    bina{kk} = flip(de2bi(deci(kk), 4));
end
