function z11 = Calc_Z11(s11, s12, s21, s22, Zo)
% Transform s parameters into z11
z11 = Zo .* (((1 + s11).*(1 - s22) + s12.*s21) ./ ((1 - s11).*(1 - s22) - s12.*s21));
end

