%% Virtual inertia allocation (greedy)
Hv = zeros(size(H_bus));
Budget = 3;    % total synthetic inertia available

[sorted, idx] = sort(DeltaH, 'descend');

for k = 1:length(idx)
    if Budget <= 0
        break;
    end
    
    need = DeltaH(idx(k));
    
    addH = min(need, Budget);
    Hv(idx(k)) = addH;
    
    Budget = Budget - addH;
end

disp('Virtual inertia allocation:');
disp(Hv);
H_updated = H_bus + Hv;

figure;
bar([H_bus' H_updated']);
legend('Original H', 'After H_v');
title('Improvement After Virtual Inertia Allocation');
ylabel('Inertia (s)');
