function z12 = Calc_Z12(s11, s12, s21, s22, Zo)
% Transform s parameters into z12
z12 = Zo .* ((2*s12) ./ ((1 - s11).*(1 - s22) - s12.*s21));
end

