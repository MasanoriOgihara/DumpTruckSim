% controller sample rate
cont.period = 0.01; % sec

% Steering Feedforward
cont.ffw_time_s = 0.5; % (sec)

% Steering Feedback
cont.x_la  = 10.0;
cont.k_p_steer = 0.1;
cont.k_i_steer = 0.0;
cont.k_d_steer = 0.0;

% Speed PID
cont.k_p_speed = 1.0;
cont.k_i_speed = 0.0;
cont.k_d_speed = 0.0;
cont.speed_gain = 1;

% Speed To Accel (Fxr)
cont.accel_gain = 5e3; 