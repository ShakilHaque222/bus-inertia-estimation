%% Parameters
Sbase = 100;        % MVA
DeltaP = 0.05;      % 5% load change (pu = 0.05)
f0 = 50;            % Nominal frequency

%% Inertia estimation
Hb = (f0 * DeltaP) ./ (2 * Sbase * dfdt);

figure;
plot(t, Hb, 'LineWidth', 2);
title('Estimated Inertia H_b (Event-Based)');
xlabel('Time (s)'); ylabel('Inertia H (seconds)');
grid on;
