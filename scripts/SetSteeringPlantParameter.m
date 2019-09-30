
%% Steering Plant Value
truck_type = '930E';

if(strcmp(truck_type, '830E') > 0)
steer.a=0.7215;
steer.b=4.1209;
steer.c=3.6637;
steer.d=1.4878;
steer.e=0.5675;
steer.diffz=0.0701;
steer.cyl_init_length=1.5549;
steer.init_beta1=1.2484;
steer.omegaR=-0.23702;
steer.f=0.7899;
steer.mp=10000;
steer.Ap=(0.1524/2)^2*pi;
steer.alpha=0.75;
steer.Va0=(0.1524/2)^2*pi*0.3936+0.001;
steer.Vb0=0.75*(0.1524/2)^2*pi*0.2774+0.001;
steer.K=0.75e9;
steer.CL=0.01;
steer.xpmax=0.2491;
steer.xpmin=-0.3936;
steer.myu=0.9;
steer.Nt=10000;
steer.Cd=0.61;
steer.Ro=800;

elseif(strcmp(truck_type, '930E') > 0)
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

elseif(strcmp(truck_type, '960E') > 0)
steer.a=0.8001;
steer.b=4.191;
steer.c=3.6923;
steer.d=1.5127;
steer.e=0.60994;
steer.diffz=0.050;
steer.cyl_init_length=1.5957;
steer.init_beta1=1.2537;
steer.omegaR=-0.255;
steer.f=0.7899;
steer.mp=10000;
steer.Ap=(0.18/2)^2*pi;
steer.alpha=0.75;
steer.Va0=(0.18/2)^2*pi*0.3508+0.001;
steer.Vb0=0.75*(0.18/2)^2*pi*0.2913+0.001;
steer.K=0.75e9;
steer.CL=0.01;
steer.xpmax=0.2442;
steer.xpmin=-0.3508;
steer.myu=0.9;
steer.Nt=10000;
steer.Cd=0.61;
steer.Ro=800 ;   
end


stcont.MAX_STEERING_RAD = 0.593;% (34deg) %  0.533;% (30.5deg)
