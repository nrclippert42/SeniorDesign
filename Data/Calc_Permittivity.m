function dielectric_Permittivity = Calc_Permittivity(d,A,Z,omega)
dielectric_Permittivity = imag((d)./(omega.*A.*Z));
end