
module inside_sphere(r,h)
{
/**/
  difference()
  {
    sphere(r);
    translate([0, 0, -r-0.01])//0.01 for limits
      cube(r*2, center=true);
  }//diff
/**/
  translate([0, 0, -h/2])
			cylinder(h=h, r=r, center = true);
/**/
}

module attach_cube(t,r,h)
{
  n=4;
  r=r+t/2;
  t=3*t;
  for (i = [0:n-1])
  {
    translate([r*sin(360*i/n), r*cos(360*i/n), -h+t/2])
      cube(t, center=true);
  }
}

module outside_sphere(t,r,h)
{
  union()
  {
  inside_sphere(r+t,h);
  attach_cube(t,r,h);
  }
}

module attach_sphere(t,r,h)
{
  n=4;
  for (i = [0:n-1])
  {
    translate([r*sin(360*i/n), r*cos(360*i/n), -h+t/2])
      cylinder(h=t, r=t, center=true);
  }
}

module nut_sphere(t,r,h)
{
  difference()
  {
    outside_sphere(t,r,h);
    translate([0,0,-0.01])//0.01 for limits
      inside_sphere(r,h);
  }//diff
}

r=54/2;
t=3;
h=t+3;
nut_sphere(t,r,h);
attach_sphere(t,r,h);
attach_sphere(t,r,2);
