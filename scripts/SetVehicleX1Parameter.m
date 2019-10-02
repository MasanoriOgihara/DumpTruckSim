% vehicle spec
vehicle.name = 'X1';
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
vehicle.Kug = vehicle.m *(vehicle.b/vehicle.Caf - vehicle.a/vehicle.Car)/(env.g * vehicle.L); % Understeer Gradient

% For plotting
vehicle.d =  1.63;% for plotting
vehicle.mu = env.mu;
vehicle.Ca = [vehicle.Caf/2, vehicle.Caf/2, vehicle.Car/2, vehicle.Car/2];

