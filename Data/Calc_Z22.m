function z22 = Calc_Z22(s11, s12, s21, s22, Zo)
% Transform s parameters into z22
z22 = Zo .* (((1 - s11).*(1 + s22) + s12.*s21) ./ ((1 - s11).*(1 - s22) - s12.*s21));
end

