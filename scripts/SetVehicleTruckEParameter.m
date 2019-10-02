% vehicle spec
vehicle.name = 'DT300t-Empty';
vehicle.a = 3.15;
vehicle.b = 3.20;
vehicle.L = vehicle.a + vehicle.b;
vehicle.m = 213000;
vehicle.Izz = 6630000;
vehicle.h = 0.93;
vehicle.Caf = 5.7e6 * 2;
vehicle.Car = 5.7e6 * 4;
vehicle.Cd0 = 0.0;
vehicle.Cd1 = 0.0;
vehicle.Cd2 = 0.0;
vehicle.deltaMax_rad = 32 * pi/180;
vehicle.Kug = vehicle.m *(vehicle.b/vehicle.Caf - vehicle.a/vehicle.Car)/(env.g * vehicle.L); % Understeer Gradient

% For plotting
vehicle.d =  7.50;% for plotting
vehicle.mu = env.mu;
vehicle.Ca = [vehicle.Caf/2, vehicle.Caf/2, vehicle.Car/2, vehicle.Car/2];

