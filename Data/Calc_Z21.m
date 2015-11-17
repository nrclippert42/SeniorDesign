function z21 = Calc_Z21(s11, s12, s21, s22, Zo)
% Transform s parameters into z21
z21 = Zo .* ((2*s21) ./ ((1 - s11).*(1 - s22) - s12.*s21));
end

