%Low frequency
d = 0.002;
A = (0.001905/2)^2*pi;
omega = 2*pi*freq;

Z_cells = ComplexNumber(Z_mag_cells,Z_phase_cells);
Z_PBS = ComplexNumber(Z_mag_PBS,Z_mag_PBS);
Z_air = ComplexNumber(Z_mag_air,Z_mag_air);

dP_Z_cells = abs(Calc_Permittivity(d,A,Z_cells,omega));
dP_Z_PBS = abs(Calc_Permittivity(d,A,Z_PBS,omega));
dP_Z_air = abs(Calc_Permittivity(d,A,Z_air,omega));

loglog(freq,dP_Z_cells,'-s',freq,dP_Z_air,'-o');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
legend('Cells with PBS','PBS');