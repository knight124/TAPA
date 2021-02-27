Coupled = 1;
TwoCarriers = 1;
RC = 1;

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

% ni = x < l/2;
% pi = x >= l/2;

Nd = linspace(4e16,2.48e14,100) * 1e6; % Const. 1/cm3 (100 cm/m)^3
Na = linspace(2.48e14,4e16,100) * 1e6;
NetDoping(1:100) = Nd;

NetDoping(102:201) = -Na;

x0 = l/2;
nw = l/20;
npDisturbance = 0e16*1e6*exp(-((x-x0)/nw).^2);

JBC = 1;

RVbc = 0;

TStop = 80000000*1e-18;
PlDelt = 1000000*1e-18;

Phi =  C.Vt *log(Na(100)*Nd(1)/(niSi*niSi));
W  = sqrt(2*EpiSi*(Nd(1)+Nd(1))*(Phi)/(C.q_0*Nd(1)*Na(100)));
Wn = W*Na(100)/(Nd(1)+Na(100));
Wp = (W - Wn);

LVbc = Phi;

PlotSS = 0;
PlotYAxis = {[0 Phi+0.1] [0e5 40e5] [-20e2 40e2]...
    [0e21 5e22] [0 5e22] [0 2e41]...
    [-5e33 5e33] [-5e33 5e33] [-0e8 3e8] ...
    [1e-3 4e8] [-2e7 1e9] [3.6e22 4.5e22]};
doPlotImage = 0;

SecondSim = 1;
LVbc2 = Phi-0.3;
TStop2 = TStop +  80000000*1e-18;

fprintf('Phi: %g W: %g Wn: %g Wp: %g \n',Phi,W,Wn,Wp) 
