
module inside_sphere(r,h)
{
/**/
  difference()
  {
    sphere(r);
    translate([0, 0, -r]) cube(r*2, center=true);
  }//diff
/**/
  translate([0, 0, -h/2])
			cylinder(h=h, r=r, center = true);
/**/
}

module outside_sphere(t,r,h)
{
  inside_sphere(r+t,h);
  for (i = [0:5])
  {
    translate([r*sin(360*i/6), r*cos(360*i/6), -h])
      cylinder(h=t, r=t*2, center=true);
  }
}

module nut_sphere(t,r,h)
{
  difference()
  {
    outside_sphere(t,r,h);
    inside_sphere(r,h);
  }//diff
}

r=54/2;
h=30;
t=4;
nut_sphere(t,r,h);
