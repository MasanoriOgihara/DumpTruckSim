% Environment
env.g = 9.80665;
env.mu = 0.9;

% Vehicle
SetVehicleX1Parameter();
%SetVehicleNikiParameter();
%SetVehicleTruckEParameter();

% Simulation
sim.timestep_s = 0.001;
sim.endTime_s = 15.0;
sim.Ux0 = 20.0;
sim.Uy0 = 0;
sim.r0 = 0;
sim.E0 = 160;
sim.N0 = 61;
sim.psi0 = 5.6;

% Import World File
%world = importWorld('maps/curve_R12.0_L3R3_grade0_V5mps.world'); % E0 = N0 = psi0 =  0
%world = importWorld('maps/thill_east_whole.world');     % E0 = -4.9, N0 = 399, psi0 =  3.15
world = importWorld('maps/thill_T4-8_V0.7_Add3m.world'); % E0 = 160, N0 = 61, psi0 = 5.6, Len 1214 m

% Set Steering Plant Parameter
SetSteeringPlantParameter;

% Set Controller Parameters
SetControllerParameter;