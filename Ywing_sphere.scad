
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
}


r=54/2;
h=3;
t=4;
difference()
{
  outside_sphere(t,r,h);
  inside_sphere(r,h);
}
