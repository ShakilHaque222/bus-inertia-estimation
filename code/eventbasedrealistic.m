%% Time and Frequency Data
t = 0:0.01:10;                
f0 = 50;                    
fb = f0 - 0.2*exp(-t);      

%% RoCoF
dfdt = gradient(fb)./gradient(t);

%% Inertia Estimation
Sbase = 100;       
DeltaP = 0.05;     
Hb = (f0 * DeltaP) ./ (2 * Sbase * dfdt);

%% Filter Out Regions Where df/dt is Too Small
valid = abs(dfdt) > 0.01;      % keep only where RoCoF is meaningful

Hb_valid = Hb(valid);
t_valid = t(valid);

%% Plot Filtered Inertia
figure;
plot(t_valid, Hb_valid, 'LineWidth', 2);
title('Filtered Inertia Estimate (Valid Region Only)');
xlabel('Time (s)');
ylabel('H_b (seconds)');
grid on;
