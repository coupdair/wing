
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

r=54/2;
h=3;
inside_sphere(r,h);

