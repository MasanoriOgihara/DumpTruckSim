function [x,y] = stability_parallelogram(mu,b,Ux,alpha_r)

g = 9.80665;

a = mu*g*b/(Ux*Ux);
yy = mu*g/Ux;

x = [ alpha_r + a;
     -alpha_r + a;
     -alpha_r - a;
      alpha_r - a;
      alpha_r + a ];
y = [yy;
     yy;
    -yy;
    -yy;
     yy ];
end

