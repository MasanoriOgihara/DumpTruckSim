% controller sample rate
cont.period = 0.05; % sec

% Steering
cont.x_la  = 5.0;
cont.k_fb =  -0.3;

% Speed PID
cont.k_p_speed = 1.0;
cont.k_i_speed = 0.0;
cont.k_d_speed = 0.0;
cont.speed_gain = 1;

% Speed To Accel (Fxr)
cont.accel_gain = 5e3;