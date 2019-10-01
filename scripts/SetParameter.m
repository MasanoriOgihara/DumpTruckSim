% Environment
env.g = 9.80665;
env.mu = 0.9;

% Vehicle
%vehicle = setVehicleX1Parameter();
vehicle = setVehicleNikiParameter();

% Simulation
sim.timestep_s = 0.001;
sim.endTime_s = 200.0;
sim.Ux0 = 15.0;
sim.Uy0 = 0;
sim.r0 = 0;
sim.E0 = -5;
sim.N0 = 400;
sim.psi0 = 3.148;

% Import World File
%world = importWorld('maps/curve_R12.0_L3R3_grade0_V5mps.world');
world = importWorld('maps/thill_east_whole.world'); % E0 = -4.8179, N0 = 398.7413, psi0 =  3.1480

% Set Steering Plant Parameter
SetSteeringPlantParameter;

% Set Controller Parameters
SetControllerParameter;