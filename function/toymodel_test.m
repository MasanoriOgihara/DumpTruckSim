x = -5:.01:5;
y1 = tan(x).*abs(tan(x));
y2 = tan(x).*tan(x).*sign(x);

plotyy(x,y1,x,y2);