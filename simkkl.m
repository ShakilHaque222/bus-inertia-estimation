function Pe = test()

delta = [0.1; 0.2; 0.15];
E = [1; 1; 1];
B = [0 5 0;
     5 0 4;
     0 4 0];

n = length(delta);
Pe = zeros(n,1);

for i = 1:n
    for j = 1:n
        if i ~= j
            Pe(i) = Pe(i) + E(i)*E(j)*B(i,j)*sin(delta(i)-delta(j));
        end
    end
end

end
