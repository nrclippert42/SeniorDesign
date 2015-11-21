function z = ComplexNumber(mag, phase)
% takes a phase and magnitude and outputs a complex number
phase = phase * (pi/180);
z = mag.*exp(1i * phase);
end

