function k = PlotPermittivity(z11, z12, z21, z22, freq, d)
%PLOTPERMITTIVITY Summary of this function goes here
%   Detailed explanation goes here
omega = freq.*2.*pi;
A = 2*pi*(25.4*(3/4)*(1/2))^2;

Zin = (z11 - z12);
Zp = (z12 - z12);
Zout = (z22 - z12);

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
end

