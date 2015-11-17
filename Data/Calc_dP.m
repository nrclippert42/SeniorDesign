function dielectric_Permittivity = Calc_dP(d,A,Z)
dielectric_Permittivity = @(omega)(d)./(omega.*A.*imag(Z));
end