omega = freq.*2.*pi;
A = 2*pi*(0.001905/2)^2;

Zin = (z11_cells - z12_cells);
Zp = (z12_cells);
Zout = (z22_cells - z12_cells);
Z_PBS_in = (z11_PBS - z12_PBS);
Z_PBS_p = (z12_PBS);
Z_PBS_out = (z22_PBS - z12_PBS);

dP_Zin = Calc_Permittivity(d,A,Zin,omega);
dP_Zp = Calc_Permittivity(d,A,Zp,omega);
dP_Zout = Calc_Permittivity(d,A,Zout,omega);
dP_Z_PBS_in = Calc_Permittivity(d,A,Z_PBS_in,omega);
dP_Z_PBS_p = Calc_Permittivity(d,A,Z_PBS_p,omega);
dP_Z_PBS_out = Calc_Permittivity(d,A,Z_PBS_out,omega);

c_Zin = Calc_Conductivity(d,A,Zin);
c_Zp = Calc_Conductivity(d,A,Zp);
c_Zout = Calc_Conductivity(d,A,Zout);

figure
subplot(3,1,1)
semilogy(freq,abs(dP_Zin),'-s',freq,abs(dP_Z_PBS_in),'-o');
title('Dielectric Permittivity \epsilon_{in}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
legend('Cell with PBS','PBS');

subplot(3,1,2)
semilogy(freq,abs(dP_Zp),'-s',freq,abs(dP_Z_PBS_p),'-o');
title('Dielectric Permittivity \epsilon_{p}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
legend('Cell with PBS','PBS');

subplot(3,1,3)
semilogy(freq,abs(dP_Zout),'-s',freq,abs(dP_Z_PBS_out),'-o');
title('Dielectric Permittivity \epsilon_{out}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
legend('Cell with PBS','PBS');

figure
subplot(3,1,1)
scatter(freq,c_Zin);
title('Conductivity \sigma_{in}');
xlabel('Frequency(Hz)');
ylabel('\sigma');

subplot(3,1,2)
scatter(freq,c_Zp);
title('Conductivity \sigma_{p}');
xlabel('Frequency(Hz)');
ylabel('\sigma');

subplot(3,1,3)
scatter(freq,c_Zout);
title('Conductivity \sigma_{out}');
xlabel('Frequency(Hz)');
ylabel('\sigma');