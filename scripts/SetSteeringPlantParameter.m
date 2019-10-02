
%% Steering Plant Value
steer.a=0.8001;
steer.b=4.1656;
steer.c=3.6667;
steer.d=1.4888;
steer.e=0.6099;
%wheel base
steer.WHEEL_BASE=6.35;
steer.diffz=0.2517;
steer.cyl_init_length=1.5935;
steer.init_beta1=1.2537;
steer.omegaR=-0.255;
steer.f=0.7899;
steer.mp=10000;
steer.Ap=(0.165/2)^2*pi;
steer.alpha=0.75;
steer.Va0=(0.165/2)^2*pi*0.3967+0.001;
steer.Vb0=0.75*(0.165/2)^2*pi*0.2913+0.001;
steer.K=0.75e9;
steer.CL=0.01;
steer.xpmax=0.2612;
steer.xpmin=-0.3967;
steer.myu=0.9;
steer.Nt=10000;
steer.Cd=0.61;
steer.Ro=800;    

%steer.deltaRateMax_radps = 10/180*pi; % Slew rate (rad/s)
steer.deltaRateMax_radps = 60/180*pi; % Slew rate (rad/s)

stcont.MAX_STEERING_RAD = 0.593;% (34deg) %  0.533;% (30.5deg)
stcont.IGNORE_ANGLE_RAD = 0.000175; % 0.1 deg.