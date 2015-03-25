
module side_sphere()
{
   r=54/2;
	difference() {
		sphere(r);
		translate([0, 0, -r]) cube(r*2, center=true);
	}
}

side_sphere();

