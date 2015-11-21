function dielectric_Permittivity = Calc_Permittivity(d,A,Z,omega)
epsilon_0 = 8.854e-12;
dielectric_Permittivity = (d)./(epsilon_0*omega.*A.*imag(Z));
end