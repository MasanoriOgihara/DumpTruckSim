% vehicle spec
vehicle.name = 'Niki';
vehicle.a = 1.2169;
vehicle.b = 1.4131;
vehicle.L = vehicle.a + vehicle.b;
vehicle.m = 1744;
vehicle.Izz = 2763.5;
vehicle.h = 0.5;
vehicle.Caf = 66000;
vehicle.Car = 60000;
vehicle.Cd0 = 218.06;
vehicle.Cd1 = 0.0;
vehicle.Cd2 = 0.0;
vehicle.deltaMax_rad = 32 * pi/180;
vehicle.Kug = vehicle.m *(vehicle.b/vehicle.Caf - vehicle.a/vehicle.Car)/(env.g * vehicle.L); % Understeer Gradient

% For plotting
vehicle.d =  1.63;% for plotting
vehicle.mu = env.mu;
vehicle.Ca = [vehicle.Caf/2, vehicle.Caf/2, vehicle.Car/2, vehicle.Car/2];
