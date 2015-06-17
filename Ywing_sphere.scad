
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

module attach_cylinder(t,r,h,hh)
{
  n=4;
  for (i = [0:n-1])
  {
    translate([r*sin(360*i/n), r*cos(360*i/n), -h+t/2])
      cylinder(h=hh, r=t, center=true);
  }
}

module attach_sphere(t,r,h)
{
  attach_cylinder(t,r,h,t);
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
difference()
{
  union()
  {
    difference()
    {
      nut_sphere(t,r,h);
      translate([-30,-30,5]) cube(60);
    }
    attach_sphere(t,r,h);
  }//union
  translate([0,0,-0.01])//0.01 for limits
    attach_cylinder(2,r+2,h,2*h);
}//diff
