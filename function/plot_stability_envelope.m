function h = plot_stability_envelope(beta_rad,r_radps,UxMean,vehicle,veh_color,parallel_color)
h = plot(beta_rad, r_radps,'color',veh_color);
hold on;
%plot(t, Ux_mps,'b');
g= 9.80665;
m = vehicle.m;
a = vehicle.a;
b = vehicle.b;
L = vehicle.L;
mu = vehicle.mu;
Car = vehicle.Ca(3) + vehicle.Ca(4);
alpha_r_peak = atan2(3*mu*m*g*a, Car * L);
[x_stab,y_stab] = stability_parallelogram(mu,b,UxMean,alpha_r_peak);
plot(x_stab,y_stab,'color',parallel_color);

grid on;
xlabel('Beta [rad]');
ylabel('Yawrate [rad/s]');
title('Stability Envelope')
end