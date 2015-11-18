omega = freq.*2.*pi;

Zin = (z11_cells - z12_cells)-((z11_air - z12_air)+(z11_PBS-z12_PBS));
Zp = (z12_cells - (z12_air + z12_PBS));
Zout = (z22_cells - z12_cells)-((z22_air - z12_air)+(z22_PBS - z12_PBS));

dP_Zin = Calc_Permittivity(d,A,Zin,omega);
dP_Zp = Calc_Permittivity(d,A,Zp,omega);
dP_Zout = Calc_Permittivity(d,A,Zout,omega);

c_Zin = Calc_Conductivity(d,A,Zin);
c_Zp = Calc_Conductivity(d,A,Zp);
c_Zout = Calc_Conductivity(d,A,Zout);

figure
subplot(3,1,1)
scatter(freq,dP_Zin);
title('Dielectric Permittivity \epsilon_{in}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
subplot(3,1,2)
scatter(freq,dP_Zp);
title('Dielectric Permittivity \epsilon_{p}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
subplot(3,1,3)
scatter(freq,dP_Zout);
title('Dielectric Permittivity \epsilon_{out}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');

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