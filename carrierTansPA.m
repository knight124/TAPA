Coupled = 1;
TwoCarriers = 1;
RC = 1;
line_exp =0;

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;
if (line_exp)
Nd = linspace(1e16,20e16,nx)* 1e6 ; % Const. 1/cm3 (100 cm/m)^3

else 
    
  Nd=  10^16*exp(2.996*10^6.*x)* 1e6;
end
NetDoping = ones(1,nx).*Nd; % doping
x0 = l/2;
nw = l/20;
npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

PlotYAxis = {[-0.05 0.05] [-2e6 2e6] [-2e4 2e4]...
    [0 2e23] [0 0.5e23] [0 20e44]...
    [-10e33 60e32] [-10e33 50e32] [-5e9 5e9] ...
    [-1e8 1e8] [-1e-2 1e-2] [0 21e22]};

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
