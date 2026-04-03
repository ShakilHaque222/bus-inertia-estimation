% --- Step 0: Define Bus Inertia Values ---
H_bus = [4.5 2.8 3.2 1.5 1.1 4.5 2.5 3.7 1.8];   % inertia values for 9 buses

% --- Step 1: Define Minimum Inertia ---
Hmin = 3.0;

% --- Step 2: Calculate Deficit ---
DeltaH = max(0, Hmin - H_bus);

% --- Step 3: Virtual Inertia Allocation (Greedy) ---
Hv = zeros(size(H_bus));     % initialize virtual inertia array
Budget = 3;                  % total available H_v budget

[sorted, idx] = sort(DeltaH, 'descend');   % sort deficits largest to smallest

for k = 1:length(idx)
    if Budget <= 0
        break;
    end
    need = DeltaH(idx(k));        % deficit at that bus
    addH = min(need, Budget);     % allocate only what is available
    Hv(idx(k)) = addH;            % assign virtual inertia
    Budget = Budget - addH;       % update remaining budget
end

% --- Step 4: Updated Inertia ---
H_updated = H_bus + Hv;

% Display results
disp('Virtual inertia allocated to each bus:');
disp(Hv);

disp('Updated inertia after allocation:');
disp(H_updated);
