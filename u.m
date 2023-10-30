function u = u(f, offset)
    unitstep = zeros();
    unitstep(f>=(0 + offset)) = 1;
    u = unitstep;
end