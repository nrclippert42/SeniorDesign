d = 0.01;                                                 %Plate distance
A = 25.4*(3/4);                                           %Inch to mm
omega = freq.*2.*pi;                                      %Omega conversion
Zin = (z11_cells - z12_cells)-((z11_air - z12_air)+(z11_PBS-z12_PBS));
Zp = (z12_cells - (z12_air + z12_PBS));
Zout = (z22_cells - z12_cells)-((z22_air - z12_air)+(z22_PBS - z12_PBS));

dielectric_Permittivity_Zin = Calc_dP(d,A,Zin);
dielectric_Permittivity_Zp = Calc_dP(d,A,Zp);
dielectric_Permittivity_Zout = Calc_dP(d,A,Zout);

figure
subplot(2,2,1)
scatter(freq,dielectric_Permittivity_Zin(omega));
title('Dielectric Permittivity \epsilon_{in}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
subplot(2,2,2)
scatter(freq,dielectric_Permittivity_Zp(omega));
title('Dielectric Permittivity \epsilon_{p}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');
subplot(2,2,3)
scatter(freq,dielectric_Permittivity_Zout(omega));
title('Dielectric Permittivity \epsilon_{out}');
xlabel('Frequency(Hz)');
ylabel('\epsilon');

figure
subplot(2,2,1)
scatter(freq,Calc_Conductivity(d,A,Zin));
title('Conductivity \sigma_{in}');
xlabel('Frequency(Hz)');
ylabel('\sigma');
subplot(2,2,2)
scatter(freq,Calc_Conductivity(d,A,Zp));
title('Conductivity \sigma_{p}');
xlabel('Frequency(Hz)');
ylabel('\sigma');
subplot(2,2,3)
scatter(freq,Calc_Conductivity(d,A,Zout));
title('Conductivity \sigma_{out}');
xlabel('Frequency(Hz)');
ylabel('\sigma');