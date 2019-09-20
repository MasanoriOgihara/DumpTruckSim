function plot_square_vehicle(E,N,psi,vehicle)

d = vehicle.d;
a = vehicle.a;
b = vehicle.b;

points_x = [d/2, -d/2, -d/2, d/2, d/2];
points_y = [  a,    a,   -b,  -b,   a];

Zin = [points_x; points_y];
Zoom = [1; 1];
Move = [E; N];
theta = psi;

Zout = trans2d(Zin,Zoom,Move,theta);
plot(Zout(1,:),Zout(2,:));

drawCog(E,N,psi,d/4);
end