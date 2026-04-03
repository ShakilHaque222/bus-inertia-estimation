%% Frequency data example (replace with your Simulink output)
t = 0:0.01:10;                % time
f0 = 50;                      % nominal frequency
fb = f0 - 0.2*exp(-t);        % sample frequency dip (replace with f_bus output)

plot(t, fb); title('Bus Frequency'); xlabel('Time (s)'); ylabel('Hz');

%% RoCoF (df/dt)
dfdt = gradient(fb)./gradient(t);
figure; plot(t, dfdt); title('RoCoF (Hz/s)');
xlabel('Time (s)'); ylabel('df/dt');