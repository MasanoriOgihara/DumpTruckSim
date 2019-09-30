% Environment
env.g = 9.80665;
env.mu = 0.9;

% Vehicle
vehicle.a = 1.52;
vehicle.b = 1.35;
vehicle.L = vehicle.a + vehicle.b;
vehicle.m = 2000;
vehicle.Izz = 2400;
vehicle.h = 0.47;
vehicle.Caf = 150e3;
vehicle.Car = 220e3;
vehicle.Cd0 = 0;%241.0;
vehicle.Cd1 = 0;%25.1;
vehicle.Cd2 = 0.0;
vehicle.deltaMax_rad = 32 * pi/180;

% For plotting
vehicle.d =  1.63;% for plotting
vehicle.mu = env.mu;
vehicle.Ca = [vehicle.Caf/2, vehicle.Caf/2, vehicle.Car/2, vehicle.Car/2];

% Simulation
sim.timestep_s = 0.001;
sim.endTime_s = 20.0;
sim.Ux0 = 7.0;
sim.Uy0 = 0;
sim.r0 = 0;
sim.E0 = 0;
sim.N0 = 0;
sim.psi0 = 0;

% Import World File
world = importWorldFile('maps/curve_R12.0_L3R3_grade0_V5mps.world');

% Set Steering Plant Parameter
SetSteeringPlantParameter;

% Set Controller Parameters
SetControllerParameter;