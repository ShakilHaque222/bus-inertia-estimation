%% 1. Time and Frequency Data
t = 0:0.01:10;          % time vector
f0 = 50;                % nominal frequency
fb = f0 - 0.2*exp(-t);  % test frequency signal (replace with Simulink output)

%% 2. RoCoF Calculation
dfdt = gradient(fb)./gradient(t);

%% 3. Raw Inertia Estimate
Sbase  = 100;       % MVA
DeltaP = 0.05;      % pu

Hb = (f0 * DeltaP) ./ (2 * Sbase * dfdt);

%% 4. Filtering Step (VALID REGION)
threshold = 0.01;                   % RoCoF threshold
valid = abs(dfdt) > threshold;      % Keep only meaningful region

t_valid  = t(valid);
Hb_valid = Hb(valid);

%% 5. Compute realistic inertia (average of valid region)
H_est = mean(Hb_valid);             % OR median(Hb_valid)
disp("Realistic Estimated Bus Inertia = " + H_est + " seconds");

%% 6. Plot (Filtered)
figure;
plot(t_valid, Hb_valid, 'LineWidth', 2);
title('Filtered Inertia Estimate (Valid Region Only)');
xlabel('Time (s)');
ylabel('H_b (seconds)');
grid on;