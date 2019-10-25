% Set up our time increment and our vector (array) of x (time) values
deltaX = .1   % month
%x = seq(0,5,deltaX)
x = 0:deltaX:6;

% Constants
BTSbirthFraction = 0.2    % 1/month (BTS births per BTS adult per month)
WTSbirthFraction = 0.4    % 1/month (WTS births per WTS adult per month)
BTSdeathConstant = .30  % 1/WTS*month (BTS deaths per BTS per WTS per mo.)
WTSdeathConstant = .20  % 1/BTS*month (WTS deaths per WTS per BTS per mo.)
initBTSpop = 20         % sharks
initWTSpop = 20         % sharks

% Set up our stock variables and initial conditions. BTSpop is the number
%   of black-tip sharks at each time step, and WTSpop the number of white-
%   tip sharks.
BTSpop = zeros(length(x), 1)
BTSpop(1) = initBTSpop
WTSpop = zeros(length(x), 1)
WTSpop(1) = initWTSpop

% Loop a standard number of times, starting with i=2 since we've already
% set up the simulation's initial conditions at i=1.
for (i = 2:length(x))

    % Compute births/month and deaths/month for each type of shark.
    WTSbirthRate = WTSbirthFraction * WTSpop(i-1)
    BTSbirthRate = BTSbirthFraction * BTSpop(i-1)
    
    WTSdeathRate = WTSdeath`tant * WTSpop(i-1) * BTSpop(i-1)
    BTSdeathRate = BTSdeathConstant * BTSpop(i-1) * WTSpop(i-1)

    % Increase or decrease the population of each type of shark based on
    % the birth and death rates for this time step.
    WTSpop(i) = WTSpop(i-1) + (WTSbirthRate - WTSdeathRate) * deltaX
    BTSpop(i) = BTSpop(i-1) + (BTSbirthRate - BTSdeathRate) * deltaX
end

plot(x,WTSpop,x,BTSpop)


xlabel('Time')
ylabel('Population Size')
title('\it{Simulation of Shark Populations}','FontSize',16)
