function dielectric_Permittivity = Calc_Permittivity(d,A,Z,omega)
dielectric_Permittivity = (d)./(omega.*A.*Z);
end